#Assign Calendar owner permissions to a specific user -- change as needed (owner/editor/reviewer)#
$MB = primaryemail@example.com + ":\Calendar"
Add-MailboxFolderPermission -AccessRights owner -Identity $MB -User user@example.com

#Bulk add users to shared calendar from list/ .txt file#
$Mailbox = “primaryemail@example.com” 
$MB = $Mailbox + “:\Calendar” 
$collection = Get-Content 'C:\Users\user\folder\userlist.txt'
foreach ($item in $collection) 
{
    #Assigns editor permissions#
   Add-MailboxFolderPermission -AccessRights editor -Identity $MB -User $item 
}