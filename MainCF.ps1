iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
$Username = ""
$Password = ""
$url2 = "https://raw.githubusercontent.com/TheJumpyWizard/BRM-Installer-PS/master/SetTaskbar.vbs"
$path2 = "C:\Windows\BRM Computers\SetTaskbar.vbs"
$url3 = "https://raw.githubusercontent.com/TheJumpyWizard/BRM-Installer-PS/master/SetTaskbar.exe"
$path3 = "C:\Windows\BRM Computers\SetTaskbar.exe"
$url4 = "https://raw.githubusercontent.com/TheJumpyWizard/BRM-Installer-PS/master/OEM.bmp"
$path4 = "C:\Windows\BRM Computers\OEM.bmp"
$url5 = "https://raw.githubusercontent.com/TheJumpyWizard/BRM-Installer-PS/master/OEM.ico"
$path5 = "C:\Windows\BRM Computers\OEM.ico"
$url6 = "https://raw.githubusercontent.com/TheJumpyWizard/BRM-Installer-PS/master/SetTaskbar.bat"
$path6 = "C:\Windows\BRM Computers\SetTaskbar.bat"
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
$button1 = New-Object System.Windows.Forms.Button
$listBox1 = New-Object System.Windows.Forms.ListBox
$checkBox1 = New-Object System.Windows.Forms.CheckBox
$checkBox2 = New-Object System.Windows.Forms.CheckBox
$checkBox3 = New-Object System.Windows.Forms.CheckBox
$checkBox4 = New-Object System.Windows.Forms.CheckBox
$checkBox5 = New-Object System.Windows.Forms.CheckBox
$checkBox6 = New-Object System.Windows.Forms.CheckBox
$checkBox7 = New-Object System.Windows.Forms.CheckBox
$checkBox8 = New-Object System.Windows.Forms.CheckBox
$InitialFormWindowState = New-Object System.Windows.Forms.FormWindowState
$b1= $false
$b2= $false
$b3= $false
#----------------------------------------------
#Generated Event Script Blocks
#----------------------------------------------
$handler_button1_Click= 
{
	$env:ComputerName | Out-File "C:/Windows/BRM Computers/$log.log" -Append
	$date | Out-File "C:/Windows/BRM Computers/$log.log" -Append
	$OS | Out-File "C:/Windows/BRM Computers/$log.log" -Append
    $listBox1.Items.Clear();    
    if ($checkBox1.Checked)     {  $listBox1.Items.Add( "BRM OEM is checked."  ) }
    if ($checkBox2.Checked)    {  $listBox1.Items.Add( "Mozilla Firefox is checked."  ) }
    if ($checkBox3.Checked)    {  $listBox1.Items.Add( "Google Chrome is checked."  ) }
	if ($checkBox4.Checked)    {  $listBox1.Items.Add( "Kaspersky Internet Security 2017 is checked."  ) }
	if ($checkBox5.Checked)    {  $listBox1.Items.Add( "VLC Media Player is checked."  ) }
	if ($checkBox6.Checked)    {  $listBox1.Items.Add( "7zip is checked."  ) }
	if ($checkBox7.Checked)    {  $listBox1.Items.Add( "LibreOffice is checked."  ) }
	if ($checkBox8.Checked)    {  $listBox1.Items.Add( "TeamViewer is checked."  ) }
    if ( !$checkBox1.Checked -and !$checkBox2.Checked -and !$checkBox3.Checked ) {   $listBox1.Items.Add("No programs are selected, please select some programs to install.")} 
	New-FormLog -Message "Installing .NET4.5 ..."
	choco install dotnet4.5 -y | Out-File "C:/Windows/BRM Computers/$log.log" -Append
	New-FormLog -Message "Finished installing .NET4.5 ..."
	if ($checkBox1.Checked)     {
	    New-FormLog -Message "Installing BRM OEM information ..."
		Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name Logo -value "C:\Windows\BRM Computers\OEM.bmp"
		Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name Manufacturer -value "BRM Computers"
		Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name SupportHours -value "Mon-Fri 9am-5pm - Sat 9am-4pm"
		Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name SupportPhone -value "08712 244129"
		Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name SupportURL -value "http://www.brmcomputers.co.uk"
		New-FormLog -Message "Finished installing BRM OEM information."
		}
	if ($checkBox2.Checked)     {
		New-FormLog -Message "Installing Mozilla Firefox ..."
		choco install firefox -y | Out-File "C:/Windows/BRM Computers/$log.log" -Append
		New-FormLog -Message "Finished installing Firefox."  
		}
	if ($checkBox3.Checked)     {
		New-FormLog -Message "Starting installing Google Chrome ..."
		choco install googlechrome -y | Out-File "C:/Windows/BRM Computers/$log.log" -Append
		New-FormLog -Message "Finished installing Google Chrome."
		}
	if ($checkBox4.Checked)     {
		New-FormLog -Message "Starting installing Kaspersky Internet Security 2017 ..."
		choco install kis -y | Out-File "C:/Windows/BRM Computers/$log.log" -Append
		New-FormLog -Message "Finished installing Kaspersky Internet Security 2017."
		}
	if ($checkBox5.Checked)     {
		New-FormLog -Message "Starting installing VLC Media Player ..."
		choco install kis -y | Out-File "C:/Windows/BRM Computers/$log.log" -Append
		New-FormLog -Message "Finished installing VLC Media Player."
		}
	if ($checkBox6.Checked)     {
		New-FormLog -Message "Starting installing 7zip ..."
		choco install kis -y | Out-File "C:/Windows/BRM Computers/$log.log" -Append
		New-FormLog -Message "Finished installing 7zip."
		}
	if ($checkBox7.Checked)     {
		New-FormLog -Message "Starting installing LibreOffice ..."
		choco install kis -y | Out-File "C:/Windows/BRM Computers/$log.log" -Append
		New-FormLog -Message "Finished installing LibreOffice."
		}
	if ($checkBox8.Checked)     {
		New-FormLog -Message "Starting installing TeamViewer ..."
		choco install kis -y | Out-File "C:/Windows/BRM Computers/$log.log" -Append
		New-FormLog -Message "Finished installing TeamViewer."
		}
	if ($OS -like '*6.1*')     {
		New-FormLog -Message "This computer is running Windows 7."
		& "C:\Windows\BRM Computers\SetTaskbar.vbs"
		New-FormLog -Message "The install has finished!"
		}
	if ($OS -like '*6.2*')     {
		New-FormLog -Message "This computer is running Windows 8."
		New-FormLog -Message "Setting taskbar icons ..."
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name Favorites -value ff
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name FavoritesChanges -value 00000010
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name FavoritesVersion -value 00000002
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name FavoritesRemovedChanges -value 00000001
		& "C:\Windows\BRM Computers\SetTaskbar.bat"
		New-FormLog -Message "The install has finished!"
		}
	if ($OS -like '*6.3*')     {
		New-FormLog -Message "This computer is running Windows 8.1."
		New-FormLog -Message "Setting taskbar icons ..."
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name Favorites -value ff
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name FavoritesChanges -value 00000010
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name FavoritesVersion -value 00000002
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name FavoritesRemovedChanges -value 00000001
		& "C:\Windows\BRM Computers\SetTaskbar.bat"
		New-FormLog -Message "The install has finished!"
		}
	if ($OS -like '*10.0*')     {
		New-FormLog -Message "This computer is running Windows 10."
		New-FormLog -Message "Setting explorer to open to This PC ..."
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -name LaunchTo -value 1
		New-FormLog -Message "Disabling hibernation mode ..."
		Set-ItemProperty -path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power" -name HiberbootEnabled -value 0
		New-FormLog -Message "Disabling Telemetry ..."
		Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection -Name AllowTelemetry -Type DWord -Value 0
		Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection -Name AllowTelemetry -Type DWord -Value 0
		Set-ItemProperty -Path HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection -Name AllowTelemetry -Type DWord -Value 0
		New-FormLog -Message "Disabling Wi-Fi Sense ..."
		If (!(Test-Path HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting)) {
			New-Item -Path HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting -Force | Out-Null
			}
		Set-ItemProperty -Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" -Name "Value" -Type DWord -Value 0
		Set-ItemProperty -Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" -Name "Value" -Type DWord -Value 0
		New-FormLog -Message "Disabling Bing Search in Start Menu ..."
		Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "BingSearchEnabled" -Type DWord -Value 0
		New-FormLog -Message "Disabling Start Menu suggestions ..."
		Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SystemPaneSuggestionsEnabled" -Type DWord -Value 0
		New-FormLog -Message "Disabling Advertising ID ..."
		If (!(Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo")) {
			New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" | Out-Null
			}
		Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name "Enabled" -Type DWord -Value 0
		New-FormLog -Message "Disabling Cortana ..."
		If (!(Test-Path "HKCU:\Software\Microsoft\Personalization\Settings")) {
			New-Item -Path "HKCU:\Software\Microsoft\Personalization\Settings" -Force | Out-Null
			}
		Set-ItemProperty -Path "HKCU:\Software\Microsoft\Personalization\Settings" -Name "AcceptedPrivacyPolicy" -Type DWord -Value 0
		If (!(Test-Path "HKCU:\Software\Microsoft\InputPersonalization")) {
			New-Item -Path "HKCU:\Software\Microsoft\InputPersonalization" -Force | Out-Null
			}
		Set-ItemProperty -Path "HKCU:\Software\Microsoft\InputPersonalization" -Name "RestrictImplicitTextCollection" -Type DWord -Value 1
		Set-ItemProperty -Path "HKCU:\Software\Microsoft\InputPersonalization" -Name "RestrictImplicitInkCollection" -Type DWord -Value 1
		If (!(Test-Path "HKCU:\Software\Microsoft\InputPersonalization\TrainedDataStore")) {
			New-Item -Path "HKCU:\Software\Microsoft\InputPersonalization\TrainedDataStore" -Force | Out-Null
			}
		Set-ItemProperty -Path "HKCU:\Software\Microsoft\InputPersonalization\TrainedDataStore" -Name "HarvestContacts" -Type DWord -Value 0
		New-FormLog -Message "Stopping and disabling Diagnostics Tracking Service ..."
		Stop-Service "DiagTrack"
		Set-Service "DiagTrack" -StartupType Disabled
		New-FormLog -Message "Setting taskbar icons ..."
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name Favorites -value ff
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name FavoritesChanges -value 00000010
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name FavoritesVersion -value 00000002
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name FavoritesRemovedChanges -value 00000001
		& "C:\Windows\BRM Computers\SetTaskbar.bat"
		New-FormLog -Message "The install has finished!"
		}
}
$OnLoadForm_StateCorrection=
{#Correct the initial state of the form to prevent the .Net maximized form issue
    $form1.WindowState = $InitialFormWindowState
}
$form1.Text = "BRM Installer PS Chandlers Ford v1.0.0"
$form1.Name = "form1"
$form1.DataBindings.DefaultDataSourceUpdateMode = 0
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 650
$System_Drawing_Size.Height = 550
$form1.ClientSize = $System_Drawing_Size
$form1.Icon = "C:\Windows\BRM Computers\OEM.ico"
#Install button
$button1.TabIndex = 4
$button1.Name = "button1"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 75
$System_Drawing_Size.Height = 23
$button1.Size = $System_Drawing_Size
$button1.UseVisualStyleBackColor = $True
$button1.Text = "Install"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 27
$System_Drawing_Point.Y = 510
$button1.Location = $System_Drawing_Point
$button1.DataBindings.DefaultDataSourceUpdateMode = 0
$button1.add_Click($handler_button1_Click)
$form1.Controls.Add($button1)
#Text box
$listBox1.FormattingEnabled = $True
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 350
$System_Drawing_Size.Height = 530
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
$checkBox1.UseVisualStyleBackColor = $True
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 200
$System_Drawing_Size.Height = 24
$checkBox1.Size = $System_Drawing_Size
$checkBox1.TabIndex = 0
$checkBox1.Text = "BRM OEM"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 27
$System_Drawing_Point.Y = 13
$checkBox1.Location = $System_Drawing_Point
$checkBox1.DataBindings.DefaultDataSourceUpdateMode = 0
$checkBox1.Name = "checkBox1"
$checkBox1.Checked = 1
$form1.Controls.Add($checkBox1)
$checkBox1.ForeColor = "#20409a"
$checkBox1.Font = New-Object System.Drawing.Font("Calibri",10,[System.Drawing.FontStyle]::Bold)
#Mozilla Firefox
$checkBox2.UseVisualStyleBackColor = $True
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 200
$System_Drawing_Size.Height = 24
$checkBox2.Size = $System_Drawing_Size
$checkBox2.TabIndex = 1
$checkBox2.Text = "Mozilla Firefox"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 27
$System_Drawing_Point.Y = 44
$checkBox2.Location = $System_Drawing_Point
$checkBox2.DataBindings.DefaultDataSourceUpdateMode = 0
$checkBox2.Name = "checkBox2"
$checkBox2.Checked = 1
$form1.Controls.Add($checkBox2)
$checkBox2.ForeColor = "#20409a"
$checkBox2.Font = New-Object System.Drawing.Font("Calibri",10,[System.Drawing.FontStyle]::Bold)
#Google Chrome
$checkBox3.UseVisualStyleBackColor = $True
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 200
$System_Drawing_Size.Height = 24
$checkBox3.Size = $System_Drawing_Size
$checkBox3.TabIndex = 2
$checkBox3.Text = "Google Chrome"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 27
$System_Drawing_Point.Y = 75
$checkBox3.Location = $System_Drawing_Point
$checkBox3.DataBindings.DefaultDataSourceUpdateMode = 0
$checkBox3.Name = "checkBox3"
$checkBox3.Checked = 1
$form1.Controls.Add($checkBox3)
$checkBox3.ForeColor = "#20409a"
$checkBox3.Font = New-Object System.Drawing.Font("Calibri",10,[System.Drawing.FontStyle]::Bold)
#Kaspersky Internet Security 2017
$checkBox4.UseVisualStyleBackColor = $True
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 250
$System_Drawing_Size.Height = 24
$checkBox4.Size = $System_Drawing_Size
$checkBox4.TabIndex = 3
$checkBox4.Text = "Kaspersky Internet Security 2017"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 27
$System_Drawing_Point.Y = 106
$checkBox4.Location = $System_Drawing_Point
$checkBox4.DataBindings.DefaultDataSourceUpdateMode = 0
$checkBox4.Name = "checkBox4"
$checkBox4.Checked = 1
$form1.Controls.Add($checkBox4)
$checkBox4.ForeColor = "#20409a"
$checkBox4.Font = New-Object System.Drawing.Font("Calibri",10,[System.Drawing.FontStyle]::Bold)
#VLC Media Player
$checkBox5.UseVisualStyleBackColor = $True
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 200
$System_Drawing_Size.Height = 24
$checkBox5.Size = $System_Drawing_Size
$checkBox5.TabIndex = 4
$checkBox5.Text = "VLC Media Player"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 27
$System_Drawing_Point.Y = 137
$checkBox5.Location = $System_Drawing_Point
$checkBox5.DataBindings.DefaultDataSourceUpdateMode = 0
$checkBox5.Name = "checkBox5"
$checkBox5.Checked = 1
$form1.Controls.Add($checkBox5)
$checkBox5.ForeColor = "#20409a"
$checkBox5.Font = New-Object System.Drawing.Font("Calibri",10,[System.Drawing.FontStyle]::Bold)
#7zip
$checkBox6.UseVisualStyleBackColor = $True
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 200
$System_Drawing_Size.Height = 24
$checkBox6.Size = $System_Drawing_Size
$checkBox6.TabIndex = 5
$checkBox6.Text = "7zip"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 27
$System_Drawing_Point.Y = 168
$checkBox6.Location = $System_Drawing_Point
$checkBox6.DataBindings.DefaultDataSourceUpdateMode = 0
$checkBox6.Name = "checkBox6"
$checkBox6.Checked = 1
$form1.Controls.Add($checkBox6)
$checkBox6.ForeColor = "#20409a"
$checkBox6.Font = New-Object System.Drawing.Font("Calibri",10,[System.Drawing.FontStyle]::Bold)
#LibreOffice
$checkBox7.UseVisualStyleBackColor = $True
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 200
$System_Drawing_Size.Height = 24
$checkBox7.Size = $System_Drawing_Size
$checkBox7.TabIndex = 6
$checkBox7.Text = "LibreOffice"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 27
$System_Drawing_Point.Y = 199
$checkBox7.Location = $System_Drawing_Point
$checkBox7.DataBindings.DefaultDataSourceUpdateMode = 0
$checkBox7.Name = "checkBox7"
$checkBox7.Checked = 1
$form1.Controls.Add($checkBox7)
$checkBox7.ForeColor = "#20409a"
$checkBox7.Font = New-Object System.Drawing.Font("Calibri",10,[System.Drawing.FontStyle]::Bold)
#TeamViewer
$checkBox8.UseVisualStyleBackColor = $True
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Width = 200
$System_Drawing_Size.Height = 24
$checkBox8.Size = $System_Drawing_Size
$checkBox8.TabIndex = 7
$checkBox8.Text = "TeamViewer"
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 27
$System_Drawing_Point.Y = 230
$checkBox8.Location = $System_Drawing_Point
$checkBox8.DataBindings.DefaultDataSourceUpdateMode = 0
$checkBox8.Name = "checkBox8"
$checkBox8.Checked = 1
$form1.Controls.Add($checkBox8)
$checkBox8.ForeColor = "#20409a"
$checkBox8.Font = New-Object System.Drawing.Font("Calibri",10,[System.Drawing.FontStyle]::Bold)
#Save the initial state of the form
$InitialFormWindowState = $form1.WindowState
#Init the OnLoad event to correct the initial state of the form
$form1.add_Load($OnLoadForm_StateCorrection)
#Show the Form
$form1.ShowDialog() | Out-Null
}
function New-FormLog
{
Param(
    [string]$Message
)

    $listbox1.Items.Add($Message)
}
#Call the Function
GenerateForm