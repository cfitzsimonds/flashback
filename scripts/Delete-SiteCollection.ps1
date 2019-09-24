$adminUrl = "https://cfitzsimonds-admin.sharepoint.com"
$siteUrl = "https://cfitzsimonds.sharepoint.com/sites/sharepointtraining"

#set up credentials
$username = 'admin@cfitzsimonds.onmicrosoft.com'
$password = 'RightP@ss!'
$encpassword = convertto-securestring -String $password -AsPlainText -Force
$creds = new-object -typename System.Management.Automation.PSCredential -argumentlist $username, $encpassword

Connect-PnPOnline -Url $adminUrl -Credentials $creds
Remove-PnPTenantSite -Url $siteUrl -Force -SkipRecycleBin
Disconnect-PnPOnline