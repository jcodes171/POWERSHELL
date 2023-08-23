#Bulk Remove user send as permissions for all shared mailboxes for a specific domain#
#Get all shared mailboxes for specific domain i.e. "Contoso" and only show delegates with an @contoso.com suffix. remove their sendas permissions#
Get-Mailbox -RecipientTypeDetails SharedMailbox -Filter {DisplayName -like "*Contoso*"} | %{Get-RecipientPermission $_.Alias} | ? {$_.Trustee -like "*@contoso.com"} | %{Remove-RecipientPermission -Identity $_.Identity -Trustee $_.Trustee -AccessRights $_.AccessRights #-Confirm:$false# -WhatIf
#Grant user send on behalf of permissions#
Set-Mailbox $_.Identity -GrantSendOnBehalfTo @{Add=$_.Trustee} -WhatIf
#Get mailbox send on behalf permissions#
Get-Mailbox -Identity $_.Identity | Format-List GrantSendOnBehalfTo} 

#For individual cases -- Remove user send as permissions#
Remove-RecipientPermission -Identity sharedmailbox@contoso.com -Trustee user@contoso.com -AccessRights sendas -WhatIf
#Grant user send on behalf of permissions#
Set-Mailbox sharedmailbox@contoso.com -GrantSendOnBehalfTo @{Add="user@contoso.com"} -WhatIf
#Get mailbox send on behalf permissions#
Get-Mailbox -Identity sharedmailbox@contoso.com | Format-List GrantSendOnBehalfTo
