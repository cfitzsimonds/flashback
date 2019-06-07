# site collection url
$adminUrl = "https://cfitzsimonds-admin.sharepoint.com"
$siteUrl = "https://cfitzsimonds.sharepoint.com/sites/play"

Connect-SPOService -Url $adminUrl -Credential (Get-Credential)
$site = Get-SPOSite $siteUrl
Add-SPOSiteCollectionAppCatalog -Site $site
Disconnect-SPOService