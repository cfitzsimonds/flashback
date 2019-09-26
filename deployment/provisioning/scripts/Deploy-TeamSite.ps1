$url = "https://cfitzsimonds.sharepoint.com/sites/testteam3"

#set up credentials
$username = 'admin@cfitzsimonds.onmicrosoft.com'
$password = 'RightP@ss!'
$encpassword = convertto-securestring -String $password -AsPlainText -Force
$creds = new-object -typename System.Management.Automation.PSCredential -argumentlist $username, $encpassword

Connect-PnPOnline -Url $url -Credentials $creds

Apply-PnPProvisioningTemplate -Path "D:\repos\flashback\deployment\provisioning\templates\TrainingTeamSite.xml" -Verbose

Disconnect-PnPOnline