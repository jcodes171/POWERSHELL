#######################################
Set-MailboxCalendarConfiguration -Identity room@example.com -WorkingHoursStartTime 07:00:00 -WorkingHoursEndTime 18:00:00 -WorkingHoursTimeZone "Central European Standard Time"
Set-mailboxcalendarconfiguration -Identity room@example.com -WorkDays Monday, Tuesday, Wednesday, Friday
Remove-MailboxFolderPermission -Identity room@example.com -User user@example.com