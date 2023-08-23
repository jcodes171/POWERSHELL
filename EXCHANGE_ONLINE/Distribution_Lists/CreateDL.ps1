#Create new distribution group#
$DN = "Contoso - Example DL"
$Alias = "something@example.com"
$Email = "something@example.com"
$Owner = "user@example.com"

New-DistributionGroup -DisplayName $DN -Name $DN -Alias $Alias -RequireSenderAuthenticationEnabled:$false -PrimarySMTPAddress $Email -Managedby $Owner
