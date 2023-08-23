#Retrieve all distribution list groups a user is a member of#
$Username = "user@example.com"
$DistributionGroups= Get-DistributionGroup | where { (Get-DistributionGroupMember $_.Name | foreach {$_.PrimarySmtpAddress}) -contains "$Username"}