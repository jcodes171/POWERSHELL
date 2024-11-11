#Search for the latest version of PowerShell#
winget search Microsoft.PowerShell

winget install --id Microsoft.PowerShell --source winget
winget install --id Microsoft.PowerShell.Preview --source winget

############################################################################################################
############################################################################################################
Find-Module -Name PowerShellGet | Install-Module
Install-Module -Name PowerShellGet

############################################################################################################
############################################################################################################
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

Install-Module Microsoft.Graph -Scope CurrentUser -Repository PSGallery -Force

Install-Module Microsoft.Graph -Scope AllUsers -Repository PSGallery -Force

Get-InstalledModule Microsoft.Graph
Get-InstalledModule

Update-Module Microsoft.Graph

Uninstall-Module Microsoft.Graph -AllVersions

Get-InstalledModule Microsoft.Graph.* | Where-Object Name -ne "Microsoft.Graph.Authentication" | Uninstall-Module -AllVersions
Uninstall-Module Microsoft.Graph.Authentication -AllVersions
############################################################################################################
############################################################################################################
#Check PS Version#
$PSVersionTable

#Require all scripts downloaded from internet to be signed by trusted publisher#
Set-ExecutionPolicy RemoteSigned

#See execution policy for each scope#
Get-ExecutionPolicy -List

#Set execution policy for local pc#
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

############################################################################################################
############################################################################################################
