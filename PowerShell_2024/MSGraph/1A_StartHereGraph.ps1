#Verify Installation#
Get-InstalledModule Microsoft.Graph

#Verify installed submodules and versions#
Get-InstalledModule

#Update SDK#
Update-Module Microsoft.Graph*

#Uninstall Graph#
Get-InstalledModule Microsoft.Graph.* | Where-Object Name -ne "Microsoft.Graph.Authentication" | Uninstall-Module -AllVersions
Uninstall-Module Microsoft.Graph.Authentication -AllVersions

#Connect to MS Graph with Read permissions to directory and then Read&Write permissions to directory#
Connect-MgGraph -Scopes "User.Read.All"
Connect-MgGraph -Scopes "Directory.ReadWrite.All"

#Disconnect from Graph API Session#
Disconnect-MgGraph


#Get user EntraID info#
Get-MgUser -Identity "user@example.com" | Select-Object UserPrincipalName, BusinessPhones, CompanyName, Department, JobTitle, EmployeeId
