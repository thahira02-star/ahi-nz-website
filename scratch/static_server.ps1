param(
    [int]$Port = 8088,
    [string]$Root = "$PSScriptRoot\.."
)

$RootPath = [System.IO.Path]::GetFullPath($Root)
$Listener = New-Object System.Net.Sockets.TcpListener ([System.Net.IPAddress]::Any, $Port)

try {
    $Listener.Start()
    Write-Host "STATIC_SERVER_RUNNING on port $Port serving $RootPath"
} catch {
    Write-Error "Failed to start listener: $_"
    exit 1
}

$MimeTypes = @{
    ".html" = "text/html; charset=utf-8"
    ".htm"  = "text/html; charset=utf-8"
    ".css"  = "text/css; charset=utf-8"
    ".js"   = "application/javascript; charset=utf-8"
    ".png"  = "image/png"
    ".jpg"  = "image/jpeg"
    ".jpeg" = "image/jpeg"
    ".svg"  = "image/svg+xml"
    ".ico"  = "image/x-icon"
    ".json" = "application/json; charset=utf-8"
    ".webp" = "image/webp"
}

while ($true) {
    try {
        $Client = $Listener.AcceptTcpClient()
        $Stream = $Client.GetStream()
        $Reader = New-Object System.IO.StreamReader($Stream)
        
        $RequestLine = $Reader.ReadLine()
        if (-not $RequestLine) {
            $Client.Close()
            continue
        }
        
        $Tokens = $RequestLine.Split(' ')
        if ($Tokens.Length -lt 2) {
            $Client.Close()
            continue
        }
        
        $UrlPath = $Tokens[1].Split('?')[0]
        $UrlPath = [System.Uri]::UnescapeDataString($UrlPath)
        
        if ($UrlPath -eq "/" -or $UrlPath -eq "") {
            $UrlPath = "/index.html"
        }
        
        # Prevent path traversal
        $Relative = $UrlPath.TrimStart('/').Replace('/', '\')
        $FilePath = [System.IO.Path]::GetFullPath([System.IO.Path]::Combine($RootPath, $Relative))
        
        if (-not $FilePath.StartsWith($RootPath) -or -not (Test-Path $FilePath -PathType Leaf)) {
            $NotFoundBody = [System.Text.Encoding]::UTF8.GetBytes("404 Not Found")
            $Headers = "HTTP/1.1 404 Not Found`r`nContent-Type: text/plain`r`nContent-Length: $($NotFoundBody.Length)`r`nConnection: close`r`n`r`n"
            $HeaderBytes = [System.Text.Encoding]::ASCII.GetBytes($Headers)
            $Stream.Write($HeaderBytes, 0, $HeaderBytes.Length)
            $Stream.Write($NotFoundBody, 0, $NotFoundBody.Length)
        } else {
            $Ext = [System.IO.Path]::GetExtension($FilePath).ToLower()
            $ContentType = if ($MimeTypes.ContainsKey($Ext)) { $MimeTypes[$Ext] } else { "application/octet-stream" }
            $FileBytes = [System.IO.File]::ReadAllBytes($FilePath)
            $Headers = "HTTP/1.1 200 OK`r`nContent-Type: $ContentType`r`nContent-Length: $($FileBytes.Length)`r`nAccess-Control-Allow-Origin: *`r`nConnection: close`r`n`r`n"
            $HeaderBytes = [System.Text.Encoding]::ASCII.GetBytes($Headers)
            $Stream.Write($HeaderBytes, 0, $HeaderBytes.Length)
            $Stream.Write($FileBytes, 0, $FileBytes.Length)
        }
        
        $Stream.Flush()
        $Client.Close()
    } catch {
        # continue loop
    }
}
