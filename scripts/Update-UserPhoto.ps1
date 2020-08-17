$UserCredential = Get-Credential 
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/?proxyMethod=RPS -Credential $UserCredential -Authentication Basic -AllowRedirection 
Import-PSSession $Session -AllowClobber
 
#Update the user photos path here. Name of the file should be username of the Office365 user. 
$path= 'D:\O365Images\' 
$Images = Get-ChildItem $path 
$Images | Foreach-Object { 
    $SplitUsername = ($_.Name.Tostring() -split "\.")
    $Identity = $SplitUsername[0]+"."+$SplitUsername[1]+"."+$SplitUsername[2]
    $Identity
    $PictureData = $path+$_.name 
    $PictureData
    Write-Host "Setting user photo..."
    Set-UserPhoto -Identity $Identity -PictureData ([System.IO.File]::ReadAllBytes($PictureData)) -Confirm:$false
    Write-Host "Done"
}

