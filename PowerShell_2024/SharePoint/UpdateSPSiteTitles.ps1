#Connect to SP Online#
Import-Module Microsoft.Online.SharePoint.PowerShell
Connect-SPOService -URL https://contoso-admin.sharepoint.com/

#Export list of all SP Sites in Tenant#
Get-SPOSite -Limit All | Select-Object Url, Title, PrimarySMTPAddress, EmailAddresses | Export-Csv -Path "C:\Users\user\Desktop\sites.csv" -NoTypeInformation

#Bulk Update site display names from csv file#
$sites = Import-Csv -Path "C:\Users\user\Desktop\sites.csv"

#Loop through each site and update displayname#
foreach ($site in $sites){
    Set-SPOSite -Identity $site.SiteUrl -Title $site.NewDisplayName
}

