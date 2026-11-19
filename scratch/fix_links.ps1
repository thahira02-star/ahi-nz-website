$path1 = "final output\index.html"
$content1 = [System.IO.File]::ReadAllText($path1, [System.Text.Encoding]::UTF8)
$content1 = $content1.Replace('href="href="#request-repair""', 'href="#request-repair"')
$content1 = $content1.Replace('            </div></div>', "            </div>`r`n          </div>")
[System.IO.File]::WriteAllText($path1, $content1, [System.Text.Encoding]::UTF8)

$path2 = "final output\predictive-maintenance.html"
$content2 = [System.IO.File]::ReadAllText($path2, [System.Text.Encoding]::UTF8)
$content2 = $content2.Replace('href="href="index.html#request-repair""', 'href="index.html#request-repair"')
$content2 = $content2.Replace('            </div></div>', "            </div>`r`n          </div>")
[System.IO.File]::WriteAllText($path2, $content2, [System.Text.Encoding]::UTF8)

Copy-Item -Path "final output\index.html" -Destination "index.html" -Force
Copy-Item -Path "final output\predictive-maintenance.html" -Destination "predictive-maintenance.html" -Force

Write-Output "Cleaned up and synchronized successfully!"

