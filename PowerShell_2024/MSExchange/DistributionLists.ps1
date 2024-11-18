#Get distribution lists named like "Department"#
Get-DistributionGroup | Where-Object {$_.PrimarySMTPAddress -like '*Department*'} | Select-Object PrimarySMTPAddress
