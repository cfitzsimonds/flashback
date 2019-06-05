$username = 'admin@cfitzsimonds.onmicrosoft.com'
$password = ''
$encpassword = convertto-securestring -String $password -AsPlainText -Force
$creds = new-object -typename System.Management.Automation.PSCredential -argumentlist $username, $encpassword
$url = "https://cfitzsimonds.sharepoint.com/sites/comm-template"

Connect-PnPOnline -Url $url -Credentials $creds

Get-PnPProvisioningTemplate -Out C:\Code\Projects\flashback\templates\CommHomePageTemplate.xml

Disconnect-PnPOnline
