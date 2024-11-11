#Connect to Exchange Online and MS Graph modules#
Connect-ExchangeOnline 
Connect-MgGraph -Scopes "Directory.ReadWrite.All"

#Bulk add users to mail enabled security group#
Add-DistributionGroupMember -Identity "mesgroup@example.com" -Member "first.last@example.com"

#Set DL Owner#
Set-DistributionGroup "mesgroup@example.com" -ManagedBy @{Add="user@example.com"} -BypassSecurityGroupManagerCheck

#Add/Remove DL Member#
Add-DistributionGroupMember -Identity "mesgroup@example.com" -Member "user@example.com"
Remove-DistributionGroupMember -Identity "mesgroup@example.com" -Member "user@example.com"

#Add user to group using graph#
Add-MgGroupMember -GroupId  "mesgroup@example.com" -DirectoryObjectId "user@example.com"