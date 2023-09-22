<#
Title: Graph to Fetch Windows device inventory from Intune
Description: The Powershell script uses MS Graph to fetch the Windows devices data from Intune.
Author: Vivek kumar Pandey
Version: 1.0
#>

#Execute Connect-msgraph command once for authentication and then comment it placing '#' as pre-fix.
Connect-MSGraph

#Generate execution log using transcript
Start-Transcript C:\Temp\IntuneManagedDevices.txt
$IntuneDevices = Get-IntuneManagedDevice -filter "operatingSystem eq 'Windows'" | Get-MSGraphAllPages
$IntuneManagedDevices = $IntuneDevices | select deviceName,complianceState,lastSyncDateTime,osVersion | FT -Wrap
$IntuneManagedDevices
Stop-Transcript
