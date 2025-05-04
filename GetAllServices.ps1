Write-Host ""
Write-Host -ForegroundColor Green "Tranquilo, estas en manos de expertos - @rthy" 
Write-Host ""

Write-Host "Iniciando análisis de servicios..." -ForegroundColor Yellow
Write-Host ""

$services = @(
    "pcasvc",
    "DPS",
    "sysmain",
    "eventlog",
    "bam",
    "Appinfo",
    "DusmSvc",
    "DiagTrack",
    "SgrmBroker",
    "DcomLaunch",
    "bfe",
    "Dnscache",
    "WSearch",
    "Schedule",
    "StorSvc"
)

foreach ($service in $services) {
    Write-Host "Verificando el servicio: $service" -ForegroundColor Green
    get-service | findstr -i $service

    Start-Sleep -Seconds 1
}

Write-Host ""
Write-Host "Análisis completo." -ForegroundColor Cyan
Write-Host ""
