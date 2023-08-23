##############################################################################
##############################################################################
##Bulk Update Room Booking Windows -- replace the file destination path as needed##
$Rooms = Get-Content C:\Users\user\folder\rooms.txt 

foreach($Room in $Rooms)
{
Set-CalendarProcessing -Identity $Room -BookingWindowInDays 365
}