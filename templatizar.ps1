param (
    [Parameter(Mandatory=$true, Position=0)]
    [string]$RutaArchivoReal
)

# 1. Validar que el archivo exista en el mundo real
if (-not (Test-Path $RutaArchivoReal)) {
    Write-Error 'Error: El archivo no existe en esa ruta. Revisa bien.'
    exit
}

# 2. Leer el contenido del archivo real
 $contenido = Get-Content -Raw $RutaArchivoReal

# 3. Reemplazos magicos automaticos (Rutas)
 $userHomeEscapado = [regex]::Escape($env:USERPROFILE)

# Reemplaza C:\Users\Carlos.Ortiz (barras normales)
 $contenido = $contenido -replace $userHomeEscapado, '{{ .chezmoi.homeDir }}'

# Reemplaza C:/Users/Carlos.Ortiz (barras de estilo URL que a veces mete el JSON)
 $userHomeForwardSlash = $userHomeEscapado -replace '\\', '/'
 $contenido = $contenido -replace $userHomeForwardSlash, '{{ .chezmoi.homeDir }}'

# 4. Reemplazos magicos automaticos (API Keys Dinamicas)
# Busca claves que terminen en _KEY, _TOKEN o _SECRET.
# $1 tomara automaticamente el nombre de la variable y lo inyectara en la plantilla
 $regexCredenciales = '(?<="((?:.*_)?(?:API_KEY|TOKEN|SECRET))"\s*:\s*")[^"]+(?=")'
 $contenido = $contenido -replace $regexCredenciales, '{{ .$1 }}'

# 5. Ir al mundo fuente usando comandos nativos de Chezmoi
 $targetTmplRaw = chezmoi source-path $RutaArchivoReal

if (-not $targetTmplRaw) {
    Write-Error "Error: Ese archivo no esta bajo el control de Chezmoi. Haz un chezmoi add primero."
    exit
}

# REPARACION DE BARRAS: Convertimos todos los '/' en '\' para que Windows no llore
 $targetTmpl = $targetTmplRaw -replace '/', '\'

# 6. Validar existencia y sobrescribir
if (Test-Path -LiteralPath $targetTmpl) {
    
    if ($targetTmpl -notmatch '\.tmpl$') {
        Write-Warning "Alerta: El archivo en la fuente no tiene extension .tmpl. Se sobrescribira de todas formas."
    }

    # Inyectamos el contenido modificado en la plantilla
    Set-Content -LiteralPath $targetTmpl -Value $contenido -NoNewline
    Write-Host "Exito: El template se actualizo automaticamente." -ForegroundColor Green
    Write-Host "Recuerda definir las nuevas variables en tu archivo chezmoi.toml" -ForegroundColor Cyan
    
} else {
    Write-Warning "No se encontro el archivo fuente en: $targetTmpl"
}