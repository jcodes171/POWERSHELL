#Script reads text file list of users to determine if email is active in Office 365 - First step is to create text file with list of target users##
$emailFile = "C:\Users\user\folder\list.txt"
 $outputFile = "C:\Users\user\folder\output.csv"
 $emails = Get-Content $emailFile

 $results = foreach ($email in $emails) {
     $mailbox = Get-Mailbox $email -ErrorAction SilentlyContinue
     if ($mailbox) {
         $status = "ACCOUNT EXISTS IN OFFICE 365"
     } else {
         $status = "ACCOUNT DOES NOT EXIST"
     }
     [PSCustomObject]@{
         Email = $email
     }
 }
 $results | Export-Csv $outputFile -NoTypeInformation
 Write-Host "Results exported to $outputFile"

#Count of Received emails for specific mailbox#
$UserEmail = "user@example.com"
$StartTime = Get-Date "3/1/2023 12:00:00 AM"
$EndTime = Get-Date "3/31/2023 11:59:59 PM"

$Mailbox = Get-Mailbox -Identity $UserEmail
if($Mailbox) {
    $FolderStats = Get-MailboxFolderStatistics -Identity $Mailbox.Identity -FolderScope Inbox
    $ItemsInFolder = $FolderStats | Where-Object { $_.LastModifiedTime -ge $StartTime -and $_.LastModifiedTime -le $EndTime } | Measure-Object -Property ItemsInFolder -Sum
    $ItemCount = $ItemsInFolder.Sum
    
    Write-Output "User: $($Mailbox.DisplayName)"
    Write-Output "Messages received between March 1st, 2023 at 12:00 AM CST and March 31st, 2023 at 11:59 PM CST: $ItemCount"
} else {
    Write-Output "User $UserEmail not found"
}