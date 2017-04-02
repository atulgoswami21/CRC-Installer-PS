#Download all assets
$Username = ""
$Password = ""
$file2 = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/Assets/SetTaskbar.vbs"
$path2 = "C:\Windows\Computer Repair Centre\SetTaskbar.vbs"
$file3 = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/Assets/CRC.bmp"
$path3 = "C:\Windows\Computer Repair Centre\CRC.bmp"
$file4 = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/Assets/7zip.ico"
$path4 = "C:\Windows\Computer Repair Centre\7zip.ico"
$file5 = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/Assets/GoogleChrome.ico"
$path5 = "C:\Windows\Computer Repair Centre\GoogleChrome.ico"
$file6 = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/Assets/KasperskyInternetSecurity.ico"
$path6 = "C:\Windows\Computer Repair Centre\KasperskyInternetSecurity.ico"
$file7 = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/Assets/LibreOffice.ico"
$path7 = "C:\Windows\Computer Repair Centre\LibreOffice.ico"
$file8 = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/Assets/MozillaFirefox.ico"
$path8 = "C:\Windows\Computer Repair Centre\MozillaFirefox.ico"
$file9 = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/Assets/TeamViewer.ico"
$path9 = "C:\Windows\Computer Repair Centre\TeamViewer.ico"
$file10 = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/Assets/VLCMediaPlayer.ico"
$path10 = "C:\Windows\Computer Repair Centre\VLCMediaPlayer.ico"
$WebClient = New-Object System.Net.WebClient
$WebClient.Credentials = New-Object System.Net.Networkcredential($Username, $Password)
$WebClient.DownloadFile($file2, $path2)
$WebClient.DownloadFile($file3, $path3)
$WebClient.DownloadFile($file4, $path4)
$WebClient.DownloadFile($file5, $path5)
$WebClient.DownloadFile($file6, $path6)
$WebClient.DownloadFile($file7, $path7)
$WebClient.DownloadFile($file8, $path8)
$WebClient.DownloadFile($file9, $path9)
$WebClient.DownloadFile($file10, $path10)

#Get OS version
$OS = (Get-WmiObject -Class Win32_OperatingSystem).version

#Generating log file
$date = Get-Date -Format "yyyy.MM.dd HH.mm"
$log = $date + " " + $env:ComputerName
$log

