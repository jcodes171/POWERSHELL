#Connect to Exchange Online#
Connect-ExchangeOnline 

###############################################################################################################################################
##########################################     Manage Email Address Visibility in GAL         #################################################
###############################################################################################################################################

#Manage mail contact user visibility in GAL#
#Show in GAL#
Get-MailUser guestuser@example.com | Set-MailUser -HiddenFromAddressListsEnabled $false

#Hide in GAL#
Get-MailUser guestuser@example.com | Set-MailUser -HiddenFromAddressListsEnabled $true