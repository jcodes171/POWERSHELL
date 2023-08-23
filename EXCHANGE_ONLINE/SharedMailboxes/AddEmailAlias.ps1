##################################################################################
######Add email address alias to Mailbox######
##################################################################################
Set-Mailbox -Identity "mailbox@example.com" -EmailAddresses SMTP:mailbox@example.com,smtp:alias@example.com