#Generate form
	function GenerateForm {
	[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
	[reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null
	$installer = New-Object System.Windows.Forms.Form
	$install = New-Object System.Windows.Forms.Button
	$progress = New-Object System.Windows.Forms.ListBox
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

#Install button
	$handler_install_Click= 
	{
		$env:ComputerName | Out-File "C:/Windows/Computer Repair Centre/$log.log" -Append
		$date | Out-File "C:/Windows/Computer Repair Centre/$log.log" -Append
		$OS | Out-File "C:/Windows/Computer Repair Centre/$log.log" -Append
	    $progress.Items.Clear();    
	    if ($crc.Checked)	{
			$progress.Items.Add("CRC OEM is checked."  )
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		if ($7zip.Checked)	{
			$progress.Items.Add("7zip is checked."  )
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
	    if ($googleChrome.Checked)	{
			$progress.Items.Add("Google Chrome is checked."  )
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		if ($kaspersky.Checked)	{
			$progress.Items.Add("Kaspersky Internet Security 2017 is checked."  )
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		if ($libreOffice.Checked)	{
			$progress.Items.Add("LibreOffice is checked."  )
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
	    if ($mozillaFirefox.Checked)	{
			$progress.Items.Add("Mozilla Firefox is checked."  )
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		if ($teamViewer.Checked)	{
			$progress.Items.Add("TeamViewer is checked."  )
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		if ($vlc.Checked)	{
			$progress.Items.Add("VLC Media Player is checked."  )
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
	    if (!$crc.Checked -and !$7zip.Checked -and !$googleChrome.Checked -and !$kaspersky.Checked -and !$libreOffice.Checked -and !$mozillaFirefox.Checked -and !$teamViewer.Checked -and !$vlc.Checked){
			$progress.Items.Add("No programs are selected, please select some programs to install.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			} 
		$progress.Items.Add("Installing Chocolately ...")
		$progress.SelectedIndex = $progress.Items.Count - 1;
		$progress.SelectedIndex = -1;
		iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
		$progress.Items.Add("Finished installing Chocolately ...")
		$progress.SelectedIndex = $progress.Items.Count - 1;
		$progress.SelectedIndex = -1;
		$progress.Items.Add("Installing .NET 4.5 ...")
		$progress.SelectedIndex = $progress.Items.Count - 1;
		$progress.SelectedIndex = -1;
		choco install dotnet4.5 -y | Out-File "C:/Windows/Computer Repair Centre/$log.log" -Append
		$progress.Items.Add("Finished installing .NET 4.5 ...")
		$progress.SelectedIndex = $progress.Items.Count - 1;
		$progress.SelectedIndex = -1;
		$progress.Items.Add("Installing .NET 4.6.1 ...")
		$progress.SelectedIndex = $progress.Items.Count - 1;
		$progress.SelectedIndex = -1;
		choco install dotnet4.6.1 -y | Out-File "C:/Windows/Computer Repair Centre/$log.log" -Append
		$progress.Items.Add("Finished installing .NET 4.6.1 ...")
		$progress.SelectedIndex = $progress.Items.Count - 1;
		$progress.SelectedIndex = -1;
		$progress.Items.Add("Installing PowerShell 5 ...")
		$progress.SelectedIndex = $progress.Items.Count - 1;
		$progress.SelectedIndex = -1;
		choco install powershell -y | Out-File "C:/Windows/Computer Repair Centre/$log.log" -Append
		$progress.Items.Add("Finished installing PowerShell 5 ...")
		$progress.SelectedIndex = $progress.Items.Count - 1;
		$progress.SelectedIndex = -1;
		if ($crc.Checked)	{
		    $progress.Items.Add("Installing CRC OEM information ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name Logo -value "C:\Windows\Computer Repair Centre\CRC.bmp"
			Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name Manufacturer -value "Computer Repair Centre"
			Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name SupportHours -value "TBD"
			Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name SupportPhone -value "01794 517142"
			Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name SupportURL -value "https://www.firstforitrepairs.co.uk"
			$progress.Items.Add("Finished installing CRC OEM information.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		if ($7zip.Checked)	{
			$progress.Items.Add("Starting installing 7zip ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			choco install 7zip.install -y --ignore-checksum | Out-File "C:/Windows/Computer Repair Centre/$log.log" -Append
			$progress.Items.Add("Finished installing 7zip.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		if ($googleChrome.Checked)	{
			$progress.Items.Add("Starting installing Google Chrome ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			choco install googlechrome -y --ignore-checksums | Out-File "C:/Windows/Computer Repair Centre/$log.log" -Append
			$progress.Items.Add("Finished installing Google Chrome.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		if ($kaspersky.Checked)	{
			$progress.Items.Add("Starting installing Kaspersky Internet Security 2017 ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			choco install kis -y --ignore-checksum | Out-File "C:/Windows/Computer Repair Centre/$log.log" -Append
			$progress.Items.Add("Finished installing Kaspersky Internet Security 2017.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		if ($libreOffice.Checked)	{
			$progress.Items.Add("Starting installing LibreOffice ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			choco install libreoffice -y --ignore-checksum | Out-File "C:/Windows/Computer Repair Centre/$log.log" -Append
			$progress.Items.Add("Finished installing LibreOffice.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		if ($mozillaFirefox.Checked)	{
			$progress.Items.Add("Installing Mozilla Firefox ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			choco install firefox -y --ignore-checksum | Out-File "C:/Windows/Computer Repair Centre/$log.log" -Append
			$progress.Items.Add("Finished installing Firefox."  )
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		if ($teamViewer.Checked)	{
			$progress.Items.Add("Starting installing TeamViewer ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			choco install teamviewer -y --ignore-checksum | Out-File "C:/Windows/Computer Repair Centre/$log.log" -Append
			$progress.Items.Add("Finished installing TeamViewer.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		if ($vlc.Checked)	{
			$progress.Items.Add("Starting installing VLC Media Player ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			choco install vlc -y --ignore-checksum | Out-File "C:/Windows/Computer Repair Centre/$log.log" -Append
			$progress.Items.Add("Finished installing VLC Media Player.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		if ($OS -like '*6.1*')	{
			$progress.Items.Add("This computer is running Windows 7.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Setting taskbar icons ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			& "C:\Windows\Computer Repair Centre\SetTaskbar.vbs"
			$progress.Items.Add("The install has finished!")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		if ($OS -like '*6.2*')	{
			$progress.Items.Add("This computer is running Windows 8.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Setting taskbar icons ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name Favorites -value ff
			Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name FavoritesChanges -value 00000010
			Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name FavoritesVersion -value 00000002
			Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name FavoritesRemovedChanges -value 00000001
			& "C:\Windows\Computer Repair Centre\SetTaskbar.bat"
			$progress.Items.Add("The install has finished!")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		if ($OS -like '*6.3*')	{
			$progress.Items.Add("This computer is running Windows 8.1.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Setting taskbar icons ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name Favorites -value ff
			Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name FavoritesChanges -value 00000010
			Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name FavoritesVersion -value 00000002
			Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name FavoritesRemovedChanges -value 00000001
			& "C:\Windows\Computer Repair Centre\SetTaskbar.bat"
			$progress.Items.Add("The install has finished!")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		if ($OS -like '*10.0*')	{
			$progress.Items.Add("This computer is running Windows 10.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Setting explorer to open to This PC ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -name LaunchTo -value 1
			$progress.Items.Add("Disabling hibernation mode ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			Set-ItemProperty -path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power" -name HiberbootEnabled -value 0
			$progress.Items.Add("Disabling Telemetry ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection -Name AllowTelemetry -Type DWord -Value 0
			Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection -Name AllowTelemetry -Type DWord -Value 0
			Set-ItemProperty -Path HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection -Name AllowTelemetry -Type DWord -Value 0
			$progress.Items.Add("Disabling Wi-Fi Sense ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			New-Item -Path HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting -Force | Out-Null
			Set-ItemProperty -Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" -Name "Value" -Type DWord -Value 0
			Set-ItemProperty -Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" -Name "Value" -Type DWord -Value 0
			$progress.Items.Add("Disabling Bing Search in Start Menu ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "BingSearchEnabled" -Type DWord -Value 0
			$progress.Items.Add("Disabling Start Menu suggestions ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SystemPaneSuggestionsEnabled" -Type DWord -Value 0
			$progress.Items.Add("Disabling Cortana ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			New-Item -Path "HKCU:\Software\Microsoft\Personalization\Settings" -Force | Out-Null
			Set-ItemProperty -Path "HKCU:\Software\Microsoft\Personalization\Settings" -Name "AcceptedPrivacyPolicy" -Type DWord -Value 0
			New-Item -Path "HKCU:\Software\Microsoft\InputPersonalization" -Force | Out-Null
			Set-ItemProperty -Path "HKCU:\Software\Microsoft\InputPersonalization" -Name "RestrictImplicitTextCollection" -Type DWord -Value 1
			Set-ItemProperty -Path "HKCU:\Software\Microsoft\InputPersonalization" -Name "RestrictImplicitInkCollection" -Type DWord -Value 1
			New-Item -Path "HKCU:\Software\Microsoft\InputPersonalization\TrainedDataStore" -Force | Out-Null
			Set-ItemProperty -Path "HKCU:\Software\Microsoft\InputPersonalization\TrainedDataStore" -Name "HarvestContacts" -Type DWord -Value 0
			$progress.Items.Add("Stopping and disabling Diagnostics Tracking Service ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			Stop-Service "DiagTrack"
			Set-Service "DiagTrack" -StartupType Disabled
			$progress.Items.Add("The install has finished! Will close in 15 seconds.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		Start-Sleep -s 15
		$installer.Close()
	}
	$OnLoadForm_StateCorrection=
	{
	    $installer.WindowState = $InitialFormWindowState
	}
	
#Main form
	$installer.Text = "CRC Installer PS Romsey v1.7.1"
	$installer.Name = "form1"
	$installer.DataBindings.DefaultDataSourceUpdateMode = 0
	$System_Drawing_Size = New-Object System.Drawing.Size
	$System_Drawing_Size.Width = 650
	$System_Drawing_Size.Height = 270
	$installer.ClientSize = $System_Drawing_Size
	$installer.Icon = "$Env:p2eincfilepath\CRC Icon.ico"
	
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
	$installer.Controls.Add($install)
	
#Progress box
	$progress.FormattingEnabled = $True
	$System_Drawing_Size = New-Object System.Drawing.Size
	$System_Drawing_Size.Width = 350
	$System_Drawing_Size.Height = 250
	$progress.Size = $System_Drawing_Size
	$progress.DataBindings.DefaultDataSourceUpdateMode = 0
	$progress.Name = "listBox1"
	$System_Drawing_Point = New-Object System.Drawing.Point
	$System_Drawing_Point.X = 287
	$System_Drawing_Point.Y = 13
	$progress.Location = $System_Drawing_Point
	$progress.TabIndex = 3
	$installer.Controls.Add($progress)
	
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
	$installer.Controls.Add($crc)
	
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
	$installer.Controls.Add($mozillaFirefox)
	
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
	$installer.Controls.Add($googleChrome)
	
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
	$installer.Controls.Add($kaspersky)
	
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
	$installer.Controls.Add($vlc)
	
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
	$installer.Controls.Add($7zip)
	
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
	$installer.Controls.Add($libreOffice)
	
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
	$installer.Controls.Add($teamViewer)
	
#Save the initial state of the form
	$InitialFormWindowState = $installer.WindowState
	$installer.add_Load($OnLoadForm_StateCorrection)
	
#Show the Form
	$installer.ShowDialog() | Out-Null
	}
	
#Call the Function
GenerateForm
