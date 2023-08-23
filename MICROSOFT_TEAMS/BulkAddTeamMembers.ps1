#Check if WelcomeMessage notification emails are enabled when user is added to new team#
Get-UnifiedGroup <group ID or name> | fl WelcomeMessageEnabled


####################################################################################
####################################################################################


#Check if WelcomeMessage notification emails are enabled when user is added to new team and set message to False to prevent the emails from being sent for the group whenever a new member is added#
Get-UnifiedGroup <group ID or name> | Set-UnifiedGroup -UnifiedGroupWelcomeMessageEnabled:$false


####################################################################################
####################################################################################


#Bulk add members to a specific Team from a text file#
$Users = Get-Content -Path C:\Users\user\folder\users.txt

#add each user with member role to specific team#
foreach ($User in $Users) {

Add-TeamUser -GroupId <group ID or name> -User $User -Role Member
Write-Host "Added User:"$User -f Green

}