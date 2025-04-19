Write-Host ""
Write-Host "" 
Write-Host ""
Write-Host ""
Write-Host -ForegroundColor Green "Tranquilo, estas en manos de expertos - @rthy" 
Write-Host ""


Write-Host 'Escaneando archivos firmados incorrectamente...' -ForegroundColor Yellow
$path = "C:\Users"
$desktopPath = [System.IO.Path]::Combine($env:USERPROFILE, "Desktop", "Archivos_firmados_invalidos.txt")

Get-ChildItem -Recurse -Path $path -Include *.exe,*.dll,*.jar,*.bat,*.reg -ErrorAction SilentlyContinue |
    ForEach-Object { 
        Get-AuthenticodeSignature $_ -ErrorAction SilentlyContinue 
    } |
    Where-Object { $_.Status -ne "Valid" } |
    Select-Object Status, Path |
    Out-File -FilePath $desktopPath

Write-Host "Resultados guardados en el escritorio en 'Archivos_firmados_invalidos.txt'" -ForegroundColor Green
Write-Host ""
