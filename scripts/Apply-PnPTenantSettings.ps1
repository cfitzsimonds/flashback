$siteUrl = "https://cfitzsimonds.sharepoint.com"

Connect-PnPOnline -Url $siteUrl -Credentials (Get-Credential)

Apply-PnPTenantTemplate -Path "D:\repos\flashback\provisioning\flashback-tenantsettings.pnp" -Parameters @{"Company"="Flashback"}

Disconnect-PnPOnline