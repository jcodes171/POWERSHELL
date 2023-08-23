#Bulk add calendar owners to an object/ room/ calendar/ resource#
$Mailbox = "mailbox@calendaremail.com"
$Users = Get-Content -Path C:\Users\user\folder\output.txt
$MB = $Mailbox + ":\Calendar"
foreach ($User in $Users) {
Add-MailboxFolderPermission -AccessRights owner -Identity $MB -User $user
}