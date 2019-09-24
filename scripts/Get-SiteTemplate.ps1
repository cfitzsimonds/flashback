$siteUrl = "https://cfitzsimonds.sharepoint.com/sites/TestTeam1"

Connect-PnPOnline -Url $siteUrl -Credentials (Get-Credential)

Get-PnPProvisioningTemplate -Out D:\repos\flashback\templates\TeamsTrainingTemplate.xml

Disconnect-PnPOnline
