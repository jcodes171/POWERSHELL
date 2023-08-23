#View mailbox delegate permissions#
Get-EXOMailboxPermission -Identity mailboxemail@example.com | ft -AutoSize

Get-EXORecipientPermission -Identity mailboxemail@example.com | ft

Get-EXOMailbox -Identity mailboxemail@example.com -Properties GrantSendOnBehalfTo |  Select-Object  PrimarySMTPAddress, GrantSendOnBehalfTo

Get-MailboxFolderPermission -Identity mailboxemail@example.com:\Calendar