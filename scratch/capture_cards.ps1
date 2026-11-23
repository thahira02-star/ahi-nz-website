$browser = 'C:\Program Files\Google\Chrome\Application\chrome.exe'
$tempOut = [System.IO.Path]::Combine([System.IO.Path]::GetTempPath(), "wireframe_render.png")
if (Test-Path $tempOut) { Remove-Item $tempOut -Force }

$htmlUri = "file:///" + (Resolve-Path "C:\Users\gahir\OneDrive\Desktop\Thahira\ahi nz website\scratch\test_cards_wireframe.html").Path.Replace("\", "/")
$args = "--headless --disable-gpu --window-size=1440,550 --screenshot=""$tempOut"" ""$htmlUri"""

$p = Start-Process -FilePath $browser -ArgumentList $args -Wait -PassThru
Write-Host "Process exit code: $($p.ExitCode)"

if (Test-Path $tempOut) {
    Write-Host "Screenshot created at: $tempOut ($((Get-Item $tempOut).Length) bytes)"
    Copy-Item $tempOut "C:\Users\gahir\.gemini\antigravity\brain\8522ab89-e541-46c7-9438-3756446c7f10\wireframe_render.png" -Force
} else {
    Write-Host "Screenshot not found"
}
