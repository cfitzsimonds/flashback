Param(
    [Parameter(Mandatory = $true)]
    [string]$SiteTitle,
    [Parameter(Mandatory = $true, HelpMessage="Enter the URL fragment for the department site (e.g. human-resources)")]
    [string]$SiteUrlFragment
)

$tenantName = "cfitzsimonds"
$url = "https://"+$tenantName+".sharepoint.com/sites/"+$SiteUrlFragment
$adminUrl = "https://"+$tenantName+"-admin.sharepoint.com/"

$Group = Read-Host "Will this site be connected to an Office 365 group? (Y or N)"

Write-Host "Confirm new site URL: $url"

$Run = Read-Host "Would you like to run? (Y or N)"
if ($Run.ToLower() -eq "y")
{
    #set up credentials
    #$creds = Get-Credential
    $username = 'admin@cfitzsimonds.onmicrosoft.com'
    $password = 'RightP@ss!'
    $encpassword = convertto-securestring -String $password -AsPlainText -Force
    $creds = new-object -typename System.Management.Automation.PSCredential -argumentlist $username, $encpassword

    Connect-PnPOnline $adminUrl -Credentials $creds

    $site_exists = $false

    try {
        Connect-PnPOnline -Url $url -Credentials $creds
        Write-Host "Site already exists" -ForegroundColor Yellow
        $site_exists = $true
    }
    catch [Exception] {
        Write-Host "Site does not exist yet"
    }

    if ($site_exists -eq $false) {
        Write-Host "Creating new site $url..."
        if ($Group.ToLower() -eq "y")
        {
            $new_site_url = New-PnPSite -Type TeamSite -Title $SiteTitle -Alias $SiteUrlFragment
        }
        else
        {
            $new_site_url = New-PnPTenantSite -Title $SiteTitle -Url $url -Owner $username -TimeZone 10 -Template STS#3
        }
        Write-Host "Created site $new_site_url"
        Write-Host "Pause script for 3 minutes to allow time for all SPO fields to be provisioned..."
        Start-Sleep -s 180
        Write-Host "Pause complete"
    }

    Disconnect-PnPOnline

    Connect-PnPOnline $url -Credentials $creds -ErrorAction Stop
    Write-Host "Connected to site $url" -ForegroundColor Yellow

    Write-Host "Applying team site template..."

    if ($Group.ToLower() -eq "y")
    {
        #Group
        Apply-PnPProvisioningTemplate -Path "D:\repos\flashback\provisioning\flashback-sitetemplate.xml"
    }
    else
    {
        #No group
        Apply-PnPProvisioningTemplate -Path ""
        Apply-PnPProvisioningTemplate -Path ""
    }

    Write-Host "Team site template applied"

    <# 
    #default site designs are now automating this step
    Write-Host "Applying site design..."

    Invoke-SPOSiteDesign -Identity 4f9e3ae1-885f-49e6-8a0f-05978464dd2b -WebUrl $url

    Write-Host "Site design applied"
    #>

    Write-Host "Flashback team site provisioning complete" -ForegroundColor Green

    Disconnect-PnPOnline
}