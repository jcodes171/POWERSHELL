# Connect to Exchange Online PowerShell module
$UserCredential = Get-Credential
Connect-ExchangeOnline -UserPrincipalName $UserCredential.UserName -ShowProgress $true


# Disconnect from Exchange Online PowerShell module
Disconnect-ExchangeOnline -Confirm:$false