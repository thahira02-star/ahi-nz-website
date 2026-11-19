$path = "final output\index.html"
$content = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

# 1. Update .hero-section CSS
$oldHero = @"
    .hero-section {
      position: relative;
      width: 100%;
      min-height: 505px;
      background-color: var(--ahi-navy-primary);
      background-image: 
        linear-gradient(90deg, rgba(10, 24, 45, 0.92) 0%, rgba(10, 24, 45, 0.82) 42%, rgba(10, 24, 45, 0.3) 75%, rgba(10, 24, 45, 0) 100%),
        url('Reference files/hero section bg.png');
      background-position: center right;
      background-size: cover;
      background-repeat: no-repeat;
      display: flex;
      align-items: center;
      padding: 70px 0;
    }

    .hero-content-column {
      max-width: 620px;
      color: var(--ahi-white);
    }
"@

$newHero = @"
    .hero-section {
      position: relative;
      width: 100%;
      height: 560px;
      min-height: 560px;
      background-color: var(--ahi-navy-primary);
      background-image: 
        linear-gradient(90deg, rgba(10, 24, 45, 0.92) 0%, rgba(10, 24, 45, 0.82) 42%, rgba(10, 24, 45, 0.3) 75%, rgba(10, 24, 45, 0) 100%),
        url('Reference files/hero section bg.png');
      background-position: center right;
      background-size: cover;
      background-repeat: no-repeat;
      display: flex;
      align-items: center;
      padding: 40px 0;
      box-sizing: border-box;
    }

    .hero-content-column {
      max-width: 620px;
      color: var(--ahi-white);
    }

    .hero-eyebrow-nav {
      margin-bottom: 18px;
    }

    .hero-breadcrumb-list {
      display: flex;
      align-items: center;
      flex-wrap: wrap;
      gap: 8px;
      list-style: none;
      padding: 0;
      margin: 0;
      font-family: 'Montserrat', sans-serif;
      font-size: 13.5px;
      font-weight: 500;
      color: #FFFFFF;
      line-height: 1.4;
    }

    .hero-breadcrumb-link {
      color: rgba(255, 255, 255, 0.85);
      text-decoration: none;
      transition: color 0.2s ease;
    }

    .hero-breadcrumb-link:hover {
      color: #FFFFFF;
      text-decoration: underline;
    }

    .hero-breadcrumb-sep {
      color: rgba(255, 255, 255, 0.55);
      user-select: none;
      font-size: 13px;
    }

    .hero-breadcrumb-current {
      color: #FFFFFF;
      font-weight: 600;
    }
"@

if ($content.Contains($oldHero)) {
    $content = $content.Replace($oldHero, $newHero)
    Write-Host "Updated Hero CSS"
} else {
    Write-Host "Old Hero CSS not matched directly, trying normalized"
    # normalize CRLF
    $normContent = $content.Replace("`r`n", "`n")
    $normOldHero = $oldHero.Replace("`r`n", "`n")
    $normNewHero = $newHero.Replace("`r`n", "`n")
    if ($normContent.Contains($normOldHero)) {
        $content = $normContent.Replace($normOldHero, $normNewHero).Replace("`n", "`r`n")
        Write-Host "Updated Hero CSS via normalized CRLF"
    } else {
        Write-Host "ERROR: Hero CSS still not found"
    }
}

# 2. Update Hero HTML (insert breadcrumb navigation)
$oldHeroHtml = @"
        <h1 id="hero-main-title" class="hero-heading">Emergency HVAC Repair</h1>
"@

$newHeroHtml = @"
        <nav class="hero-eyebrow-nav" aria-label="Breadcrumb">
          <ol class="hero-breadcrumb-list">
            <li class="hero-breadcrumb-item"><a href="#" class="hero-breadcrumb-link">Home</a></li>
            <li class="hero-breadcrumb-sep" aria-hidden="true">/</li>
            <li class="hero-breadcrumb-item"><a href="#" class="hero-breadcrumb-link">Commercial</a></li>
            <li class="hero-breadcrumb-sep" aria-hidden="true">/</li>
            <li class="hero-breadcrumb-item"><a href="#" class="hero-breadcrumb-link">Maintenance &amp; Lifestyle</a></li>
            <li class="hero-breadcrumb-sep" aria-hidden="true">/</li>
            <li class="hero-breadcrumb-item hero-breadcrumb-current" aria-current="page">Emergency HVAC Repair</li>
          </ol>
        </nav>
        <h1 id="hero-main-title" class="hero-heading">Emergency HVAC Repair</h1>
"@

$content = $content.Replace($oldHeroHtml, $newHeroHtml)
Write-Host "Updated Hero HTML"

# 3. Update Hero Media Query at max-width 768px
$oldHeroMedia = @"
      .hero-section {
        min-height: auto;
        padding: 44px 0;
      }
"@

$newHeroMedia = @"
      .hero-section {
        height: auto;
        min-height: 500px;
        padding: 40px 0;
      }
      .hero-breadcrumb-list {
        font-size: 12px;
        gap: 6px;
      }
"@

$content = $content.Replace($oldHeroMedia, $newHeroMedia)
Write-Host "Updated Hero Media Query"

# 4. Update section paddings
# .section-what-is { background-color: var(--ahi-white); padding: 62px 0; }
$content = $content.Replace("padding: 62px 0;", "padding: 40px 0;")
# .section-reasons-trust { background-color: var(--ahi-white); padding: 0 0 62px 0; }
# .section-emergencies { background-color: var(--ahi-white); padding: 0 0 62px 0; }
$content = $content.Replace("padding: 0 0 62px 0;", "padding: 0 0 40px 0;")

# Also update section comments "Spacing: Exactly 62px vertical spacing" -> "Spacing: Exactly 40px vertical spacing"
$content = $content.Replace("Spacing: Exactly 62px vertical spacing", "Spacing: Exactly 40px vertical spacing")

[System.IO.File]::WriteAllText($path, $content, [System.Text.Encoding]::UTF8)
Write-Host "Successfully saved $path"
