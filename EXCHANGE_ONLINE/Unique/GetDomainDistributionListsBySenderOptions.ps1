#Get Distribution Lists for specific domain and sort by Sender Options#
Get-DistributionGroup -Filter {EmailAddresses -like "*example.com*" -or EmailAddresses -like "*example.com*"} -ResultSize Unlimited | Where {$_.RequireSenderAuthenticationEnabled -eq $True} | Select DisplayName,PrimarySMTPAddress, RequireSenderAuthenticationEnabled

