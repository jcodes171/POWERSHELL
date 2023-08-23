#Use this script to get all distribution groups for specific domain, show the owners on the condition that they have a mailbox to separate from service account owners, and export to csv#
# Specify the domain name you want to target#
$domain = "example.com"

# Fetch all distribution lists in the specified domain with the ManagedBy attribute#
$distLists = Get-DistributionGroup -ResultSize Unlimited | Where-Object { $_.PrimarySmtpAddress -like "*@$domain" }

# Create an array to store the results#
$results = @()

# Iterate through each distribution list#
foreach ($distList in $distLists) {
    $owners = @()

    # Check if the distribution list has owners (ManagedBy attribute)#
    if ($distList.ManagedBy) {
        # Iterate through each owner's identity#
        foreach ($ownerIdentity in $distList.ManagedBy) {
            $owner = Get-Recipient -Identity $ownerIdentity

            # Only include owners that have a mailbox (user accounts)#
            if ($owner.RecipientTypeDetails -eq "UserMailbox") {
                # Add the owner's display name to the $owners array#
                $owners += $owner.DisplayName
            }
        }
    }

    # Create a custom object to store the information#
    $resultObject = [PSCustomObject]@{
        "DistributionList" = $distList.Name
        "DistributionListPrimarySmtp" = $distList.PrimarySmtpAddress
        "Owners" = $owners -join ", "
        "OwnersPrimarySmtp" = ($owners | ForEach-Object { (Get-Recipient $_).PrimarySmtpAddress }) -join ", "
    }

    # Add the result object to the results array#
    $results += $resultObject
}

# Export the results to a CSV file#
$results | Export-Csv -Path "C:\Users\user\folder\DistributionListOwners.csv" -NoTypeInformation


#################################################################################################################################################################################################
#################################################################################################################################################################################################
#################################################################################################################################################################################################
#################################################################################################################################################################################################

$domain = "example.com"

$distLists = Get-DistributionGroup -ResultSize Unlimited | Where-Object { $_.PrimarySmtpAddress -like "*@$domain" }

$results = @()

foreach ($distList in $distLists) {
    $owners = @()

    if ($distList.ManagedBy) {
        foreach ($ownerIdentity in $distList.ManagedBy) {
            $owner = Get-Recipient -Identity $ownerIdentity

            if ($owner.RecipientTypeDetails -eq "UserMailbox") {
                $owners += $owner.DisplayName
            }
        }
    }

    $resultObject = [PSCustomObject]@{
        "DistributionList" = $distList.Name
        "DistributionListPrimarySmtp" = $distList.PrimarySmtpAddress
        "Owners" = $owners -join ", "
        "OwnersPrimarySmtp" = ($owners | ForEach-Object { (Get-Recipient $_).PrimarySmtpAddress }) -join ", "
    }

    $results += $resultObject
}

$results | Export-Csv -Path "C:\Users\user\folder\DistributionListOwners.csv" -NoTypeInformation
