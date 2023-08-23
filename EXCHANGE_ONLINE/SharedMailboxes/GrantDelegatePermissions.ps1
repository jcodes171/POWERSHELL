$Mailbox = "primaryemail@example.com"
$User = "user@example.com"

#Grant Full Access and automatically map the mailbox to the user's Outlook#
Add-MailboxPermission -Identity $Mailbox -User $User -AccessRights fullaccess -Automapping $true

#Grant Send As#
Add-RecipientPermission $Mailbox -AccessRights sendas -Trustee $User -confirm:$false

#Grant Send on Behalf#
Set-Mailbox $Mailbox -GrantSendOnBehalfTo @{add="$User"}