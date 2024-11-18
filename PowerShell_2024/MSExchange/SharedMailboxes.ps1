#Connect to Exchange Online#
Connect-ExchangeOnline 

#Get mailboxes named like "Accounting"#
Get-Mailbox | Where-Object {$_.UserPrincipalName -like '*Accounting*'} | Select-Object UserPrincipalName


#Create new mailbox#
$primaryEmail = "sharedmailboxname@example.com"
$displayName = "mailboxdisplayname"

#create new shared mailbox#
New-Mailbox -Shared -Name $displayName -DisplayName $displayName -PrimarySMTPAddress $primaryEmail
Set-Mailbox $displayName -EmailAddress $primaryEmail


#Manage Shared Mailbox delegate permissions#
#Grant user full access delegation permissions to mailbox and map to Outlook (application)#
Add-MailboxPermission -Identity "Fred.Jones@example.com" -User "Thomas.Ready@example.com" -AccessRights FullAccess -InheritanceType All -Automapping $false

#Remove user delegation permissions to mailbox"
Remove-MailboxPermission -Identity "Fred.Jones@example.com" -User "Thomas.Ready@example.com" -AccessRights FullAccess -InheritanceType All -Confirm:$true
