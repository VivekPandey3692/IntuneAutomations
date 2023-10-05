#Delete intune device
Param(
     [Parameter(Mandatory)]
     [ValidateSet('Disposed','Lost','Stolen','Retired')]
     [String]$Status_in_Ivanti,

     [Parameter(Mandatory)]
     [string]$DeviceName
 )

#App registration information
$tenantId = '2cccf150-62f6-4f78-ace8-1d255dbb15b9'
$clientId = '2f2d1e5a-ba9b-4c35-93ac-e73deabf032f'
$appSecret = 'iXY8Q~kLV6T_2nl3RoPeoD5C-RDBmUQC-4cKebwP'

$LogonURI = 'https://login.microsoftonline.com/{0}/oauth2/token' -f $tenantId

$APIURI = 'https://graph.microsoft.com'

#Connect to Graph API
$TokenBody = [ordered] @{
    'resource'      = $APIURI
    'client_id'     = $clientId
    'client_secret' = $appSecret
    'grant_type'    = 'client_credentials'
}
$Tokenresponse = Invoke-RestMethod -Uri $LogonURI -Method Post -Body $TokenBody
$Token= $Tokenresponse.access_token

if ($Token -ne $null)
{
"Authentication Successful, access token attained"
}
else
{
"Authentication Unsuccessful, please try with correct App registration information"
exit
}

Switch($Status_in_Ivanti)
{
    Disposed{"Item is disposed"}
    Lost{"Item is lost"}
    Stolen{"Item is stolen"}
    Retired{"Item is retired"}
}