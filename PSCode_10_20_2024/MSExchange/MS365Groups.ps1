#Remove Users from MS 365 group#
$users = "Import-Csv -Path C:\Users\User\Desktop\test.csv"

foreach ($user in $users) {
    $userPrincipalName = $user.UserPrincipalName
    Remove-UnifiedGroupLinks -Identity "Asset Management" -LinkType Members -Links $userPrincipalName -Confirm:$false
}