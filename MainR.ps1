$Username = ""
$Password = ""
$url2 = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/Assets/SetTaskbar.vbs"
$path2 = "C:\Windows\Computer Repair Centre\SetTaskbar.vbs"
$url3 = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/Assets/SetTaskbar.exe"
$path3 = "C:\Windows\Computer Repair Centre\SetTaskbar.exe"
$url4 = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/Assets/CRC.bmp"
$path4 = "C:\Windows\Computer Repair Centre\CRC.bmp"
$url5 = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/Assets/CRC Icon.ico"
$path5 = "C:\Windows\Computer Repair Centre\CRC Icon.ico"
$url6 = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/Assets/SetTaskbar.bat"
$path6 = "C:\Windows\Computer Repair Centre\SetTaskbar.bat"
$url7 = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/ExitCF.ps1"
$path7 = "C:\Windows\Computer Repair Centre\ExitCF.ps1"
$url8 = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/Assets/7zip.ico"
$path8 = "C:\Windows\Computer Repair Centre\7zip.ico"
$url9 = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/Assets/GoogleChrome.ico"
$path9 = "C:\Windows\Computer Repair Centre\GoogleChrome.ico"
$url10 = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/Assets/KasperskyInternetSecurity.ico"
$path10 = "C:\Windows\Computer Repair Centre\KasperskyInternetSecurity.ico"
$url11 = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/Assets/LibreOffice.ico"
$path11 = "C:\Windows\Computer Repair Centre\LibreOffice.ico"
$url12 = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/Assets/MozillaFirefox.ico"
$path12 = "C:\Windows\Computer Repair Centre\MozillaFirefox.ico"
$url13 = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/Assets/TeamViewer.ico"
$path13 = "C:\Windows\Computer Repair Centre\TeamViewer.ico"
$url14 = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/Assets/VLCMediaPlayer.ico"
$path14 = "C:\Windows\Computer Repair Centre\VLCMediaPlayer.ico"
$WebClient = New-Object System.Net.WebClient
$WebClient.Credentials = New-Object System.Net.Networkcredential($Username, $Password)
$WebClient.DownloadFile($url2, $path2)
$WebClient.DownloadFile($url3, $path3)
$WebClient.DownloadFile($url4, $path4)
$WebClient.DownloadFile($url5, $path5)
$WebClient.DownloadFile($url6, $path6)
$WebClient.DownloadFile($url7, $path7)
$WebClient.DownloadFile($url8, $path8)
$WebClient.DownloadFile($url9, $path9)
$WebClient.DownloadFile($url10, $path10)
$WebClient.DownloadFile($url11, $path11)
$WebClient.DownloadFile($url12, $path12)
$WebClient.DownloadFile($url13, $path13)
$WebClient.DownloadFile($url14, $path14)
#OS
$OS = (Get-WmiObject -Class Win32_OperatingSystem).version
#Log file
$date = Get-Date -Format "yyyy.MM.dd HH.mm"
$log = $date + " " + $env:ComputerName
$log
#Generate form
function GenerateForm {
[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
[reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null
$form1 = New-Object System.Windows.Forms.Form
$install = New-Object System.Windows.Forms.Button
$listBox1 = New-Object System.Windows.Forms.ListBox
$crc = New-Object System.Windows.Forms.CheckBox
$mozillaFirefox = New-Object System.Windows.Forms.CheckBox
$googleChrome = New-Object System.Windows.Forms.CheckBox
$kaspersky = New-Object System.Windows.Forms.CheckBox
$vlc = New-Object System.Windows.Forms.CheckBox
$7zip = New-Object System.Windows.Forms.CheckBox
$libreOffice = New-Object System.Windows.Forms.CheckBox
$teamViewer = New-Object System.Windows.Forms.CheckBox
$InitialFormWindowState = New-Object System.Windows.Forms.FormWindowState
$b1= $false
$b2= $false
$b3= $false
#----------------------------------------------
#Generated Event Script Blocks
#----------------------------------------------
$handler_install_Click= 
{
	$env:ComputerName | Out-File "C:/Windows/Computer Repair Centre/$log.log" -Append
	$date | Out-File "C:/Windows/Computer Repair Centre/$log.log" -Append
	$OS | Out-File "C:/Windows/Computer Repair Centre/$log.log" -Append
    $listBox1.Items.Clear();    
    if ($crc.Checked)	{
		$listBox1.Items.Add("CRC OEM is checked."  )
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		}
	if ($7zip.Checked)	{
		$listBox1.Items.Add("7zip is checked."  )
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		}
    if ($googleChrome.Checked)	{
		$listBox1.Items.Add("Google Chrome is checked."  )
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		}
	if ($kaspersky.Checked)	{
		$listBox1.Items.Add("Kaspersky Internet Security 2017 is checked."  )
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		}
	if ($libreOffice.Checked)	{
		$listBox1.Items.Add("LibreOffice is checked."  )
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		}
    if ($mozillaFirefox.Checked)	{
		$listBox1.Items.Add("Mozilla Firefox is checked."  )
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		}
	if ($teamViewer.Checked)	{
		$listBox1.Items.Add("TeamViewer is checked."  )
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		}
	if ($vlc.Checked)	{
		$listBox1.Items.Add("VLC Media Player is checked."  )
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		}
    if (!$crc.Checked -and !$7zip.Checked -and !$googleChrome.Checked -and !$kaspersky.Checked -and !$libreOffice.Checked -and !$mozillaFirefox.Checked -and !$teamViewer.Checked -and !$vlc.Checked){
		$listBox1.Items.Add("No programs are selected, please select some programs to install.")
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		} 
	$listBox1.Items.Add("Installing Chocolately ...")
	$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
	$listBox1.SelectedIndex = -1;
	iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
	$listBox1.Items.Add("Finished installing Chocolately ...")
	$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
	$listBox1.SelectedIndex = -1;
	$listBox1.Items.Add("Installing .NET4.5 ...")
	$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
	$listBox1.SelectedIndex = -1;
	choco install dotnet4.5 -y | Out-File "C:/Windows/Computer Repair Centre/$log.log" -Append
	$listBox1.Items.Add("Finished installing .NET4.5 ...")
	$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
	$listBox1.SelectedIndex = -1;
	if ($crc.Checked)	{
	    $listBox1.Items.Add("Installing CRC OEM information ...")
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name Logo -value "C:\Windows\Computer Repair Centre\CRC.bmp"
		Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name Manufacturer -value "Computer Repair Centre"
		Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name SupportHours -value "TBD"
		Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name SupportPhone -value "01794 517142"
		Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name SupportURL -value "https://www.firstforitrepairs.co.uk"
		$listBox1.Items.Add("Finished installing CRC OEM information.")
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		}
	if ($7zip.Checked)	{
		$listBox1.Items.Add("Starting installing 7zip ...")
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		choco install 7zip.install -y | Out-File "C:/Windows/Computer Repair Centre/$log.log" -Append
		$listBox1.Items.Add("Finished installing 7zip.")
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		}
	if ($googleChrome.Checked)	{
		$listBox1.Items.Add("Starting installing Google Chrome ...")
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		choco install googlechrome -y --ignore-checksums | Out-File "C:/Windows/Computer Repair Centre/$log.log" -Append
		$listBox1.Items.Add("Finished installing Google Chrome.")
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		}
	if ($kaspersky.Checked)	{
		$listBox1.Items.Add("Starting installing Kaspersky Internet Security 2017 ...")
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		choco install kis -y | Out-File "C:/Windows/Computer Repair Centre/$log.log" -Append
		$listBox1.Items.Add("Finished installing Kaspersky Internet Security 2017.")
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		}
	if ($libreOffice.Checked)	{
		$listBox1.Items.Add("Starting installing LibreOffice ...")
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		choco install libreoffice -y | Out-File "C:/Windows/Computer Repair Centre/$log.log" -Append
		$listBox1.Items.Add("Finished installing LibreOffice.")
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		}
	if ($mozillaFirefox.Checked)	{
		$listBox1.Items.Add("Installing Mozilla Firefox ...")
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		choco install firefox -y | Out-File "C:/Windows/Computer Repair Centre/$log.log" -Append
		$listBox1.Items.Add("Finished installing Firefox."  )
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		}
	if ($teamViewer.Checked)	{
		$listBox1.Items.Add("Starting installing TeamViewer ...")
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		choco install teamviewer -y | Out-File "C:/Windows/Computer Repair Centre/$log.log" -Append
		$listBox1.Items.Add("Finished installing TeamViewer.")
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		}
	if ($vlc.Checked)	{
		$listBox1.Items.Add("Starting installing VLC Media Player ...")
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		choco install vlc -y | Out-File "C:/Windows/Computer Repair Centre/$log.log" -Append
		$listBox1.Items.Add("Finished installing VLC Media Player.")
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		}
	if ($OS -like '*6.1*')	{
		$listBox1.Items.Add("This computer is running Windows 7.")
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		$listBox1.Items.Add("Setting taskbar icons ...")
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		& "C:\Windows\Computer Repair Centre\SetTaskbar.vbs"
		$listBox1.Items.Add("The install has finished!")
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		}
	if ($OS -like '*6.2*')	{
		$listBox1.Items.Add("This computer is running Windows 8.")
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		$listBox1.Items.Add("Setting taskbar icons ...")
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name Favorites -value ff
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name FavoritesChanges -value 00000010
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name FavoritesVersion -value 00000002
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name FavoritesRemovedChanges -value 00000001
		& "C:\Windows\Computer Repair Centre\SetTaskbar.bat"
		$listBox1.Items.Add("The install has finished!")
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		}
	if ($OS -like '*6.3*')	{
		$listBox1.Items.Add("This computer is running Windows 8.1.")
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		$listBox1.Items.Add("Setting taskbar icons ...")
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name Favorites -value ff
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name FavoritesChanges -value 00000010
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name FavoritesVersion -value 00000002
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name FavoritesRemovedChanges -value 00000001
		& "C:\Windows\Computer Repair Centre\SetTaskbar.bat"
		$listBox1.Items.Add("The install has finished!")
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		}
	if ($OS -like '*10.0*')	{
		$listBox1.Items.Add("This computer is running Windows 10.")
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		$listBox1.Items.Add("Setting explorer to open to This PC ...")
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -name LaunchTo -value 1
		$listBox1.Items.Add("Disabling hibernation mode ...")
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		Set-ItemProperty -path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power" -name HiberbootEnabled -value 0
		$listBox1.Items.Add("Disabling Telemetry ...")
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection -Name AllowTelemetry -Type DWord -Value 0
		Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection -Name AllowTelemetry -Type DWord -Value 0
		Set-ItemProperty -Path HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection -Name AllowTelemetry -Type DWord -Value 0
		$listBox1.Items.Add("Disabling Wi-Fi Sense ...")
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		New-Item -Path HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting -Force | Out-Null
		Set-ItemProperty -Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" -Name "Value" -Type DWord -Value 0
		Set-ItemProperty -Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" -Name "Value" -Type DWord -Value 0
		$listBox1.Items.Add("Disabling Bing Search in Start Menu ...")
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "BingSearchEnabled" -Type DWord -Value 0
		$listBox1.Items.Add("Disabling Start Menu suggestions ...")
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SystemPaneSuggestionsEnabled" -Type DWord -Value 0
		$listBox1.Items.Add("Disabling Cortana ...")
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		New-Item -Path "HKCU:\Software\Microsoft\Personalization\Settings" -Force | Out-Null
		Set-ItemProperty -Path "HKCU:\Software\Microsoft\Personalization\Settings" -Name "AcceptedPrivacyPolicy" -Type DWord -Value 0
		New-Item -Path "HKCU:\Software\Microsoft\InputPersonalization" -Force | Out-Null
		Set-ItemProperty -Path "HKCU:\Software\Microsoft\InputPersonalization" -Name "RestrictImplicitTextCollection" -Type DWord -Value 1
		Set-ItemProperty -Path "HKCU:\Software\Microsoft\InputPersonalization" -Name "RestrictImplicitInkCollection" -Type DWord -Value 1
		New-Item -Path "HKCU:\Software\Microsoft\InputPersonalization\TrainedDataStore" -Force | Out-Null
		Set-ItemProperty -Path "HKCU:\Software\Microsoft\InputPersonalization\TrainedDataStore" -Name "HarvestContacts" -Type DWord -Value 0
		$listBox1.Items.Add("Stopping and disabling Diagnostics Tracking Service ...")
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		Stop-Service "DiagTrack"
		Set-Service "DiagTrack" -StartupType Disabled
		$listBox1.Items.Add("Setting taskbar icons ...")
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name Favorites -value ff
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name FavoritesChanges -value 00000010
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name FavoritesVersion -value 00000002
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name FavoritesRemovedChanges -value 00000001
		& "C:\Windows\Computer Repair Centre\SetTaskbar.bat"
		$listBox1.Items.Add("The install has finished! Will close in 15 seconds.")
		$listBox1.SelectedIndex = $listBox1.Items.Count - 1;
		$listBox1.SelectedIndex = -1;
		}
	Start-Sleep -s 15
	& "C:\Windows\Computer Repair Centre\ExitR.ps1"
	$form1.Close()
}
$OnLoadForm_StateCorrection=
{#Correct the initial state of the form to prevent the .Net maximized form issue
    $form1.WindowState = $InitialFormWindowState
}
$form1.Text = "CRC Installer PS Romsey v1.4.0"
$form1.Name = "form1"
$form1.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 650
$System_Drawing_Size.Height = 270
$form1.ClientSize = $System_Drawing_Size
$form1.Icon = "C:\Windows\Computer Repair Centre\CRC Icon.ico"
#Install button
$install.TabIndex = 4
$install.Name = "install"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 75
$System_Drawing_Size.Height = 23
$install.Size = $System_Drawing_Size
$install.UseVisualStyleBackColor = $True
$install.Text = "Install"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 200
$System_Drawing_Point.Y = 13
$install.Location = $System_Drawing_Point
$install.DataBindings.DefaultDataSourceUpdateMode = 0
$install.add_Click($handler_install_Click)
$form1.Controls.Add($install)
#Text box
$listBox1.FormattingEnabled = $True
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 350
$System_Drawing_Size.Height = 250
$listBox1.Size = $System_Drawing_Size
$listBox1.DataBindings.DefaultDataSourceUpdateMode = 0
$listBox1.Name = "listBox1"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 287
$System_Drawing_Point.Y = 13
$listBox1.Location = $System_Drawing_Point
$listBox1.TabIndex = 3
$form1.Controls.Add($listBox1)
#CRC OEM
$crc.UseVisualStyleBackColor = $True
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 36
$System_Drawing_Size.Height = 24
$crc.Size = $System_Drawing_Size
$crc.TabIndex = 0
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 27
$System_Drawing_Point.Y = 13
$crc.Location = $System_Drawing_Point
$crc.DataBindings.DefaultDataSourceUpdateMode = 0
$crc.Name = "crc"
$crc.Checked = 1
$crc.Image = [System.Drawing.Image]::FromFile("C:\Windows\Computer Repair Centre\CRC Icon.ico")
$form1.Controls.Add($crc)
#Mozilla Firefox
$mozillaFirefox.UseVisualStyleBackColor = $True
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 36
$System_Drawing_Size.Height = 24
$mozillaFirefox.Size = $System_Drawing_Size
$mozillaFirefox.TabIndex = 1
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 27
$System_Drawing_Point.Y = 168
$mozillaFirefox.Location = $System_Drawing_Point
$mozillaFirefox.DataBindings.DefaultDataSourceUpdateMode = 0
$mozillaFirefox.Name = "mozillaFirefox"
$mozillaFirefox.Checked = 1
$mozillaFirefox.Image = [System.Drawing.Image]::FromFile("C:\Windows\Computer Repair Centre\MozillaFirefox.ico")
$form1.Controls.Add($mozillaFirefox)
#Google Chrome
$googleChrome.UseVisualStyleBackColor = $True
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 36
$System_Drawing_Size.Height = 24
$googleChrome.Size = $System_Drawing_Size
$googleChrome.TabIndex = 2
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 27
$System_Drawing_Point.Y = 75
$googleChrome.Location = $System_Drawing_Point
$googleChrome.DataBindings.DefaultDataSourceUpdateMode = 0
$googleChrome.Name = "googleChrome"
$googleChrome.Checked = 1
$googleChrome.Image = [System.Drawing.Image]::FromFile("C:\Windows\Computer Repair Centre\GoogleChrome.ico")
$form1.Controls.Add($googleChrome)
#Kaspersky Internet Security 2017
$kaspersky.UseVisualStyleBackColor = $True
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 36
$System_Drawing_Size.Height = 24
$kaspersky.Size = $System_Drawing_Size
$kaspersky.TabIndex = 3
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 27
$System_Drawing_Point.Y = 106
$kaspersky.Location = $System_Drawing_Point
$kaspersky.DataBindings.DefaultDataSourceUpdateMode = 0
$kaspersky.Name = "kaspersky"
$kaspersky.Checked = 1
$kaspersky.Image = [System.Drawing.Image]::FromFile("C:\Windows\Computer Repair Centre\KasperskyInternetSecurity.ico")
$form1.Controls.Add($kaspersky)
#VLC Media Player
$vlc.UseVisualStyleBackColor = $True
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 36
$System_Drawing_Size.Height = 24
$vlc.Size = $System_Drawing_Size
$vlc.TabIndex = 4
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 27
$System_Drawing_Point.Y = 230
$vlc.Location = $System_Drawing_Point
$vlc.DataBindings.DefaultDataSourceUpdateMode = 0
$vlc.Name = "vlc"
$vlc.Checked = 1
$vlc.Image = [System.Drawing.Image]::FromFile("C:\Windows\Computer Repair Centre\VLCMediaPlayer.ico")
$form1.Controls.Add($vlc)
#7zip
$7zip.UseVisualStyleBackColor = $True
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 36
$System_Drawing_Size.Height = 24
$7zip.Size = $System_Drawing_Size
$7zip.TabIndex = 5
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 27
$System_Drawing_Point.Y = 44
$7zip.Location = $System_Drawing_Point
$7zip.DataBindings.DefaultDataSourceUpdateMode = 0
$7zip.Name = "7zip"
$7zip.Checked = 1
$7zip.Image = [System.Drawing.Image]::FromFile("C:\Windows\Computer Repair Centre\7zip.ico")
$form1.Controls.Add($7zip)
#LibreOffice
$libreOffice.UseVisualStyleBackColor = $True
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 36
$System_Drawing_Size.Height = 24
$libreOffice.Size = $System_Drawing_Size
$libreOffice.TabIndex = 6
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 27
$System_Drawing_Point.Y = 137
$libreOffice.Location = $System_Drawing_Point
$libreOffice.DataBindings.DefaultDataSourceUpdateMode = 0
$libreOffice.Name = "libreOffice"
$libreOffice.Checked = 1
$libreOffice.Image = [System.Drawing.Image]::FromFile("C:\Windows\Computer Repair Centre\LibreOffice.ico")
$form1.Controls.Add($libreOffice)
#TeamViewer
$teamViewer.UseVisualStyleBackColor = $True
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 36
$System_Drawing_Size.Height = 24
$teamViewer.Size = $System_Drawing_Size
$teamViewer.TabIndex = 7
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 27
$System_Drawing_Point.Y = 199
$teamViewer.Location = $System_Drawing_Point
$teamViewer.DataBindings.DefaultDataSourceUpdateMode = 0
$teamViewer.Name = "teamViewer"
$teamViewer.Checked = 1
$teamViewer.Image = [System.Drawing.Image]::FromFile("C:\Windows\Computer Repair Centre\TeamViewer.ico")
$form1.Controls.Add($teamViewer)
#Save the initial state of the form
$InitialFormWindowState = $form1.WindowState
#Init the OnLoad event to correct the initial state of the form
$form1.add_Load($OnLoadForm_StateCorrection)
#Show the Form
$form1.ShowDialog() | Out-Null
}
#Call the Function
GenerateForm
