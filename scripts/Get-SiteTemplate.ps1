$siteUrl = "https://cfitzsimonds.sharepoint.com/sites/TestTeam2"

Connect-PnPOnline -Url $siteUrl -Credentials (Get-Credential)

Get-PnPProvisioningTemplate -Out D:\repos\flashback\templates\TeamsTrainingTemplate.xml

Disconnect-PnPOnline
