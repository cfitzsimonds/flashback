$siteUrl = "https://cfitzsimonds.sharepoint.com"

Connect-PnPOnline -Url $siteUrl -Credentials (Get-Credential)

Apply-PnPTenantTemplate -Path "C:\Code\Projects\flashback\provisioning\flashback-tenantsettings.pnp" -Parameters @{"Company"="Flashback"}

Disconnect-PnPOnline