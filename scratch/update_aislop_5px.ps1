$path = "aislop.md"
$content = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

$oldText = @"
### 3.4 Corner Radii & Elevation Philosophy

* **Corner Radii Token Scale:**
  * Small / Medium Controls & Cards: **`4px` – `5px`** (`--radius-sm: 5px`, `--radius-md: 5px`).
  * Pills / Status Badges: **`9999px`** (`--radius-full: 9999px`) — used *only* for filter chips, scope badges, and the top utility search bar.
  * **Strict Ban on Hyper-Rounded Cards:** Never give standard cards `16px`, `24px`, or `32px` corner radii. AHI Carrier's visual language is precise, architectural, and grounded.
"@

$newText = @"
### 3.4 Corner Radii & Elevation Philosophy

* **Corner Radii Token Scale:**
  * Small / Medium Controls & Cards: **`4px` – `5px`** (`--radius-sm: 5px`, `--radius-md: 5px`).
  * **Mandatory 5px Corner Radius Rule [USER-MANDATED]:** Every card container, card surface, and image corner radius must strictly be **`5px` at all times** (`border-radius: 5px;`). When client or design mockup examples display hyper-rounded corners (e.g. 16px, 20px, 24px), adapt and standardize them strictly to `5px` in compliance with the AHI Carrier design system.
  * Pills / Status Badges: **`9999px`** (`--radius-full: 9999px`) — used *only* for filter chips, scope badges, and the top utility search bar.
  * **Strict Ban on Hyper-Rounded Cards:** Never give standard cards `16px`, `24px`, or `32px` corner radii. AHI Carrier's visual language is precise, architectural, and grounded.
"@

$contentNorm = $content.Replace("`r`n", "`n")
$oldTextNorm = $oldText.Replace("`r`n", "`n")
$newTextNorm = $newText.Replace("`r`n", "`n")

if ($contentNorm.Contains($oldTextNorm)) {
    $contentNorm = $contentNorm.Replace($oldTextNorm, $newTextNorm)
    [System.IO.File]::WriteAllText($path, $contentNorm.Replace("`n", "`r`n"), [System.Text.Encoding]::UTF8)
    Write-Output "Successfully updated aislop.md with 5px mandate!"
} else {
    Write-Warning "Could not find oldTextNorm in aislop.md"
}

