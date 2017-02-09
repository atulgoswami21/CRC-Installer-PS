iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
$Username = ""
$Password = ""
$url2 = "https://raw.githubusercontent.com/charliehoward/BRM-Installer-PS/master/Assets/SetTaskbar.vbs"
$path2 = "C:\Windows\BRM Computers\SetTaskbar.vbs"
$url3 = "https://raw.githubusercontent.com/charliehoward/BRM-Installer-PS/master/Assets/SetTaskbar.exe"
$path3 = "C:\Windows\BRM Computers\SetTaskbar.exe"
$url4 = "https://raw.githubusercontent.com/charliehoward/BRM-Installer-PS/master/Assets/OEM.bmp"
$path4 = "C:\Windows\BRM Computers\OEM.bmp"
$url5 = "https://raw.githubusercontent.com/charliehoward/BRM-Installer-PS/master/Assets/OEM.ico"
$path5 = "C:\Windows\BRM Computers\OEM.ico"
$url6 = "https://raw.githubusercontent.com/charliehoward/BRM-Installer-PS/master/Assets/SetTaskbar.bat"
$path6 = "C:\Windows\BRM Computers\SetTaskbar.bat"
$url7 = "https://raw.githubusercontent.com/charliehoward/BRM-Installer-PS/master/ExitCF.ps1"
$path7 = "C:\Windows\BRM Computers\ExitCF.ps1"
$WebClient = New-Object System.Net.WebClient
$WebClient.Credentials = New-Object System.Net.Networkcredential($Username, $Password)
$WebClient.DownloadFile( $url2, $path2 )
$WebClient.DownloadFile( $url3, $path3 )
$WebClient.DownloadFile( $url4, $path4 )
$WebClient.DownloadFile( $url5, $path5 )
$WebClient.DownloadFile( $url6, $path6 )
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
$exit = New-Object System.Windows.Forms.Button
$listBox1 = New-Object System.Windows.Forms.ListBox
$brm = New-Object System.Windows.Forms.CheckBox
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
	$env:ComputerName | Out-File "C:/Windows/BRM Computers/$log.log" -Append
	$date | Out-File "C:/Windows/BRM Computers/$log.log" -Append
	$OS | Out-File "C:/Windows/BRM Computers/$log.log" -Append
    $listBox1.Items.Clear();    
    if ($brm.Checked)	{
		$listBox1.Items.Add("BRM OEM is checked."  )
		}
	if ($7zip.Checked)	{
		$listBox1.Items.Add("7zip is checked."  )
		}
    if ($googleChrome.Checked)	{
		$listBox1.Items.Add("Google Chrome is checked."  )
		}
	if ($kaspersky.Checked)	{
		$listBox1.Items.Add("Kaspersky Internet Security 2017 is checked."  )
		}
	if ($libreOffice.Checked)	{
		$listBox1.Items.Add("LibreOffice is checked."  )
		}
    if ($mozillaFirefox.Checked)	{
		$listBox1.Items.Add("Mozilla Firefox is checked."  )
		}
	if ($teamViewer.Checked)	{
		$listBox1.Items.Add("TeamViewer is checked."  )
		}
	if ($vlc.Checked)	{
		$listBox1.Items.Add("VLC Media Player is checked."  )
		}
    if (!$brm.Checked -and !$7zip.Checked -and !$googleChrome.Checked -and !$kaspersky.Checked -and !$libreOffice.Checked -and !$mozillaFirefox.Checked -and !$teamViewer.Checked -and !$vlc.Checked){
		$listBox1.Items.Add("No programs are selected, please select some programs to install.")
		} 
	$listBox1.Items.Add("Installing .NET4.5 ...")
	choco install dotnet4.5 -y | Out-File "C:/Windows/BRM Computers/$log.log" -Append
	$listBox1.Items.Add("Finished installing .NET4.5 ...")
	if ($brm.Checked)	{
	    $listBox1.Items.Add("Installing BRM OEM information ...")
		Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name Logo -value "C:\Windows\BRM Computers\OEM.bmp"
		Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name Manufacturer -value "BRM Computers"
		Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name SupportHours -value "Mon-Fri 9am-5pm - Sat 9am-4pm"
		Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name SupportPhone -value "08712 244129"
		Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name SupportURL -value "http://www.brmcomputers.co.uk"
		$listBox1.Items.Add("Finished installing BRM OEM information.")
		}
	if ($7zip.Checked)	{
		$listBox1.Items.Add("Starting installing 7zip ...")
		choco install 7zip.install -y | Out-File "C:/Windows/BRM Computers/$log.log" -Append
		$listBox1.Items.Add("Finished installing 7zip.")
		}
	if ($googleChrome.Checked)	{
		$listBox1.Items.Add("Starting installing Google Chrome ...")
		choco install googlechrome -y | Out-File "C:/Windows/BRM Computers/$log.log" -Append
		$listBox1.Items.Add("Finished installing Google Chrome.")
		}
	if ($kaspersky.Checked)	{
		$listBox1.Items.Add("Starting installing Kaspersky Internet Security 2017 ...")
		choco install kis -y | Out-File "C:/Windows/BRM Computers/$log.log" -Append
		$listBox1.Items.Add("Finished installing Kaspersky Internet Security 2017.")
		}
	if ($libreOffice.Checked)	{
		$listBox1.Items.Add("Starting installing LibreOffice ...")
		choco install libreoffice -y | Out-File "C:/Windows/BRM Computers/$log.log" -Append
		$listBox1.Items.Add("Finished installing LibreOffice.")
		}
	if ($mozillaFirefox.Checked)	{
		$listBox1.Items.Add("Installing Mozilla Firefox ...")
		choco install firefox -y | Out-File "C:/Windows/BRM Computers/$log.log" -Append
		$listBox1.Items.Add("Finished installing Firefox."  )
		}
	if ($teamViewer.Checked)	{
		$listBox1.Items.Add("Starting installing TeamViewer ...")
		choco install teamviewer -y | Out-File "C:/Windows/BRM Computers/$log.log" -Append
		$listBox1.Items.Add("Finished installing TeamViewer.")
		}
	if ($vlc.Checked)	{
		$listBox1.Items.Add("Starting installing VLC Media Player ...")
		choco install vlc -y | Out-File "C:/Windows/BRM Computers/$log.log" -Append
		$listBox1.Items.Add("Finished installing VLC Media Player.")
		}
	if ($OS -like '*6.1*')	{
		$listBox1.Items.Add("This computer is running Windows 7.")
		& "C:\Windows\BRM Computers\SetTaskbar.vbs"
		$listBox1.Items.Add("The install has finished!")
		}
	if ($OS -like '*6.2*')	{
		$listBox1.Items.Add("This computer is running Windows 8.")
		$listBox1.Items.Add("Setting taskbar icons ...")
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name Favorites -value ff
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name FavoritesChanges -value 00000010
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name FavoritesVersion -value 00000002
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name FavoritesRemovedChanges -value 00000001
		& "C:\Windows\BRM Computers\SetTaskbar.bat"
		$listBox1.Items.Add("The install has finished!")
		}
	if ($OS -like '*6.3*')	{
		$listBox1.Items.Add("This computer is running Windows 8.1.")
		$listBox1.Items.Add("Setting taskbar icons ...")
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name Favorites -value ff
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name FavoritesChanges -value 00000010
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name FavoritesVersion -value 00000002
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name FavoritesRemovedChanges -value 00000001
		& "C:\Windows\BRM Computers\SetTaskbar.bat"
		$listBox1.Items.Add("The install has finished!")
		}
	if ($OS -like '*10.0*')	{
		$listBox1.Items.Add("This computer is running Windows 10.")
		$listBox1.Items.Add("Setting explorer to open to This PC ...")
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -name LaunchTo -value 1
		$listBox1.Items.Add("Disabling hibernation mode ...")
		Set-ItemProperty -path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power" -name HiberbootEnabled -value 0
		$listBox1.Items.Add("Disabling Telemetry ...")
		Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection -Name AllowTelemetry -Type DWord -Value 0
		Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection -Name AllowTelemetry -Type DWord -Value 0
		Set-ItemProperty -Path HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection -Name AllowTelemetry -Type DWord -Value 0
		$listBox1.Items.Add("Disabling Wi-Fi Sense ...")
		New-Item -Path HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting -Force | Out-Null
		Set-ItemProperty -Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" -Name "Value" -Type DWord -Value 0
		Set-ItemProperty -Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" -Name "Value" -Type DWord -Value 0
		$listBox1.Items.Add("Disabling Bing Search in Start Menu ...")
		Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "BingSearchEnabled" -Type DWord -Value 0
		$listBox1.Items.Add("Disabling Start Menu suggestions ...")
		Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SystemPaneSuggestionsEnabled" -Type DWord -Value 0
		$listBox1.Items.Add("Disabling Cortana ...")
		New-Item -Path "HKCU:\Software\Microsoft\Personalization\Settings" -Force | Out-Null
		Set-ItemProperty -Path "HKCU:\Software\Microsoft\Personalization\Settings" -Name "AcceptedPrivacyPolicy" -Type DWord -Value 0
		New-Item -Path "HKCU:\Software\Microsoft\InputPersonalization" -Force | Out-Null
		Set-ItemProperty -Path "HKCU:\Software\Microsoft\InputPersonalization" -Name "RestrictImplicitTextCollection" -Type DWord -Value 1
		Set-ItemProperty -Path "HKCU:\Software\Microsoft\InputPersonalization" -Name "RestrictImplicitInkCollection" -Type DWord -Value 1
		New-Item -Path "HKCU:\Software\Microsoft\InputPersonalization\TrainedDataStore" -Force | Out-Null
		Set-ItemProperty -Path "HKCU:\Software\Microsoft\InputPersonalization\TrainedDataStore" -Name "HarvestContacts" -Type DWord -Value 0
		$listBox1.Items.Add("Stopping and disabling Diagnostics Tracking Service ...")
		Stop-Service "DiagTrack"
		Set-Service "DiagTrack" -StartupType Disabled
		$listBox1.Items.Add("Setting taskbar icons ...")
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name Favorites -value ff
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name FavoritesChanges -value 00000010
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name FavoritesVersion -value 00000002
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name FavoritesRemovedChanges -value 00000001
		& "C:\Windows\BRM Computers\SetTaskbar.bat"
		$listBox1.Items.Add("The install has finished!")
		}
}
$handler_install_Click= 
{
	& "C:\Windows\BRM Computers\ExitCF.ps1"
}
$OnLoadForm_StateCorrection=
{#Correct the initial state of the form to prevent the .Net maximized form issue
    $form1.WindowState = $InitialFormWindowState
}
$form1.Text = "BRM Installer PS Chandlers Ford v1.1.0"
$form1.Name = "form1"
$form1.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 650
$System_Drawing_Size.Height = 550
$form1.ClientSize = $System_Drawing_Size
$form1.Icon = "C:\Windows\BRM Computers\OEM.ico"
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
$System_Drawing_Point.X = 106
$System_Drawing_Point.Y = 480
$install.Location = $System_Drawing_Point
$install.DataBindings.DefaultDataSourceUpdateMode = 0
$install.add_Click($handler_install_Click)
$form1.Controls.Add($install)
#Exit button
$exit.TabIndex = 4
$exit.Name = "exit"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 75
$System_Drawing_Size.Height = 23
$exit.Size = $System_Drawing_Size
$exit.UseVisualStyleBackColor = $True
$exit.Text = "Exit"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 106
$System_Drawing_Point.Y = 512
$exit.Location = $System_Drawing_Point
$exit.DataBindings.DefaultDataSourceUpdateMode = 0
$exit.add_Click($handler_install_Click)
$form1.Controls.Add($exit)
#Text box
$listBox1.FormattingEnabled = $True
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 350
$System_Drawing_Size.Height = 524
$listBox1.Size = $System_Drawing_Size
$listBox1.DataBindings.DefaultDataSourceUpdateMode = 0
$listBox1.Name = "listBox1"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 287
$System_Drawing_Point.Y = 13
$listBox1.Location = $System_Drawing_Point
$listBox1.TabIndex = 3
$form1.Controls.Add($listBox1)
#BRM OEM
$brm.UseVisualStyleBackColor = $True
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 200
$System_Drawing_Size.Height = 24
$brm.Size = $System_Drawing_Size
$brm.TabIndex = 0
$brm.Text = "BRM OEM"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 27
$System_Drawing_Point.Y = 13
$brm.Location = $System_Drawing_Point
$brm.DataBindings.DefaultDataSourceUpdateMode = 0
$brm.Name = "brm"
$brm.Checked = 1
$form1.Controls.Add($brm)
$brm.ForeColor = "#20409a"
$brm.Font = New-Object System.Drawing.Font("Calibri",10,[System.Drawing.FontStyle]::Bold)
#Mozilla Firefox
$mozillaFirefox.UseVisualStyleBackColor = $True
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 200
$System_Drawing_Size.Height = 24
$mozillaFirefox.Size = $System_Drawing_Size
$mozillaFirefox.TabIndex = 1
$mozillaFirefox.Text = "Mozilla Firefox"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 27
$System_Drawing_Point.Y = 168
$mozillaFirefox.Location = $System_Drawing_Point
$mozillaFirefox.DataBindings.DefaultDataSourceUpdateMode = 0
$mozillaFirefox.Name = "mozillaFirefox"
$mozillaFirefox.Checked = 1
$form1.Controls.Add($mozillaFirefox)
$mozillaFirefox.ForeColor = "#20409a"
$mozillaFirefox.Font = New-Object System.Drawing.Font("Calibri",10,[System.Drawing.FontStyle]::Bold)
#Google Chrome
$googleChrome.UseVisualStyleBackColor = $True
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 200
$System_Drawing_Size.Height = 24
$googleChrome.Size = $System_Drawing_Size
$googleChrome.TabIndex = 2
$googleChrome.Text = "Google Chrome"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 27
$System_Drawing_Point.Y = 75
$googleChrome.Location = $System_Drawing_Point
$googleChrome.DataBindings.DefaultDataSourceUpdateMode = 0
$googleChrome.Name = "googleChrome"
$googleChrome.Checked = 1
$form1.Controls.Add($googleChrome)
$googleChrome.ForeColor = "#20409a"
$googleChrome.Font = New-Object System.Drawing.Font("Calibri",10,[System.Drawing.FontStyle]::Bold)
#Kaspersky Internet Security 2017
$kaspersky.UseVisualStyleBackColor = $True
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 250
$System_Drawing_Size.Height = 24
$kaspersky.Size = $System_Drawing_Size
$kaspersky.TabIndex = 3
$kaspersky.Text = "Kaspersky Internet Security 2017"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 27
$System_Drawing_Point.Y = 106
$kaspersky.Location = $System_Drawing_Point
$kaspersky.DataBindings.DefaultDataSourceUpdateMode = 0
$kaspersky.Name = "kaspersky"
$kaspersky.Checked = 1
$form1.Controls.Add($kaspersky)
$kaspersky.ForeColor = "#20409a"
$kaspersky.Font = New-Object System.Drawing.Font("Calibri",10,[System.Drawing.FontStyle]::Bold)
#VLC Media Player
$vlc.UseVisualStyleBackColor = $True
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 200
$System_Drawing_Size.Height = 24
$vlc.Size = $System_Drawing_Size
$vlc.TabIndex = 4
$vlc.Text = "VLC Media Player"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 27
$System_Drawing_Point.Y = 230
$vlc.Location = $System_Drawing_Point
$vlc.DataBindings.DefaultDataSourceUpdateMode = 0
$vlc.Name = "vlc"
$vlc.Checked = 1
$form1.Controls.Add($vlc)
$vlc.ForeColor = "#20409a"
$vlc.Font = New-Object System.Drawing.Font("Calibri",10,[System.Drawing.FontStyle]::Bold)
#7zip
$7zip.UseVisualStyleBackColor = $True
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 200
$System_Drawing_Size.Height = 24
$7zip.Size = $System_Drawing_Size
$7zip.TabIndex = 5
$7zip.Text = "7zip"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 27
$System_Drawing_Point.Y = 44
$7zip.Location = $System_Drawing_Point
$7zip.DataBindings.DefaultDataSourceUpdateMode = 0
$7zip.Name = "7zip"
$7zip.Checked = 1
$form1.Controls.Add($7zip)
$7zip.ForeColor = "#20409a"
$7zip.Font = New-Object System.Drawing.Font("Calibri",10,[System.Drawing.FontStyle]::Bold)
#LibreOffice
$libreOffice.UseVisualStyleBackColor = $True
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 200
$System_Drawing_Size.Height = 24
$libreOffice.Size = $System_Drawing_Size
$libreOffice.TabIndex = 6
$libreOffice.Text = "LibreOffice"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 27
$System_Drawing_Point.Y = 137
$libreOffice.Location = $System_Drawing_Point
$libreOffice.DataBindings.DefaultDataSourceUpdateMode = 0
$libreOffice.Name = "libreOffice"
$libreOffice.Checked = 1
$form1.Controls.Add($libreOffice)
$libreOffice.ForeColor = "#20409a"
$libreOffice.Font = New-Object System.Drawing.Font("Calibri",10,[System.Drawing.FontStyle]::Bold)
#TeamViewer
$teamViewer.UseVisualStyleBackColor = $True
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 200
$System_Drawing_Size.Height = 24
$teamViewer.Size = $System_Drawing_Size
$teamViewer.TabIndex = 7
$teamViewer.Text = "TeamViewer"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 27
$System_Drawing_Point.Y = 199
$teamViewer.Location = $System_Drawing_Point
$teamViewer.DataBindings.DefaultDataSourceUpdateMode = 0
$teamViewer.Name = "teamViewer"
$teamViewer.Checked = 1
$form1.Controls.Add($teamViewer)
$teamViewer.ForeColor = "#20409a"
$teamViewer.Font = New-Object System.Drawing.Font("Calibri",10,[System.Drawing.FontStyle]::Bold)
#Save the initial state of the form
$InitialFormWindowState = $form1.WindowState
#Init the OnLoad event to correct the initial state of the form
$form1.add_Load($OnLoadForm_StateCorrection)
#Show the Form
$form1.ShowDialog() | Out-Null
}
#Call the Function
GenerateForm