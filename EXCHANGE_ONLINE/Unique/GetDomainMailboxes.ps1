#Get all mailboxes for specific domain
Get-EXOMailbox -Filter {EmailAddresses -like "*example.com*" -or EmailAddresses -like "*example.com*"} -ResultSize Unlimited | Select DisplayName , PrimarySMTPAddress, Name | Export-Csv -Path "C:\Users\user\folder\domainusers.csv"
