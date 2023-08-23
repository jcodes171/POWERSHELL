#Bullk add user with FullAccess delegation permissions to multiple mailboxes#
$Mailboxes = Get-Content -Path C:\Users\user\folder\mb.txt 
$User = "user@example.com"
foreach ($Mailbox in $Mailboxes) {
#Grant full access delegation permissions and automatically map mailbox to user's Outlook#
Add-MailboxPermission -Identity $Mailbox -User $User -AccessRights fullaccess -Automapping $true
}


#Bullk add user with SendAs delegation permissions to multiple mailboxes#
$Mailboxes = Get-Content -Path C:\Users\user\folder\mb.txt 
$User = "user@example.com"
foreach ($Mailbox in $Mailboxes) {
#Grant SendAs delegation permissions#
Add-RecipientPermission $Mailbox -AccessRights sendas -Trustee $User -confirm:$false
}


#Bullk add user with SendOnBehalf  delegation permissions to multiple mailboxes#
$Mailboxes = Get-Content -Path C:\Users\user\folder\mb.txt 
$User = "user@example.com"
foreach ($Mailbox in $Mailboxes) {
#Grant SendOnBehalf delegation permissions#
Set-Mailbox $Mailbox -GrantSendOnBehalfTo @{add="$User"}
}