####Mailboxname to set OOO message####
$mbname = "user@example.com"

#OOO message#
$message = "User is on leave - please contact Sam Doe user@example.com"
 
#Place OOO message inside HTML Tags to preserve formatting#
$oootxt = '<pre>' + $message + '</pre>'
 
#Actions# 
Write-Host ""
[string] $mode = Read-Host -Prompt '(e)nable (d)isable or (s)chedule' 
 
# (e)nable #
if ($mode -match "e") {
        get-mailbox -Identity $mbname  | Set-MailboxAutoReplyConfiguration -AutoReplyState Enabled -InternalMessage $oootxt -ExternalMessage $oootxt -DeclineMeetingMessage $oootxt
 
}
# (d)isable
if ($mode -match "d") {
        get-mailbox -Identity $mbname  | Set-MailboxAutoReplyConfiguration -AutoReplyState Disabled
 
}
 
# (s)chedule
if ($mode -match "s") {
        [string]$startdate = Read-Host -Prompt 'Enter Start-Date according to your system time. For example: mm/dd/yyyy - Start-Time will be valid from 00:01'
        [string]$starttime = "$startdate 00:01:00" # You can change the StartTime here
        [string]$enddate = Read-Host -Prompt 'Enter End-Date according to your system time. For example: mm/dd/yyyy - End-Time will be valid until 23:59'
        [string]$endtime = "$enddate 23:59:00" # You can change the EndTime here
 
        get-mailbox -Identity $mbname  | Set-MailboxAutoReplyConfiguration -AutoReplyState Scheduled -InternalMessage $oootxt -ExternalMessage $oootxt -StartTime $starttime -EndTime $endtime
 
}
 
# Display Results
Write-host "--------------------------------------------------------------------------"
Write-host -ForegroundColor green "The following OOO settings have been applied to mailbox:" $mbname
$a = get-mailbox -Identity $mbname | Get-MailboxAutoReplyConfiguration | select AutoReplyState, StartTime , Endtime, InternalMessage, ExternalMessage | fl
$a

Post Creation

Disable OOO
Set-MailboxAutoReplyConfiguration –Identity user@example.com -AutoReplyState Disabled