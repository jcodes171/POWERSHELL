#EXPORT END USER GROUP MEMBERSHIPS AND OWNERSHIPS -- Update the id.txt file with the respective end user UPN/ Email Address###
[string[]]$UserCollection = Get-Content 'C:\Users\user\folder\id.txt'
foreach ($useritem in $usercollection) {
$DistinguishedName = Get-User $Useritem | Select-Object -ExpandProperty DistinguishedName

    $MemberRollup = New-Object System.Collections.ArrayList
    $i = 0

    $MemberCollection = Get-EXORecipient -Filter "Members -eq '$DistinguishedName'" -RecipientTypeDetails GroupMailbox,MailUniversalDistributionGroup,MailUniversalSecurityGroup

    foreach ($Memberitem in $Membercollection) {
        $MemberAzure = Get-AzureADGroup -ObjectId $Memberitem.ExternalDirectoryObjectId
        $MemberObject = [PSCustomObject]@{
            'DisplayName' = $Memberitem.DisplayName
            'ObjectType' = $MemberAzure.ObjectType
            'PrimarySMTPAddress' = $Memberitem.PrimarySMTPAddress
            'RecipientTypeDetails' = $Memberitem.RecipientTypeDetails
            'MailEnabled' = $MemberAzure.MailEnabled
            'SecurityEnabled' = $MemberAzure.SecurityEnabled
            'ObjectID' = $Memberitem.ExternalDirectoryObjectId
        }
    $MemberRollup.Add($MemberObject) > $Null
    $i++
    Write-Progress -activity "Member Group Search" -status "Group $i of $($Membercollection.Count)" -percentComplete (($i / $Membercollection.Count) * 100)
    }
    $MemberRollup | Export-Csv "C:\Users\user\folder\$($Useritem) - Member.csv" -Encoding UTF8 -NoTypeInformation


    $OwnerRollup = New-Object System.Collections.ArrayList
    $i = 0

    $OwnerCollection = Get-EXORecipient -Filter "ManagedBy -eq '$DistinguishedName'" -RecipientTypeDetails GroupMailbox,MailUniversalDistributionGroup,MailUniversalSecurityGroup

    foreach ($Owneritem in $Ownercollection) {
        $OwnerAzure = Get-AzureADGroup -ObjectId $Owneritem.ExternalDirectoryObjectId
        $OwnerObject = [PSCustomObject]@{
            'DisplayName' = $Owneritem.DisplayName
            'ObjectType' = $OwnerAzure.ObjectType
            'PrimarySMTPAddress' = $Owneritem.PrimarySMTPAddress
            'RecipientTypeDetails' = $Owneritem.RecipientTypeDetails
            'MailEnabled' = $OwnerAzure.MailEnabled
            'SecurityEnabled' = $OwnerAzure.SecurityEnabled
            'ObjectID' = $Owneritem.ExternalDirectoryObjectId
        }
    $OwnerRollup.Add($OwnerObject) > $Null
    $i++
    Write-Progress -activity "Owner Group Search" -status "Group $i of $($OwnerCollection.Count)" -percentComplete (($i / $OwnerCollection.Count) * 100)
    }

    $OwnerRollup | Export-Csv "C:\Users\user\folder\$($Useritem) - Owner.csv" -Encoding UTF8 -NoTypeInformation
}
