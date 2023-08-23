#Set Internal Forward#
Set-Mailbox -Identity "mailbox@example.com" -ForwardingAddress "mailbox@example.com" -DeliverToMailboxAndForward $false