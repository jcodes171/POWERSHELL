#######################################################################################################################################
#PS SharePoint module cannot run on PS version 7 at this time - use PS version 5/ run it from PS ISE application#
Install-Module -Name Microsoft.Online.SharePoint.PowerShell

#Verify module was installed#
Get-Module -Name Microsoft.Online.SharePoint.PowerShell -ListAvailable | Select-Object Name, Version

#Update module#
Update-module -Name Microsoft.Online.SharePoint.PowerShell

#Load/Import module#
Import-Module Microsoft.Online.SharePoint.PowerShell

#Connect to SharePoint online#
Connect-SPOService -Url https://contoso-admin.sharepoint.com 

#Connect with predefined user principal name/ credential#
Connect-SPOService -Url https://contoso-admin.sharepoint.com -Credential admin@contoso.com