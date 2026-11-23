$files = @("final output/predictive-maintenance.html", "predictive-maintenance.html")

foreach ($filePath in $files) {
  $lines = [System.IO.File]::ReadAllLines($filePath, [System.Text.Encoding]::UTF8)
  $newLines = [System.Collections.Generic.List[string]]::new()
  
  for ($i = 0; $i -lt $lines.Length; $i++) {
    $line = $lines[$i]
    if ($line.Trim() -eq ".equipment-metrics-list {") {
      # Check next few lines
      $newLines.Add("    .equipment-metrics-list {")
      $newLines.Add("      display: flex;")
      $newLines.Add("      flex-direction: column;")
      $newLines.Add("      gap: 6px;")
      $newLines.Add("      width: 100%;")
      $newLines.Add("      margin-top: auto;")
      $newLines.Add("    }")
      $newLines.Add("")
      $newLines.Add("    .equipment-chips-row {")
      $newLines.Add("      display: flex;")
      $newLines.Add("      flex-wrap: wrap;")
      $newLines.Add("      gap: 6px;")
      $newLines.Add("      width: 100%;")
      $newLines.Add("    }")
      
      # Skip until closing brace of .equipment-metrics-list
      while ($i -lt $lines.Length -and $lines[$i].Trim() -ne "}") {
        $i++
      }
      continue
    }
    $newLines.Add($line)
  }
  
  [System.IO.File]::WriteAllLines($filePath, $newLines, [System.Text.Encoding]::UTF8)
  Write-Host "Updated CSS in $filePath"
}
