#Bulk add members to Office 365 group#
$collection = Get-Content 'C:\Users\user\folder\content.txt'
$mailbox = "group@example.com"

foreach ($item in $collection) 
{
    Add-UnifiedGroupLinks -Identity $mailbox -LinkType Members -Links $item -confirm:$false
}