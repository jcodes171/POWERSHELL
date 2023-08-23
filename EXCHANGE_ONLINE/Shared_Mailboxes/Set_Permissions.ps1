$Mailbox = "sharedmailbox@example.com"
$User = "user@example.com"

Add-MailboxPermission -Identity $Mailbox -User $User -AccessRights fullaccess -Automapping $true
Add-RecipientPermission $Mailbox -AccessRights sendas -Trustee $User -confirm:$false
Set-Mailbox $Mailbox -GrantSendOnBehalfTo @{add="$User"}

###############################################################
###Bulk add multiple users as delegates to specific mailbox####
###############################################################
$Mailbox = "sharedmailbox@example.com"
$Users = "user1@example.com","user2@example.com","user3@example.com"

foreach ($User in $Users) {
    Add-MailboxPermission -Identity $Mailbox -User $User -AccessRights fullaccess -Automapping $true
    Add-RecipientPermission $Mailbox -AccessRights sendas -Trustee $User -confirm:$false
    Set-Mailbox $Mailbox -GrantSendOnBehalfTo @{add="$User"}
}

##################################################################################
###Bullk add user with full access delegation permissions to multiple mailboxes###
##################################################################################
$Mailboxes ="mailbox1@example.com","mailbox2@example.com","mailbox3@example.com"
$User = "user1@example.com"
foreach ($Mailbox in $Mailboxes) {
Add-MailboxPermission -Identity $Mailbox -User $User -AccessRights fullaccess -Automapping $true
}

############################################################################
###Bullk add users full access delegation permissions to specific mailbox###
############################################################################
$Mailbox = "targetmailbox@example.com"
$Users = "user1@example.com","user2@example.com","user3@example.com"
foreach ($User in $Users) {
Add-MailboxPermission -Identity $Mailbox -User $User -AccessRights fullaccess -Automapping $true
}

############################################################################
###Bullk add users send as delegation permissions to specific mailbox###
############################################################################
$Mailbox = "targetmailbox@example.com"
$Users = "user1@example.com","user2@example.com","user3@example.com"
foreach ($User in $Users) {
Add-RecipientPermission $Mailbox -AccessRights sendas -Trustee $User -confirm:$false
}

################################################################################
###Bullk add users send on behalf of delegation permissions to specific mailbox#
################################################################################
$Mailbox = "targetmailbox@example.com"
$Users = "user1@example.com","user2@example.com","user3@example.com"
foreach ($User in $Users) {
Set-Mailbox $Mailbox -GrantSendOnBehalfTo @{add="$User"}
}

#########################################################################################
###Bulk Remove user send as permissions for all shared mailboxes for a specific domain###
############################################################################
Get-Mailbox -RecipientTypeDetails SharedMailbox -Filter {DisplayName -like "*Domain*"} | %{Get-RecipientPermission $_.Alias} | ? {$_.Trustee -like "*@example.com"} | %{Remove-RecipientPermission -Identity $_.Identity -Trustee $_.Trustee -AccessRights $_.AccessRights -Confirm:$false
#Grant user send on behalf of permissions#
Set-Mailbox $_.Identity -GrantSendOnBehalfTo @{Add=$_.Trustee}
#Get mailbox send on behalf permissions#
Get-Mailbox -Identity $_.Identity | Format-List GrantSendOnBehalfTo} 

############################################################################
###Remove user send as permissions###
############################################################################
Remove-RecipientPermission -Identity mailbox@example.com -Trustee user@example.com -AccessRights sendas
#Grant user send on behalf of permissions#
Set-Mailbox mailbox@example.com -GrantSendOnBehalfTo @{Add="user@example.com"} 
#Get mailbox send on behalf permissions#
Get-Mailbox -Identity mailbox@example.com | Format-List GrantSendOnBehalfTo

