Write-Output "Downloading latest version of CRC Installer PowerShell Romsey ..."
New-Item -ItemType directory -Path "C:\Windows\Computer Repair Centre\" | Out-Null
$url1 = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/MainR.ps1"
$path1 = "C:\Windows\Computer Repair Centre\MainR.ps1"
$Username = ""
$Password = ""
$WebClient = New-Object System.Net.WebClient
$WebClient.Credentials = New-Object System.Net.Networkcredential($Username, $Password)
$WebClient.DownloadFile( $url1, $path1 )
Write-Output "Running CRC Installer PowerShell Romsey ..."
& "C:\Windows\Computer Repair Centre\MainR.ps1"