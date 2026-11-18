param(
    [string]$RutaPHP = "php"
)

$archivoOrigen  = Join-Path $PSScriptRoot 'Origen\index.php'
$archivoDestino = Join-Path $PSScriptRoot 'Pruebas\index.php'

# Verificar sintaxis del PHP
& $RutaPHP -l $archivoOrigen

if ($LASTEXITCODE -ne 0) {
    Write-Host "Hay un error de sintaxis. NO se publicó el cambio."
    exit 1
}

# Copiar a la carpeta de pruebas
Copy-Item $archivoOrigen $archivoDestino -Force -ErrorAction Stop
Write-Host "Versión publicada en el ambiente de pruebas."

# (Opcional) No levantes el servidor en CI, solo verifica y copia
# & $RutaPHP -S localhost:8000 -t .\Pruebas