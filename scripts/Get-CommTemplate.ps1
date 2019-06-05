$siteUrl = "https://cfitzsimonds.sharepoint.com/sites/comm-template"

Connect-PnPOnline -Url $siteUrl -Credentials (Get-Credential)

Get-PnPProvisioningTemplate -Out C:\Code\Projects\flashback\templates\CommHomePageTemplate.xml

Disconnect-PnPOnline
