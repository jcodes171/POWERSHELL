#Add email address alias to DG#
#Note that in respect to the script, SMTP indicates the primarySMTPAddress, smtp indicates email alias/ secondary address#
Set-DistributionGroup -Identity "primaryemailaddress@example.com" -EmailAddresses SMTP:primaryemailaddress@example.com, smtp:alias1@example.com, smtp:alias2@example.com