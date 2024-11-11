#Get distribution lists named like "Accounting"#
Get-DistributionGroup | Where-Object {$_.PrimarySMTPAddress -like '*Accounting*'} | Select-Object PrimarySMTPAddress