$dir = "{{ .chezmoi.homeDir }}\.config\yasb"
$styles = Join-Path $dir "styles.css"
$icons = Join-Path $dir "icons.css"
$markerStart = "/* ICONS-INJECTED START */"

function Ensure-Icons {
    $s = Get-Content $styles -Raw -ErrorAction Stop
    $i = Get-Content $icons -Raw -ErrorAction Stop
    if ($s -notmatch [regex]::Escape($markerStart)) {
        # Prepend icons block so siempre quede primero y no lo borre el theme
        Set-Content $styles ($i + "`n" + $s -replace "`r`n", "`n")
        Write-Host "Icons block injected into styles.css at $(Get-Date)."
    }
}

# Run once now
Ensure-Icons

$fsw = New-Object System.IO.FileSystemWatcher $dir, "styles.css"
$fsw.NotifyFilter = [System.IO.NotifyFilters]::LastWrite
$action = { Start-Sleep -Milliseconds 200; Ensure-Icons }
Register-ObjectEvent $fsw Changed -Action $action | Out-Null

Write-Host "Watching $styles for external changes. Press Ctrl+C to stop."
while ($true) { Start-Sleep -Seconds 3600 }