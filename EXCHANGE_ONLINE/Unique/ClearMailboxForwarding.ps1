#Clear Mailbox forwarding#
Set-Mailbox -Identity "mailbox@example.com" -DeliverToMailboxAndForward $false -ForwardingSMTPAddress $null -ForwardingAddress $null