#Delete Recurring Meetings (Remove -PreviewOnly to delete)#
Remove-CalendarEvents -Identity email@example.com -CancelOrganizedMeetings -QueryWindowInDays 360 -PreviewOnly