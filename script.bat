# 1. Eliminar lo que no debe estar
chezmoi forget "$env:USERPROFILE\.config\yasb\yasb.log"
chezmoi forget "$env:USERPROFILE\.config\yasb\whkd_test.log"
chezmoi forget "$env:USERPROFILE\.gemini\config\projects"
chezmoi forget "$env:USERPROFILE\AppData\Roaming\Open Design\namespaces\release-stable-win\data\design-systems\navega-a-la-ruta-de-c-design-system"

# 2. Ir a la fuente
chezmoi cd

# 3. Renombrar archivos que necesitan templates
Rename-Item "dot_config\yasb\get-next-event.ps1" "get-next-event.ps1.tmpl"
Rename-Item "dot_config\yasb\icons.css" "icons.css.tmpl"
Rename-Item "dot_config\yasb\restore-yasb-theme.ps1" "restore-yasb-theme.ps1.tmpl"
Rename-Item "dot_config\yasb\watch-icons.ps1" "watch-icons.ps1.tmpl"
Rename-Item "dot_config\yasb\config.yaml.backup" "config.yaml.backup.tmpl"
Rename-Item "dot_agents\skills\develop-web-game\prompt.md" "prompt.md.tmpl"
Rename-Item "dot_gemini\config\skills\develop-web-game\prompt.md" "prompt.md.tmpl"

# 4. Volver al home
cd $env:USERPROFILE

# 5. Reemplazar en todos los .tmpl
 $files = @(
    "$env:USERPROFILE\.local\share\chezmoi\dot_config\yasb\get-next-event.ps1.tmpl",
    "$env:USERPROFILE\.local\share\chezmoi\dot_config\yasb\icons.css.tmpl",
    "$env:USERPROFILE\.local\share\chezmoi\dot_config\yasb\restore-yasb-theme.ps1.tmpl",
    "$env:USERPROFILE\.local\share\chezmoi\dot_config\yasb\watch-icons.ps1.tmpl",
    "$env:USERPROFILE\.local\share\chezmoi\dot_config\yasb\config.yaml.backup.tmpl",
    "$env:USERPROFILE\.local\share\chezmoi\dot_agents\skills\develop-web-game\prompt.md.tmpl",
    "$env:USERPROFILE\.local\share\chezmoi\dot_gemini\config\skills\develop-web-game\prompt.md.tmpl"
)

foreach ($f in $files) {
    if (Test-Path $f) {
        (Get-Content $f -Raw) -replace 'C:\\\\Users\\\\Carlos\.Ortiz', '{{ .chezmoi.homeDir }}' -replace 'C:/Users/Carlos\.Ortiz', '{{ .chezmoi.homeDir }}' -replace 'C:\\Users\\Carlos\.Ortiz', '{{ .chezmoi.homeDir }}' | Set-Content $f -NoNewline
        Write-Host "✅ $f" -ForegroundColor Green
    }
}