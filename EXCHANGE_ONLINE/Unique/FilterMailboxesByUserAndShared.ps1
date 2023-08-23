#Filter mailboxes by user/ shared mailboxes#
Get-Mailbox -Filter {recipienttypedetails -eq "SharedMailbox"}
Get-Mailbox -Filter {recipienttypedetails -eq "UserMailbox"}