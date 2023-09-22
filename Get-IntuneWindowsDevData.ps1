#Connect-MSGraph
Start-Transcript C:\Temp\IntuneManagedDevices.txt
$IntuneDevices = Get-IntuneManagedDevice -filter "operatingSystem eq 'Windows'" | Get-MSGraphAllPages
$IntuneManagedDevices = $IntuneDevices | select deviceName,complianceState,lastSyncDateTime,osVersion | FT -Wrap
$IntuneManagedDevices
Stop-Transcript
