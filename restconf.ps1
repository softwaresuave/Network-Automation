#script to get configuration information for all interfaces on a network device

$ip = Read-Host "Enter ip address of target device"
$endPnt = $ip + ':9443'
Write-Host "Enter Login Credentials to Device" -ForegroundColor Yellow
$user   = Read-Host "username"
$openPass = Read-Host "password"
$password = ConvertTo-SecureString "$openPass" -AsPlainText -Force 

$uri = "https://$endPnt/restconf/data/Cisco-IOS-XE-interfaces-oper:interfaces"
$Cred = New-Object System.Management.Automation.PSCredential ($user, $password)
$headers = @{'Accept' = 'application/yang-data+json' }
$response = Invoke-RestMethod -Uri $uri `
    -Method Get `
    -Authentication Basic `
    -Credential $Cred `
    -ContentType 'application/yang-data+json' `
    -Headers $headers `
    -SkipCertificateCheck

$response | ConvertTo-Json | Write-Output

foreach($int in $response){
    if ($int.'Cisco-IOS-XE-interfaces-oper:interface'.'admin-status' -eq 'if-state-up') {
        Write-Host ($int.'Cisco-IOS-XE-interfaces-oper:interface'.name)'is up' -ForegroundColor Green
    }
    else{
        Write-Host ($int.'Cisco-IOS-XE-interfaces-oper:interface'.name)'is down' -ForegroundColor Red
    }
}