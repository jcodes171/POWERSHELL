#Get user mailbox size limits#
Get-Mailbox -identity johndoe@contoso.com | select IssueWarningQuota, ProhibitSendQuota, ProhibitSendReceiveQuota

#Increase User Mailbox size to 99GB#
Set-Mailbox -identity johndoe@contoso.com -IssueWarningQuota 95GB -ProhibitSendQuota 98GB -ProhibitSendReceiveQuota 99GB

#Get size of user mailboxes - enter new line for each entry/user - update file path#
$Users = Get-Content -Path "C:\Users\user\folder\list.txt"

#Display mailbox size for each user#
foreach ($User in $Users) {
Get-EXOMailboxStatistics -Identity $User | select DisplayName, TotalItemSize | fl
}

#Get size of user mailboxes#
#Can list users like so below or use Get-Content to read from file#
$Users = "user0@example.com","user01@example.com","user02@example.com","user03@example.com","user04@example.com","user05@example.com","user06@example.com"

#Display mailbox size for each user#
foreach ($User in $Users) {
Get-EXOMailboxStatistics -Identity $User | select DisplayName, TotalItemSize | fl
}