# Export user mailboxes for a specific domain to a CSV file
Get-EXOMailbox -Filter {RecipientTypeDetails -eq "UserMailbox" -and EmailAddresses -like "*example.com*"} -ResultSize Unlimited | Select DisplayName, PrimarySMTPAddress, Name | Export-Csv -Path "C:\Users\user\folder\domainusers.csv"
