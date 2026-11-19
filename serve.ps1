$port = 8080
$listener = New-Object System.Net.Sockets.TcpListener([System.Net.IPAddress]::Loopback, $port)
$listener.Start()
Write-Host "HTTP server listening on http://127.0.0.1:$port/"

$dir = $PSScriptRoot
if (-not $dir) { $dir = Get-Location }

try {
    while ($true) {
        $client = $listener.AcceptTcpClient()
        $stream = $client.GetStream()
        $reader = New-Object System.IO.StreamReader($stream)
        $line = $reader.ReadLine()
        if (-not $line) {
            $client.Close()
            continue
        }
        $parts = $line.Split(' ')
        $method = $parts[0]
        $path = if ($parts.Length -gt 1) { $parts[1] } else { '/' }
        
        while (($header = $reader.ReadLine()) -and ($header.Trim() -ne '')) {}

        if ($path -eq '/' -or [string]::IsNullOrEmpty($path)) {
            $path = '/index.html'
        }
        $path = $path.Split('?')[0].TrimStart('/').Replace('/', [System.IO.Path]::DirectorySeparatorChar)
        $targetFile = Join-Path $dir $path

        if (Test-Path $targetFile -PathType Leaf) {
            $bytes = [System.IO.File]::ReadAllBytes($targetFile)
            $ext = [System.IO.Path]::GetExtension($targetFile).ToLower()
            $mime = switch ($ext) {
                '.html' { 'text/html; charset=utf-8' }
                '.css'  { 'text/css' }
                '.js'   { 'application/javascript' }
                '.json' { 'application/json' }
                '.png'  { 'image/png' }
                '.jpg'  { 'image/jpeg' }
                '.jpeg' { 'image/jpeg' }
                '.svg'  { 'image/svg+xml' }
                default { 'application/octet-stream' }
            }
            $headerText = "HTTP/1.1 200 OK`r`nContent-Type: $mime`r`nContent-Length: $($bytes.Length)`r`nConnection: close`r`n`r`n"
            $headerBytes = [System.Text.Encoding]::UTF8.GetBytes($headerText)
            $stream.Write($headerBytes, 0, $headerBytes.Length)
            $stream.Write($bytes, 0, $bytes.Length)
        } else {
            $notFound = "HTTP/1.1 404 Not Found`r`nContent-Length: 9`r`nConnection: close`r`n`r`nNot Found"
            $notFoundBytes = [System.Text.Encoding]::UTF8.GetBytes($notFound)
            $stream.Write($notFoundBytes, 0, $notFoundBytes.Length)
        }
        $stream.Flush()
        $client.Close()
    }
} finally {
    $listener.Stop()
}
