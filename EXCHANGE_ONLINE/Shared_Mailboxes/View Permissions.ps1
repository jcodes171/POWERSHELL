######View Permissions######
$Mailbox = "sharedmailbox@example.com"
$User = "user@example.com"
$MB = $Mailbox + ":\Calendar"
Get-EXOMailboxPermission -Identity $Mailbox | ft -AutoSize
Get-EXORecipientPermission -Identity $Mailbox | ft
Get-EXOMailbox -Identity $Mailbox -Properties GrantSendOnBehalfTo |  Select-Object  PrimarySMTPAddress, GrantSendOnBehalfTo
Get-MailboxFolderPermission -Identity $MB 

######Bulk add users to shared calendar from list/ .txt file######
$Mailbox = “mailbox@example.com” 
$MB = $Mailbox + ":\Calendar"
$collection = Get-Content 'C:\Users\user\folder\calendarusers.txt'
foreach ($item in $collection) 
{
   Add-MailboxFolderPermission -AccessRights editor -Identity $MB -User $item 
}


#####Get Specific permissions for shared mailbox(es)#####
###Use below for specific mailboxes#####
#Create new array list variable#
$Rollup = New-Object System.Collections.ArrayList
#Filter by specific mailboxes - replace as needed
$Mailboxes = @("example1@example.com")
#Loop through each mailbox and obtain property values 
Foreach ($MailboxName in $Mailboxes){
    $Mailbox = Get-Mailbox -Identity $MailboxName

    $AccessUsers = Get-MailboxPermission -Identity $Mailbox.PrimarySMTPAddress | Where-Object{$_.User -like "*@example.com"} | Select-Object @{N="User"; E={(Get-Recipient $_.User).DisplayName}}, AccessRights
    $SendingUsers = Get-RecipientPermission -Identity $Mailbox.PrimarySMTPAddress | Where-Object{$_.Trustee -like "*@example.com"} | Select-Object @{N="Trustee"; E={(Get-Recipient $_.Trustee).DisplayName}}, AccessRights
    
    $MailboxItem = [PSCustomObject]@{ 
        'Mailbox Name' = $Mailbox.DisplayName 
        'Mailbox Email' = $Mailbox.PrimarySMTPAddress 
        'Mailbox Type' = $Mailbox.RecipientTypeDetails 
        'Access Users' = ($AccessUsers.User | Out-String).Trim() 
        'Access Rights' = ($AccessUsers.AccessRights | Out-String).Trim() 
        'Sending Users' = ($SendingUsers.Trustee | Out-String).Trim() 
        'Sending Rights' = ($SendingUsers.AccessRights | Out-String).Trim() 
    }
    #Add the user information from the foreach loop above to the final Array.     
    $Rollup.Add($MailboxItem) > $Null
} 
#Call Variable and display results
$Rollup
#Export to PowerShell Gridview or csv
$Rollup | Out-GridView
$Rollup | Export-Csv -Path "C:\Users\user\folder\smbdelegates.csv"



####Export and list all shared mailboxes and permissions to them for specific domain####
$Rollup = New-Object System.Collections.ArrayList
$mailboxes = Get-EXORecipient -RecipientTypeDetails SharedMailbox -Filter {EmailAddresses -like "*example.com"}

Foreach ($Mailbox in $Mailboxes){    
    $AccessUsers = Get-MailboxPermission -Identity $Mailbox.PrimarySMTPAddress | Where-Object{$_.User -like "*@example.com"} | Select-Object @{N="User"; E={(Get-Recipient $_.User).DisplayName}}, AccessRights    
    
    $SendingUsers = Get-RecipientPermission -Identity $Mailbox.PrimarySMTPAddress | Where-Object{$_.Trustee -like "*@example.com"} | Select-Object @{N="Trustee"; E={(Get-Recipient $_.Trustee).DisplayName}}, AccessRights    
    
    $MailboxItem = [PSCustomObject]@{        
    'Mailbox Name' = $Mailbox.DisplayName        
    'Mailbox Email' = $Mailbox.PrimarySMTPAddress        
    'Mailbox Type' = $Mailbox.RecipientTypeDetails        
    'Access Users' = ($AccessUsers.User | Out-String).Trim()        
    'Access Rights' = ($AccessUsers.AccessRights | Out-String).Trim()        
    'Sending Users' = ($SendingUsers.Trustee | Out-String).Trim()        
    'Sending Rights' = ($SendingUsers.AccessRights | Out-String).Trim()    
}
#Add the user information from the foreach loop above to the final Array.
$Rollup.Add($MailboxItem) > $Null}$Rollup

