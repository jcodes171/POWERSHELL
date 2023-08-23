#Managing members and owners for DLs"
#Add Members
Add-DistributionGroupMember -Identity distributiongroup@example.com -Member "user@example.com" -confirm:$false

#Add Owner
Set-DistributionGroup -Identity distributiongroup@example.com -ManagedBy @{add="user@example.com"} 

#Remove Owner
Set-DistributionGroup distributiongroup@example.com -BypassSecurityGroupManagerCheck -ManagedBy @{Remove="user@example.com"}