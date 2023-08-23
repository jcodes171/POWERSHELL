#Bulk add users to shared calendar from list/ .txt file#
$Mailbox = “calendarresource@contoso.com” 
$MB = $Mailbox + “:\Calendar” 
$collection = Get-Content 'C:\Users\user\folder\file.txt'

#Change Editor/Reviewer/Owner as needed#
foreach ($item in $collection) 
{
   Add-MailboxFolderPermission -AccessRights editor -Identity $MB -User $item 
}
