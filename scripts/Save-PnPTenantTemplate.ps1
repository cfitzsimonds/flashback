﻿$termStore = Read-PnPTenantTemplate -Path "C:\Code\Projects\flashback\provisioning\flashback-tenantsettings.xml"
Save-PnPTenantTemplate -Hierarchy $termStore -Out "C:\Code\Projects\flashback\provisioning\flashback-tenantsettings.pnp"