$email = "primaryemail@example.com"
$DN = "MailboxDisplayName"
$Alias = "alias1"
$Extra = $Alias + "@example.com"

New-Mailbox -Shared -Name $DN -DisplayName $DN -Alias $Alias

Set-Mailbox $DN -EmailAddresses $email, $Extra -MessageCopyForSentAsEnabled:$True -MessageCopyForSendOnBehalfEnabled:$True