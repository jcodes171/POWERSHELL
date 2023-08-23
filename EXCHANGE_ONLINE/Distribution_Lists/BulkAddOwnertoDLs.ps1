#Bulk Add user(s) as owner to distribution lists from text file#
$Groups = Get-Content "C:\Users\user\folder\distributiongroups.txt"

foreach($Group in $Groups)
    {
        Set-DistributionGroup -Identity $Group -ManagedBy @{add="user1@example.com"}
        Set-DistributionGroup -Identity $Group -ManagedBy @{add="user2@example.com"}
        Set-DistributionGroup -Identity $Group -ManagedBy @{add="user3@example.com"}
    }