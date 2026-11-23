$browser = 'C:\Program Files\Google\Chrome\Application\chrome.exe'
$outFile = "$env:TEMP\importance_live.png"
$htmlUri = "file:///C:/Users/gahir/OneDrive/Desktop/Thahira/ahi nz website/final output/index.html"
& $browser --headless --disable-gpu --virtual-time-budget=3000 --window-size=1440,2500 "--screenshot=$outFile" "$htmlUri"
if (Test-Path $outFile) {
    Write-Host "Success! Screenshot exists at $outFile"
    Copy-Item $outFile "C:\Users\gahir\.gemini\antigravity\brain\8522ab89-e541-46c7-9438-3756446c7f10\importance_live.png" -Force
} else {
    Write-Host "File not created yet"
}
