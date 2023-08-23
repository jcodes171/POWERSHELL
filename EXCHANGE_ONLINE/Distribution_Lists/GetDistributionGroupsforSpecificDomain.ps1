#Get distribution lists for a domain (change csv path accordingly):
Get-DistributionGroup -Filter {EmailAddresses -like "*example.com*" -or EmailAddresses -like "*example.com*"} -ResultSize Unlimited| Select DisplayName , PrimarySMTPAddress | Export-CSV -Path "C:\Users\user\folder\domaindistributionlists.csv"
