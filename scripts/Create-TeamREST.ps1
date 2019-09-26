# Connect with the Microsoft Graph via PnP PowerShell
# https://docs.microsoft.com/en-us/powershell/sharepoint/sharepoint-pnp/sharepoint-pnp-cmdlets?view=sharepoint-ps
Connect-PnPOnline -Scopes "Group.ReadWrite.All"
$accesstoken = Get-PnPAccessToken
 
# Example of json for POST https://graph.microsoft.com/v1.0/groups
# https://docs.microsoft.com/en-us/graph/api/group-post-groups?view=graph-rest-1.0
$creategroup = @'
{
    "description": "Twitter Test Team",
    "displayName": "Twitter",
    "groupTypes": [
      "Unified"
    ],
    "mailEnabled": true,
    "mailNickname": "twitter",
    "securityEnabled": false
  }
'@
$response = Invoke-RestMethod -Uri https://graph.microsoft.com/v1.0/groups -Body $creategroup -ContentType "application/json" -Headers @{Authorization = "Bearer $accesstoken"} -Method Post
 
# Example of json for PUT https://graph.microsoft.com/v1.0/groups/{id}/team
# https://docs.microsoft.com/en-us/graph/api/team-put-teams?view=graph-rest-1.0
 
$groupid = $response.'id'
$createteam = @'
{  
    "memberSettings": {
      "allowCreateUpdateChannels": true
    },
    "messagingSettings": {
      "allowUserEditMessages": true,
      "allowUserDeleteMessages": true
    },
    "funSettings": {
      "allowGiphy": true,
      "giphyContentRating": "strict"
    }
  }
'@
 
$createteamuri = "https://graph.microsoft.com/v1.0/groups/" + $groupid + "/team"
Invoke-RestMethod -Uri $createteamuri -Body $createteam -ContentType "application/json" -Headers @{Authorization = "Bearer $accesstoken"} -Method PUT