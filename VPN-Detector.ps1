Clear-Host
$ErrorActionPreference = "SilentlyContinue"

Write-Host ""
Write-Host -ForegroundColor Green "Tranquilo, estas en manos de expertos - @rthy" 
Write-Host ""


$ip = (Invoke-WebRequest -Uri "https://ifconfig.me/ip" -UseBasicParsing).Content.Trim()

$response = Invoke-WebRequest -Uri "https://proxycheck.io/v2/$ip?vpn=1&asn=1" -UseBasicParsing
$data = ($response.Content | ConvertFrom-Json)."${ip}"

$maskedIp = $ip -replace '\d{1,3}$', '***'

Write-Host "IP Pública: $maskedIp" -ForegroundColor Yellow
Write-Host ""

Write-Host "Resultado:" -ForegroundColor Gray

if ($data.proxy -eq "yes") {
    Write-Host " • Proxy/VPN detectado: " -NoNewline; Write-Host "$($data.proxy)" -ForegroundColor Red
} else {
    Write-Host " • Conexión limpia. No se detectó Proxy/VPN." -ForegroundColor Green
}

Write-Host " • ISP: $($data.isp)"
Write-Host " • ASN: $($data.asn)"
Write-Host " • País: $($data.country)"
Write-Host ""
