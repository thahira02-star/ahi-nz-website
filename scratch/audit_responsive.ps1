param(
  [string[]]$Pages = @("index.html","chiller-maintenance.html","planned-hvac-maintenance.html","predictive-maintenance.html","preventative-maintenance.html"),
  [int[]]$Widths = @(1536, 1024, 900, 768, 480, 430, 390, 375, 360)
)

$chrome = "C:\Program Files\Google\Chrome\Application\chrome.exe"
$tmpDir = Join-Path $env:TEMP ("chrome_cdp_" + [guid]::NewGuid().ToString("N"))
New-Item -ItemType Directory -Path $tmpDir -Force | Out-Null

$proc = Start-Process -FilePath $chrome -ArgumentList @(
  "--headless=new",
  "--disable-gpu",
  "--no-first-run",
  "--no-default-browser-check",
  "--remote-debugging-port=9229",
  "--user-data-dir=$tmpDir",
  "about:blank"
) -PassThru -WindowStyle Hidden

try {
  $wsUrl = $null
  for ($i = 0; $i -lt 30; $i++) {
    Start-Sleep -Milliseconds 250
    try {
      $targets = Invoke-RestMethod -Uri "http://127.0.0.1:9229/json/list" -TimeoutSec 2
      $pageTarget = $targets | Where-Object { $_.type -eq "page" } | Select-Object -First 1
      if ($pageTarget) { $wsUrl = $pageTarget.webSocketDebuggerUrl; break }
    } catch {}
  }
  if (-not $wsUrl) { throw "Chrome CDP did not start" }

  $ws = New-Object System.Net.WebSockets.ClientWebSocket
  $ct = [System.Threading.CancellationToken]::None
  $ws.ConnectAsync([Uri]$wsUrl, $ct).GetAwaiter().GetResult() | Out-Null

  $script:msgId = 0
  function Send-CDP([string]$method, [hashtable]$params = @{}) {
    $script:msgId++
    $id = $script:msgId
    $payload = @{ id = $id; method = $method; params = $params } | ConvertTo-Json -Depth 10 -Compress
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($payload)
    $seg = New-Object System.ArraySegment[byte](,$bytes)
    $ws.SendAsync($seg, [System.Net.WebSockets.WebSocketMessageType]::Text, $true, $ct).GetAwaiter().GetResult() | Out-Null

    $buf = New-Object byte[] 65536
    while ($true) {
      $ms = New-Object System.IO.MemoryStream
      do {
        $rseg = New-Object System.ArraySegment[byte](,$buf)
        $res = $ws.ReceiveAsync($rseg, $ct).GetAwaiter().GetResult()
        $ms.Write($buf, 0, $res.Count)
      } while (-not $res.EndOfMessage)
      $txt = [System.Text.Encoding]::UTF8.GetString($ms.ToArray())
      $obj = $txt | ConvertFrom-Json
      if ($obj.id -eq $id) { return $obj }
    }
  }

  Send-CDP "Page.enable" | Out-Null
  Send-CDP "Runtime.enable" | Out-Null

  $jsAudit = @'
(() => {
  const vw = window.innerWidth;
  const sw = document.documentElement.scrollWidth;
  const offenders = [];
  const els = document.querySelectorAll('body *');
  for (const el of els) {
    const style = getComputedStyle(el);
    if (style.display === 'none' || style.visibility === 'hidden') continue;
    const r = el.getBoundingClientRect();
    if (r.width === 0 || r.height === 0) continue;
    if (r.right > vw + 2 || r.left < -2) {
      const id = el.id ? '#' + el.id : '';
      const cls = typeof el.className === 'string' && el.className.trim() ? '.' + el.className.trim().split(/\s+/).slice(0,2).join('.') : '';
      offenders.push(`${el.tagName.toLowerCase()}${id}${cls}[L:${Math.round(r.left)},R:${Math.round(r.right)},W:${Math.round(r.width)}]`);
      if (offenders.length >= 10) break;
    }
  }
  const navBar = document.querySelector('.main-navigation-bar');
  const navLinks = document.querySelector('.nav-links-menu');
  const mobBtn = document.querySelector('.mobile-menu-trigger');
  const utilBar = document.querySelector('.top-utility-bar');
  const navInfo = {
    utilDisplay: utilBar ? getComputedStyle(utilBar).display : 'none',
    utilOverflow: utilBar ? (utilBar.scrollWidth > vw) : false,
    linksDisplay: navLinks ? getComputedStyle(navLinks).display : 'none',
    linksHeight: navLinks ? Math.round(navLinks.getBoundingClientRect().height) : 0,
    mobDisplay: mobBtn ? getComputedStyle(mobBtn).display : 'none',
    navHeight: navBar ? Math.round(navBar.getBoundingClientRect().height) : 0
  };
  return JSON.stringify({ vw, sw, overflow: sw - vw, navInfo, offenders });
})()
'@

  foreach ($p in $Pages) {
    Write-Output "=== PAGE: $p ==="
    Send-CDP "Page.navigate" @{ url = "file:///c:/Users/gahir/OneDrive/Desktop/Thahira/ahi%20nz%20website/$p" } | Out-Null
    Start-Sleep -Milliseconds 700
    foreach ($w in $Widths) {
      Send-CDP "Emulation.setDeviceMetricsOverride" @{ width = $w; height = 900; deviceScaleFactor = 1; mobile = ($w -le 768) } | Out-Null
      Start-Sleep -Milliseconds 120
      $res = Send-CDP "Runtime.evaluate" @{ expression = $jsAudit; returnByValue = $true }
      $val = $res.result.result.value | ConvertFrom-Json
      $status = if ($val.overflow -gt 0) { "OVERFLOW +$($val.overflow)px" } else { "OK" }
      Write-Output ("  w={0,4}: sw={1,4} ({2}) | util={3}(ov:{4}) links={5}(h:{6}) mob={7} | off: {8}" -f $w, $val.sw, $status, $val.navInfo.utilDisplay, $val.navInfo.utilOverflow, $val.navInfo.linksDisplay, $val.navInfo.linksHeight, $val.navInfo.mobDisplay, ($val.offenders -join '; '))
    }
  }
} finally {
  if ($proc -and -not $proc.HasExited) { Stop-Process -Id $proc.Id -Force -ErrorAction SilentlyContinue }
  Remove-Item -Path $tmpDir -Recurse -Force -ErrorAction SilentlyContinue
}
