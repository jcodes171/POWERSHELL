﻿#Export list of distribution group members#
Get-DistributionGroupMember distributionlist@example.com | select DisplayName, Name, PrimarySMTPAddress | Export-CSV -Path "C:\Users\user\folder\dlmembers.csv"