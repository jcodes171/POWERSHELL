#Check PS Version#
$PSVersionTable.PSVersion

#Install latest PS Get Version#
Install-Module -Name PowerShellGet -Forece -AllowClobber

#Install MS Teams PowerShell Module#
Install-Module -Name MicrosoftTeams -Force -AllowClobber

#Connect to Teams Module#
Connect-MicrosoftTeams

#Update PS Teams Module#
Update-Module MicrosoftTeams
