##############################################################################
##############################################################################
###Block All Meetings###
$Room = "Room@example.com"
Set-CalendarProcessing -Identity $Room -AllBookInPolicy $False -AllRequestInPolicy $False 
Set-Mailbox -Identity $Room -MailTip "The Room is Currently Unavailable"