#Write-Output "Connecting to BRM Open wireless network ..."
#Copy-Item "$env:p2eincfilepath\Wi-Fi-BRM-Open.xml" "C:\Windows\BRM Computers\"
#netsh wlan add profile filename="C:\Windows\BRM Computers\Wi-Fi-BRM-Open.xml" user=all
#Start-Sleep -s 10
#Write-Output "Connected to BRM Open."
Write-Output "Downloading latest version of BRM Installer PowerShell ..."
New-Item -ItemType directory -Path "C:\Windows\BRM Computers\" | Out-Null
$url1 = "https://raw.githubusercontent.com/TheJumpyWizard/BRM-Installer-PS/master/MainCF.ps1"
$path1 = "C:\Windows\BRM Computers\MainCF.ps1"
$Username = ""
$Password = ""
$WebClient = New-Object System.Net.WebClient
$WebClient.Credentials = New-Object System.Net.Networkcredential($Username, $Password)
$WebClient.DownloadFile( $url1, $path1 )
Write-Output "Running BRM Installer PowerShell ..."
& "C:\Windows\BRM Computers\MainCF.ps1"