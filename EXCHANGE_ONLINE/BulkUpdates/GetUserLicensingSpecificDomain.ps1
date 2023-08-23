# Get all users in the specified domain
$users = Get-MsolUser -DomainName $domainName

# Loop through each user and output their license information
$output = foreach ($user in $users) {
    foreach ($license in $user.Licenses) {
        $services = $license.ServiceStatus | Select-Object -Property @{Name="ServiceName"; Expression={$_.ServicePlan.ServiceName}}, ProvisioningStatus
        [PSCustomObject] @{
            UPN = $user.UserPrincipalName
            DisplayName = $user.DisplayName
            AccountSKUId = $license.AccountSkuId
            Services = $services.ServiceName -join ","
        }
    }
}

# Output the results to the console
$output | Format-Table -AutoSize

# Output the results to a CSV file
$output | Export-Csv -Path "C:\Users\user\folder\output.csv" -NoTypeInformation