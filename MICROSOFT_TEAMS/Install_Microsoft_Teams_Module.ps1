#Install Microsoft Teams PowerShell Module using the PowerShellGallery#

#Install latest PowerShellGet#
Install-Module -Name PowerShellGet -Force -AllowClobber

#Install Teams PowerShell Module#
Install-Module -Name MicrosoftTeams -Force -AllowClobber

#Connect to Teams module#
Connect-MicrosoftTeams

