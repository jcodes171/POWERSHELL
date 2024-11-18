#Bulk add users from text file#
$users = Get-Content -Path "C:\Users\user\Desktoptextfle.txt"

#Loop through each row in file and add user to Team group as member#
foreach ($user in $users) {
    $userPrincipalName = $users.$userPrincipalName
    Add-TeamUser -GroupId "[TEAMGROUPID]" -User $userPrincipalName -Role Member
    Write-Host "Added User: "$userPrincpalName -f Green
}

#Get Team Group ID#
Get-Team | Select-Object DisplayName, PrimarySMTPAddress, -GroupId

#Add user as member to team with specific team group id#
Get-Team -GroupId [TEAMGROUPID]
Add-TeamUser -GroupId "[TEAMGROUPID]" -User "user@example.com" -Role Member

##Adding guest users to Microsoft Teams##
#Get list of guest users and email addresses#
Get-MgUser -Filter "userType eq 'Guest'" -All | Select-Object Mail

#Add guest users to MS Team Group#
$guests = Get-Content -Path "C:\Users\user\Desktop\guestsfile.txt"

foreach($guest in $guests) {
    Add-TeamUser -GroupId "[TEAMGROUPID]" -User $Guest -Role member
    Write-Host "Added User:" $guest -f Green
}

