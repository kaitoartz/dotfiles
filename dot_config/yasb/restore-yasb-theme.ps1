$dir = "{{ .chezmoi.homeDir }}\.config\yasb"
$styles = Join-Path $dir "styles.css"
$config = Join-Path $dir "config.yaml"
$stylesBak = Join-Path $dir "styles.css.backup"
$configBak = Join-Path $dir "config.yaml.backup"
$icons = Join-Path $dir "icons.css"
$markerStart = "/* ICONS-INJECTED START */"

function Restore-File($source, $target) {
    if (-not (Test-Path $source)) {
        Write-Host "Backup no existe: $source" -ForegroundColor Yellow
        return
    }
    Copy-Item -Path $source -Destination $target -Force
    Write-Host "Restored $target from $source" -ForegroundColor Green
}

function Ensure-Icons {
    if (-not (Test-Path $icons)) {
        Write-Host "No se encuentra icons.css: $icons" -ForegroundColor Red
        return
    }
    $s = Get-Content $styles -Raw -ErrorAction Stop
    $i = Get-Content $icons -Raw -ErrorAction Stop
    if ($s -notmatch [regex]::Escape($markerStart)) {
        Set-Content $styles ($i + "`n" + $s -replace "`r`n", "`n")
        Write-Host "Injected icons block into styles.css" -ForegroundColor Green
    } else {
        Write-Host "Icons block already present in styles.css" -ForegroundColor Cyan
    }
}

Restore-File $stylesBak $styles
Restore-File $configBak $config
Ensure-Icons
Write-Host "Restore complete. Restart Yasb if needed." -ForegroundColor Green
