#Connect to Exchange Online#
Connect-ExchangeOnline 

#Remove users from MS 365 Group#
$users = Import-Csv -Path "C:\Users\user\Desktop\txt.csv"

foreach ($user in $users) {
    $userPrincipalName = $users.UserPrincipalName
    Remove-UnifiedGroupLinks -Identity "Department" -LinkType Members -Links $userPrincipalName -Confirm:$false
}

#Hide group from GAL#
Get-UnifiedGroup -Identity "Department" | Set-UnifiedGroup -HiddenFromAddressListsEnabled $true

#Get 365 groups in Microsoft Tenant#
Get-UnifiedGroup | Select-Object DisplayName, EmailAddresses | Export-Csv -Path "C:\Users\user\Desktop\file.csv" -NoTypeInformation

#List MS 365 Group members - return member displayname and email#
$members = Get-UnifiedGroupLinks -Identity (Get-UnifiedGroup -Identity "[365GROUPID]").Identity -LinkType Members
$members | Select-Object DisplayName, PrimarySMTPAddress | Export-Csv -Path "C:\Users\user\Desktop\members.csv" -NoTypeInformation


###############################################################################################################################################
##########################################     Microsoft 365 group membership                 #################################################
###############################################################################################################################################

#Get members of 365 group#
Get-UnifiedGroupLinks -Identity "GroupName" -LinkType Member | Select-Object PrimarySMTPAddress | Export-Csv -Path "C:\Users\user\Desktop\file.csv"

#Update 365 group display name#
Set-UnifiedGroup
