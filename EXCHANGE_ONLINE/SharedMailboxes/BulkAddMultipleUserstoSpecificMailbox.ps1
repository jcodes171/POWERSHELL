#Bullk add users full access delegation permissions to specific mailbox#
$Mailbox = "mailbox@example.com"
$Users = "user@example.com","user1@example.com","user2@example.com","user3@example.com"
foreach ($User in $Users) {
Add-MailboxPermission -Identity $Mailbox -User $User -AccessRights fullaccess -Automapping $false
}

#Bullk add users send as delegation permissions to specific mailbox#
$Mailbox = "mailbox@example.com"
$Users = "user@example.com","user1@example.com","user2@example.com","user3@example.com"
foreach ($User in $Users) {
Add-RecipientPermission $Mailbox -AccessRights sendas -Trustee $User -confirm:$false
}


#Bullk add users send on behalf of delegation permissions to specific mailbox#
$Mailbox = "mailbox@example.com"
$Users = "user@example.com","user1@example.com","user2@example.com","user3@example.com"
foreach ($User in $Users) {
Set-Mailbox $Mailbox -GrantSendOnBehalfTo @{add="$User"}
}