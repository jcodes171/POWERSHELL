#Bulk Re-add shared mailbox mapping for multiple end users from a text file#
$collection = Get-Content -Path "C:\Users\user\folder\file.txt"

foreach ($item in $collection) {
    Remove-MailboxPermission -Identity sharedmailbox@contoso.com -AccessRights FullAccess -User $item
    Add-MailboxPermission -Identity sharedmailbox@contoso.com -AccessRights FullAccess -User $item -AutoMapping:$true
}
