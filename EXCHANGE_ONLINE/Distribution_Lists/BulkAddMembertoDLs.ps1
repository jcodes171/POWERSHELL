#Bulk Add user(s) as member to distribution lists from text file#
$collection = Get-Content 'C:\Users\user\folder\dl.txt'
$mailbox = "distributiongroup@example.com"

foreach ($item in $collection) 
{
    Add-DistributionGroupMember -Identity $mailbox -Member $item -confirm:$false
}
