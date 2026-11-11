$archivoOrigen = Join-path $PSScriptRoot 'Origen\index.php'
$archivoDestino = Join-path $PSScriptRoot 'Pruebas\index.php'

& 'C:\xampp\php\php.exe' -l $archivoOrigen

If ($LASTEXITCODE -ne 0) {

    write-Host "Hay un error de sitaxis.NO se publico el cambio."
    exit 1
}
Copy-Item $archivoOrigen $archivoDestino -Force -ErrorAction Stop
Write-Host "Vercion Publicada en el ambiente de pruebas."
& 'C:\xampp\php\php.exe' -S localhost:8000 -t .\Pruebas