$Rollup | Export-Csv -Path "C:\Users\user\folder\smbpermissions.csv" 



###EXPORT SHARED MAILBOX DELEGATES AND PERMISSIONS###
###USE FOR DOMAIN-SPECIFIC MAILBOXES###
#Create new array list variable#
$Rollup = New-Object System.Collections.ArrayList

#Filter by specific domain
$mailboxes = Get-EXORecipient -RecipientTypeDetails SharedMailbox -Filter {EmailAddresses -like "*example.com"}

#Loop through each mailbox and obtain property values 
Foreach ($Mailbox in $Mailboxes){    
    $AccessUsers = Get-MailboxPermission -Identity $Mailbox.PrimarySMTPAddress | Where-Object{$_.User -like "*@example.com"} | Select-Object @{N="User"; E={(Get-Recipient $_.User).DisplayName}}, AccessRights
    $SendingUsers = Get-RecipientPermission -Identity $Mailbox.PrimarySMTPAddress | Where-Object{$_.Trustee -like "*@example.com"} | Select-Object @{N="Trustee"; E={(Get-Recipient $_.Trustee).DisplayName}}, AccessRights   
        $MailboxItem = [PSCustomObject]@{        
            'Mailbox Name' = $Mailbox.DisplayName        
            'Mailbox Email' = $Mailbox.PrimarySMTPAddress        
            'Mailbox Type' = $Mailbox.RecipientTypeDetails        
            'Access Users' = ($AccessUsers.User | Out-String).Trim()        
            'Access Rights' = ($AccessUsers.AccessRights | Out-String).Trim()        
            'Sending Users' = ($SendingUsers.Trustee | Out-String).Trim()        
            'Sending Rights' = ($SendingUsers.AccessRights | Out-String).Trim()    
         }
           
    #Add the user information from the foreach loop above to the final Array.
    $Rollup.Add($MailboxItem) > $Null} 
    
    #Call Variable and display results
    $Rollup

#Export to PowerShell Gridview or csv
$Rollup | Out-GridView
$Rollup | Export-Csv -Path "C:\Users\user\folder\smbdelegates.csv"



#####EXPORT SHARED MAILBOX DELEGATES AND PERMISSIONS#####
######Use for specific mailboxes######
#Create new array list variable#
$Rollup = New-Object System.Collections.ArrayList

#Filter by specific mailboxes - replace as needed
$Mailboxes = @("mailbox1@example.com","mailbox2@example.com","mailbox3@example.com")

#Loop through each mailbox and obtain property values 
Foreach ($MailboxName in $Mailboxes){
    $Mailbox = Get-Mailbox -Identity $MailboxName

    $AccessUsers = Get-MailboxPermission -Identity $Mailbox.PrimarySMTPAddress | Where-Object{$_.User -like "*@example.com"} | Select-Object @{N="User"; E={(Get-Recipient $_.User).DisplayName}}, AccessRights
    $SendingUsers = Get-RecipientPermission -Identity $Mailbox.PrimarySMTPAddress | Where-Object{$_.Trustee -like "*@example.com"} | Select-Object @{N="Trustee"; E={(Get-Recipient $_.Trustee).DisplayName}}, AccessRights
    
    $MailboxItem = [PSCustomObject]@{ 
        'Mailbox Name' = $Mailbox.DisplayName 
        'Mailbox Email' = $Mailbox.PrimarySMTPAddress 
        'Mailbox Type' = $Mailbox.RecipientTypeDetails 
        'Access Users' = ($AccessUsers.User | Out-String).Trim() 
        'Access Rights' = ($AccessUsers.AccessRights | Out-String).Trim() 
        'Sending Users' = ($SendingUsers.Trustee | Out-String).Trim() 
        'Sending Rights' = ($SendingUsers.AccessRights | Out-String).Trim() 
    }
    #Add the user information from the foreach loop above to the final Array.     
    $Rollup.Add($MailboxItem) > $Null
} 
#Call Variable and display results
$Rollup

#Export to PowerShell Gridview or csv
$Rollup | Out-GridView
$Rollup | Export-Csv -Path "C:\Users\user\folder\smbdelegates.csv"
