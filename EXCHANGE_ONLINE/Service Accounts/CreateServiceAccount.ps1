######################################
###Create Service Account###
######################################
$email = "email@example.com"
$DN = "DisplayName"
$Alias = "emailalias"
$orgrespective = $Alias + "@onmicrosoft.com"
##Change password for each entry##
$newPassword="password123"

New-Mailbox -Shared -Name $DN -DisplayName $DN -Alias $Alias

Set-Mailbox $DN -EmailAddresses $email , $orgrespective
Start-Sleep -Seconds 60
Set-MSOLUserPassword -UserPrincipalName $orgrespective -NewPassword $newPassword  -ForceChangePassword $false
Get-MsolUser –UserPrincipalName $orgrespective | Set-MsolUser –PasswordNeverExpires $True

Write-Host "Email  - $email"
Write-Host "Username  - $orgrespective"
Write-Host "Password  - $newPassword"

#Set Password - change $newPassword for every new account
$orgrespective = "emailalias@onmicrosoft.com"
$newPassword="password123"

Set-MSOLUserPassword -UserPrincipalName $orgrespective -NewPassword $newPassword  -ForceChangePassword $false
Get-MsolUser –UserPrincipalName $orgrespective | Set-MsolUser –PasswordNeverExpires $True
Write-Host "Username:$orgrespective - Password:$newPassword"