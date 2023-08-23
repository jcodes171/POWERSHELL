Get-Recipient -RecipientTypeDetails MailUniversalDistributionGroup -Filter {EmailAddresses -like "*@example.com"}| ForEach-Object {
    Write-Host $_.DisplayName
    Write-Host $_.PrimarySMTPAddress
    @(Get-MessageTrace -RecipientAddress $_.PrimarySMTPAddress).count
    Write-Host ""
    }