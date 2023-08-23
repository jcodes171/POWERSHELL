#Get Distribution Lists for specific domain#
Get-DistributionGroup -Filter {EmailAddresses -like "*example.com*" -or EmailAddresses -like "*example.com*"} -ResultSize Unlimited | Select DisplayName,PrimarySMTPAddress, RequireSenderAuthenticationEnabled | Export-Csv -Path C:\Users\user\folder\dl.csv
