$siteUrl = "https://cfitzsimonds.sharepoint.com/sites/comm-template"
$brand = "Transformers"

Connect-PnPOnline -Url $siteUrl -Credentials (Get-Credential)

#Apply-PnPProvisioningTemplate -Path "C:\code\Projects\flashback\provisioning\flashback-sitetemplate.xml"

#set default value on site columns
Set-PnPDefaultColumnValues -List "Site Pages" -Field Brand -Value "Flashback|Brand|$brand"

Disconnect-PnPOnline