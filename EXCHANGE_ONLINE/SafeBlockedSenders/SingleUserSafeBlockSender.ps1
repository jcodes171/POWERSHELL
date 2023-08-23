#For individual users/ one off solutions to adding sender address to user Safe Sender/ Blocked Sender list#
#Add sender address to Safe Sender List#
Set-MailboxJunkEmailConfiguration -Identity user@example.com -TrustedSendersAndDomains @{Add="senderemail@sender.com"}

#Add sender address to Blocked Sender List#
Set-MailboxJunkEmailConfiguration -Identity user@example.com -BlockedSendersAndDomains @{Add="senderemail@sender.com"}
