#Connect to Exchange Online#
Connect-ExchangeOnline 

#Create new organization relationship - manage calendar access to allow external tenant to see calendar limited details (free/busy)#
NewOrganizationRelationship -Name "CompanyA" -DomainNames "example.com" -FreeBusyAccessEnabled $true -FreeBusyAccessLevel LimitedDetails