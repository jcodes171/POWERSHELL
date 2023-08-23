##################################################################################
######Bulk Re-add shared mailbox mapping######
##################################################################################
$collection = 'user1@example.com','user2@example.com','user3@example.com'

foreach ($item in $collection) {
    Remove-MailboxPermission -Identity mailbox@example.com -AccessRights FullAccess -User $item
    Remove-MailboxPermission -Identity mailbox@example.com -AccessRights FullAccess -User $item
    Add-MailboxPermission -Identity mailbox@example.com -AccessRights FullAccess -User $item -AutoMapping:$false
    Add-MailboxPermission -Identity mailbox@example.com -AccessRights FullAccess -User $item -AutoMapping:$false
}

##################################################################################
######Add email address alias to Mailbox######
##################################################################################
Set-Mailbox -Identity "mailbox@example.com" -EmailAddresses SMTP:mailbox@example.com,smtp:alias@example.com