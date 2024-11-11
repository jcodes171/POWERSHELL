#Connect to Exchange Online#
Connect-ExchangeOnline 

#Set DDL to filter membership/ remove shared mailboxes, rooms, mailcontacts, equipment, distributiongroups from the membership list#
Set-DynamicDistributionGroup 'groupemail@example.com' -RecipientFilter {(-not(RecipientTypeDetailsValue -eq 'SharedMailbox')) -and (-not(RecipientTypeDetailsValue -eq 'RoomMailbox')) -and (-not(RecipientType -eq 'MailContact')) -and (-not(RecipientType -eq 'MailUniversalDistributionGroup')) -and (-not(RecipientTypeDetailsValue -eq 'EquipmentMailbox'))}

#Export list of members from the DDL#
Get-DynamicDistributionGroupMember "groupemail@example.com" | Select-Object PrimarySMTPAddress, DisplayName, RecipientType | Export-Csv -Path "C:\\Users\user\Desktop\ddlmembers.csv"