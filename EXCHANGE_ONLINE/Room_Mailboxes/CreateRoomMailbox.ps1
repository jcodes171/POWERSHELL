#######################################
#######################################
$email = "primaryemail@example.com"
$DN = "RoomDisplayName"
$Alias = "emailalias"
$orgrespective = $Alias + "@onmicrosoft.com"

New-Mailbox -Room -Name $DN -DisplayName $DN -Alias $Alias
Set-Mailbox $DN -EmailAddresses $email , $orgrespective
Start-Sleep -Seconds 60
Set-CalendarProcessing $Alias -AutomateProcessing AutoAccept

