#Scenario: User's inbox mail keeps being quarantined"
Get-MailboxJunkEmailConfiguration mailbox@example.com

#Verify that the user's "TrustedListsOnly" paramter is True or false in PowerShell (Set to False otherwise only emails from manually allowed senders will get through)#
Set-MailboxJunkEmailConfiguration mailbox@example.com -TrustedListsOnly $false