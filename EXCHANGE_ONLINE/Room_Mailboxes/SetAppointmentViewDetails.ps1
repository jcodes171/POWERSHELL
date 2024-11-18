#Set View Details on appointments##
$email = "roomusershared@example.com"
$Cal = $email + ":\calendar"
Set-MailboxFolderPermission -Identity $Cal -User default -AccessRights LimitedDetails
Set-CalendarProcessing -Identity $email -AddOrganizerToSubject $true -DeleteComments $false -DeleteSubject $false
