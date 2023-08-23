#View user Trusted and Blocked Sender lists in Outlook#
Get-MailboxJunkEmailConfiguration user@example.com | Export-CSV - Path "C:\Users\user\folder\safeblockedlist.csv"