##############################################################################
##Get RoomMailBoxes by Display Name -update "-Identity" parameter as needed##
Get-Mailbox -Identity "*keywordordisplayname*" -Filter '(RecipientTypeDetails -eq "RoomMailBox")'| Select-Object Name, Alias
