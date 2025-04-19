Write-Host ""
Write-Host "" 
Write-Host ""
Write-Host ""
Write-Host -ForegroundColor Green "Tranquilo, estas en manos de expertos - @rthy" 
Write-Host ""


Write-Host 'Escaneo de cambio de hora...' -ForegroundColor Yellow
try {
    Get-EventLog -LogName Security -InstanceId 4616 -ErrorAction Stop | Select -ExpandProperty TimeGenerated
} catch {
    Write-Host 'No se encontraron resultados' -ForegroundColor Red
}
Write-Host ''

Write-Host 'Escaneo de registros eliminados de Journal...' -ForegroundColor Yellow
Write-Host ''
try {
    Get-WinEvent -FilterHashtable @{LogName='Application'; Id=3079} -ErrorAction Stop | Select-Object -ExpandProperty TimeCreated
} catch {
    Write-Host 'No se encontraron registros...' -ForegroundColor Red
}
Write-Host ""
