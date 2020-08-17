# Connect with the Microsoft Graph via PnP PowerShell
# https://docs.microsoft.com/en-us/powershell/sharepoint/sharepoint-pnp/sharepoint-pnp-cmdlets?view=sharepoint-ps
Connect-PnPOnline -Scopes "User.ReadWrite.All"
$accesstoken = Get-PnPAccessToken
 
$response = Invoke-RestMethod -Uri https://graph.microsoft.com/v1.0/users/ -ContentType "application/json" -Headers @{Authorization = "Bearer $accesstoken"} -Method Get
$response