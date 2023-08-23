#Enable Room Resource Calendar to show more details for scheduled meetings#
$Mailbox = “calendar@example.com” 
$MB = $Mailbox + “:\Calendar” 
Set-MailboxFolderPermission -Identity $MB -User default -AccessRights LimitedDetails