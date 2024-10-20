#Bulk add users to SharePoint as site members#
$users = Import-Csv -Path "C:\Users\User\Desktop\text.csv"

foreach ($user in $users) {
    $userPrincipalName = $user.UserPrincipalName

    Add-SPOUser -Site https://contoso-admin.sharepoint.com/sites/IT -LoginName $userPrincipalName -Group "IT Members"
}

#Export site members for a site#
Get-SPOUser -Site https://contoso-admin.sharepoint.com/sites/IT | Export-CSV -Path "C:\Users\User\Desktop\ITmembers.csv"