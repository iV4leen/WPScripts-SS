Write-Host ""
Write-Host -ForegroundColor Green "Tranquilo, estas en manos de expertos - @rthy" 
Write-Host ""

Write-Host 'Iniciando escaneo de eventos de Kernel PnP...' -ForegroundColor Yellow

try {
    Get-WinEvent -LogName "Microsoft-Windows-Kernel-PnP/Configuration" | Where-Object { $_.Id -eq 410 } | Out-File -FilePath "$env:USERPROFILE\Desktop\usb.log"
    Write-Host 'Eventos con ID 410 han sido registrados en usb.log' -ForegroundColor Green
} catch {
    Write-Host 'No se encontraron eventos con ID 410' -ForegroundColor Red
}
Write-Host ''
