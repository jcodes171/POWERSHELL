#Connect to Exchange Online#
Connect-ExchangeOnline 

###############################################################################################################################################
############################################           Custom Attributes                  #####################################################
###############################################################################################################################################

#Show mailbox custom attribute values#
Get-Mailbox -Identity user@example.com | Format-List CustomAttribute*

#Set mailbox custom attribute value for CustomAttribute1 in O365#
Set-Mailbox -Identity user@example.com -CustomAttribute1 "[INSERTVALUEHERE]"

#Bulk Assign CustomAttribute1 value from CSV file#
Import-Csv -Path "C:\Users\User\Desktop\custom1.csv" | ForEach-Object {Set-Mailbox $_.'UPN' -CustomAttribute1 $_.CustomAttribute1}


###############################################################################################################################################
############################################           User Email Aliases             #####################################################
###############################################################################################################################################

#Get user mailbox details#
Get-Mailbox -RecipientTypeDetails

#Set/ update email alias for user mailbox#
Set-Mailbox -Identity "Fred.Jones@example.com" -EmailAddresses SMTP:Fred.Jones@example.com, smtp:fjones@example.com, smtp:fj@example.com

#Get user primary email and aliases#
Get-Mailbox -Identity user@example.com | Select-Object PrimarySMTPAddress, EmailAddresses

#Bulk assign aliases from file#
$users = Import-Csv -Path "C:\Users\User\Desktop\mailboxes.csv"

$mailboxes = Get-Content 