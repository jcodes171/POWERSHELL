#Add/ update mailbox aliases to existing account
set-mailbox mailbox@example.com -EmailAddresses mailbox@example.com, alias0@example.com, alias1@example.com, alias2@example.com, alias3@example.com

######OR######

$mailboxes = 'mailbox0@example.com', 'mailbox1@example.com', 'mailbox2@example.com', 'mailbox3@example.com', 'mailbox4@example.com'
Foreach ($mailbox in $mailboxes){Get-Recipient $mailbox | ? {$_.EmailAddresses -like "*@example.com"} | Set-Mailbox -Identity $mailbox -EmailAddresses @{remove=$mailbox}