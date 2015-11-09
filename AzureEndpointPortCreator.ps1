 #Begin MaestroPanel Script
 #Author: Ugur Civak
 #Email: ugur@maestropanel.com
$VmService = Read-Host  "Servis Ismini yazin"
$VmName = Read-Host  "VM Ismini yazin"
Get-AzureVM -ServiceName $VmService -Name $VmName | Add-AzureEndpoint -Name 'HTTP' -LocalPort 80 -PublicPort 80 -Protocol tcp | Update-AzureVM
Get-AzureVM -ServiceName $VmService -Name $VmName | Add-AzureEndpoint -Name 'HTTPS' -LocalPort 443 -PublicPort 443 -Protocol tcp | Update-AzureVM
Get-AzureVM -ServiceName $VmService -Name $VmName | Add-AzureEndpoint -Name 'FTP' -LocalPort 21 -PublicPort 21 -Protocol tcp | Update-AzureVM
Get-AzureVM -ServiceName $VmService -Name $VmName | Add-AzureEndpoint -Name 'DNSUDP' -LocalPort 53 -PublicPort 53 -Protocol udp | Update-AzureVM
Get-AzureVM -ServiceName $VmService -Name $VmName | Add-AzureEndpoint -Name 'DNSTCP' -LocalPort 53 -PublicPort 53 -Protocol tcp | Update-AzureVM
Get-AzureVM -ServiceName $VmService -Name $VmName | Add-AzureEndpoint -Name 'MYSQL' -LocalPort 3306 -PublicPort 3306 -Protocol tcp | Update-AzureVM
Get-AzureVM -ServiceName $VmService -Name $VmName | Add-AzureEndpoint -Name 'MSSQL' -LocalPort 1433 -PublicPort 1433 -Protocol tcp | Update-AzureVM
Get-AzureVM -ServiceName $VmService -Name $VmName | Add-AzureEndpoint -Name 'SMTP' -LocalPort 587 -PublicPort 587 -Protocol tcp | Update-AzureVM
Get-AzureVM -ServiceName $VmService -Name $VmName | Add-AzureEndpoint -Name 'SMTPo' -LocalPort 25 -PublicPort 25 -Protocol tcp | Update-AzureVM
Get-AzureVM -ServiceName $VmService -Name $VmName | Add-AzureEndpoint -Name 'POP3' -LocalPort 110 -PublicPort 110 -Protocol tcp | Update-AzureVM
Get-AzureVM -ServiceName $VmService -Name $VmName | Add-AzureEndpoint -Name 'IMAP' -LocalPort 143 -PublicPort 143 -Protocol tcp | Update-AzureVM
$vm = Get-AzureVM -ServiceName $VmService -Name $VmName
for ($i=9710; $i -le 9725; $i++)
{
    $EndpointName = "MaestroPanel_"
    $EndpointName += $i
    Add-AzureEndpoint -Name $EndpointName -Protocol "tcp" -PublicPort $i -LocalPort $i -VM $vm
}
Write-Host "Tamamlandi, Endpotintleri Kontrol Ediniz" -foregroundcolor black -backgroundcolor white
 #End MaestroPanel Script