####################################################
####################################################
$Domains = New-Object System.Collections.ArrayList
$Domains = '*@exampledomain1.com','*@exampledomain2.com','*@exampledomain3.com','*@exampledomain4.com','*@exampledomain5.com','*@exampledomain6.com'
$d = 1

$Senders = New-Object System.Collections.ArrayList
$Senders = 'examplesenderdomain.com'

foreach ($Domain in $Domains) {

    $Recipients = New-Object System.Collections.ArrayList
    $Recipients = Get-EXOMailbox -ResultSize Unlimited -RecipientType UserMailbox -Filter "EmailAddresses -like '$Domain'" -WarningAction SilentlyContinue -ErrorAction SilentlyContinue | Where-Object PrimarySMTPAddress -like $Domain | Sort-Object DisplayName

    $Number = [math]::ceiling($Recipients.count / 10)
    $Count = 0
    $Inc = 0
    $b = 0

    Write-Host "Total number for mailboxes:" $Recipients.count
    
    For ($count=0; $count -le $Number; $Count++){
    
        $Users = New-Object System.Collections.ArrayList
        $i = 0

        $Users = $Recipients | Select-Object -Skip ($Inc+0) -First 10

        ForEach ($User in $Users) {
            Set-MailboxJunkEmailConfiguration -Identity $User.Identity -TrustedSendersAndDomains @{Add=$Senders}
            $i++
            Write-Progress -activity "Adding to Trusted Senders List" -status "Domain: $d of $($domains.count)  Group: $b of $Number // User: $i of $($Users.Count)" -percentComplete (($i / $Users.Count) * 100)
        }
        $b++
        Clear-Variable -Name 'Users'
        $Inc = $Inc+10
    }
    $d++
}