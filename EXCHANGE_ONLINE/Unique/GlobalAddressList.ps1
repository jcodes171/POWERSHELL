#Check hide from GAL status#
Get-Mailbox -Identity "email@example.com" | select HiddenFromAddressListsEnabled

#Hide from GAL#
Set-Mailbox -Identity "mailbox@example.com" -HiddenFromAddressListsEnabled $true