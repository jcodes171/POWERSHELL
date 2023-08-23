#Set External Forwarding#
Set-Mailbox -Identity "mailbox@example.com"  -ForwardingSMTPAddress "externalemail@example.com" -DeliverToMailboxAndForward $false
Add-DistributionGroupMember -Identity "distributiongroup@example.com" -Member "user@example.com" -confirm:$false