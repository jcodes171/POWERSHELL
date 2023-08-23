$email = "sharedmailbox@example.com"
$DN = "MailboxDisplayName"
$Alias = "emailalias"
$orgrespective = $Alias + "@onmicrosoft.com"

New-Mailbox -Shared -Name $DN -DisplayName $DN -Alias $Alias

Set-Mailbox $DN -EmailAddresses $email, $orgrespective -MessageCopyForSentAsEnabled:$True -MessageCopyForSendOnBehalfEnabled:$True