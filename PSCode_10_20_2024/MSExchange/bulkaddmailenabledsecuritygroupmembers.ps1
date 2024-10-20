Add-DistributionGroupMember -Identity "test@example.com" -Member "user@example.com"


Connect-ExchangeOnline
Connect-MgGraph -Scopes "Directory.ReadWrite.All"

$users = Import-CSV -Path "C:\Users\User\Desktop\list.csv"

foreach ($user in $users) {
    $userPrincipalName = $user.UserPrincipalName
    Add-DistributionGroupMember -Identity "test@example.com" -Member $userPrincipalName
}



#Get User info#
Get-MgUser -UserId $userPrincipalName -Property UserPrincipalName, CompanyName, Department, JobTitle, EmployeeID, BusinessPhones | Select-Object UserPrincipalName, CompanyName, Department, JobTitle, EmployeeID, BusinessPhones 

#Bulk add users to mail enabled security group from CSV#
$users = Import-Csv -Path "C:\Users\User\Desktop\test.csv"
foreach ($user in $users) {
    $userPrincipalName = $user.UserPrincipalName
    Add-DistributionGroupMember -Identity "examplegroup@test.com" -Member $userPrincipalName
    Remove-DistributionGroupMember -Identity "examplegroup@test.com" -Member $userPrincipalName
}