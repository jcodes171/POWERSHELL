##
Connect-MgGraph -Scopes "Directory.ReadWrite.All"

##
Disconnect-MgGraph

##
Update-MgUser -userId "first.last@example.com" -BusinessPhones "[INSERT BUSINESS PHONE NUMBER]"
Update-MgUser -userId "first.last@example.com" -CompanyName "[INSERT COMPANY NAME]"
Update-MgUser -userId "first.last@example.com" -JobTitle "[INSERT JOB TITLE]"

#Read csv file#
$users = Import-Csv -Path "C:\Users\user\desktop.users.csv"

#Loop through users in csv and update properties - create/ assign variables for user properties to csv column headings#
foreach ($user in $users) {
        $userPrincipalName = $user.$userPrincipalName
        $companyName = $user.CompanyName
        $businessPhone = $user.BusinessPhones

        #check if user exists in ms tenant#
        $existingUser = Get-MgUser -UserId $userPrincipalName -ErrorAction SilentlyContinue

        if ($existingUser) {
            #check if existing properties in ms entra match values in csv#
            $updateNeeded = $false

            if ($existingUser.UserPrincipalName -ne $userPrincipalName) {
                $existingUser.UserPrincipalName = $userPrincipalName
                $updateNeeded = $true
            }

            if ($existingUser.CompanyName -ne $companyName) {
                $existingUser.CompanyName = $companyName
                $updateNeeded = $true
            }
            if ($existingUser.BusinessPhones -ne $businessPhone) {
                $existingUser.BusinessPhones = $businessPhone
                $updateNeeded = $true
            }

            if ($updateNeeded) {
                #Update the user's entraid properties according to csv#
                Update-MgUser -UserId $userPrincipalName -CompanyName $companyName -BusinessPhones $businessPhone
                Write-Host "User '$userPrincipalName' updated successfully." -ForegroundColor Green
            }
            else {
                Write-Host "User '$userPrincpalName' properties are up to date." -ForegroundColor Cyan
            }
        }
        else {
            #If the user is not found according to the userPrincipalName/ if user email does not match entraid#
            Write-Host "User '$userPrincipalName' not found." -ForegroundColor Red

        }
}

#Bulk add users to mail enabled security group#
$users = Import-Csv -Path "C:\Users\user\Desktop\yes.csv"

foreach ($user in $users) {
    $userPrincipalName = $userPrincipalName.UserPrincipalName
    Add-DistributionGroupMember -Identity "GroupEmail@example.com" -Member $userPrincipalName
}

