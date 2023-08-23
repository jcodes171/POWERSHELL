#Bulk add multiple users as delegates to specific mailbox:
$Mailbox = "sharedmailbox@example.com"
$Users = Get-Content -Path C:\Users\user\folder\users.txt

foreach ($User in $Users) {
    #Grant Full Access and automatically map the mailbox to the user's Outlook#
    Add-MailboxPermission -Identity $Mailbox -User $User -AccessRights fullaccess -Automapping $true
    #Grant Send As#
    Add-RecipientPermission $Mailbox -AccessRights sendas -Trustee $User -confirm:$false
    #Grant Send on Behalf#
    Set-Mailbox $Mailbox -GrantSendOnBehalfTo @{add="$User"}
}