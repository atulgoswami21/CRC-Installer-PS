#Download all assets
$Username = ""
$Password = ""
$file2 = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/Assets/SysPin.exe"
$path2 = "C:\Windows\Computer Repair Centre\SysPin.exe"
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
$file11 = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/Assets/ApacheOpenOffice.ico"
$path11 = "C:\Windows\Computer Repair Centre\ApacheOpenOffice.ico"
$file12 = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/Assets/WPSOffice.ico"
$path12 = "C:\Windows\Computer Repair Centre\WPSOffice.ico"
$file13 = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/Assets/Birthday.gif"
$path13 = "C:\Windows\Computer Repair Centre\Birthday.gif"
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
$WebClient.DownloadFile($file11, $path11)
$WebClient.DownloadFile($file12, $path12)
$WebClient.DownloadFile($file13, $path13)

#Get OS version
$OS = (Get-WmiObject -Class Win32_OperatingSystem).version

#Generating log file
$date = Get-Date -Format "yyyy.MM.dd HH.mm"
$log = $date + " " + $env:ComputerName
$log

#Find external IP
$IP = Invoke-RestMethod http://ipinfo.io/json | Select -exp ip

#Detect old Windows installation
$WindowsOld = Test-Path C:\Windows.old\Users
$WindowsOld000 = Test-Path C:\Windows.old.000\Users
$WindowsOld001 = Test-Path C:\Windows.old.001\Users
$WindowsOld002 = Test-Path C:\Windows.old.002\Users
$WindowsOld003 = Test-Path C:\Windows.old.003\Users

#Get current username
$User = $env:UserName

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
	$ApacheOpenOffice = New-Object System.Windows.Forms.CheckBox
	$wpsOffice = New-Object System.Windows.Forms.CheckBox
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
		$IP | Out-File "C:/Windows/Computer Repair Centre/$log.log" -Append
	    $progress.Items.Clear();    
		$progress.Items.Add("The date is $date."  )
		$progress.SelectedIndex = $progress.Items.Count - 1;
		$progress.SelectedIndex = -1;
		$progress.Items.Add("The external IP is $IP."  )
		$progress.SelectedIndex = $progress.Items.Count - 1;
		$progress.SelectedIndex = -1;	
		if ($date -like '*.04.21*') {
			$CreateDialog = 
			{
			    Param
			    (
			        $Form
			    )
				Start-Sleep -s 20
			    $Form.Close()
			}
			# Create our Form object
			Add-Type -AssemblyName System.Windows.Forms
			$birthday = New-Object System.Windows.Forms.Form
			$birthday.Text = ""
			$birthday.TopMost = $true
			$birthday.Width = 450
			$birthday.Height = 240
			$birthday.Icon = "$Env:p2eincfilepath\CRC.ico"
			# Create birthday gif
			$birthdayGIF = New-Object system.windows.Forms.PictureBox
			$birthdayGIF.Width = 480
			$birthdayGIF.Height = 332
			$birthdayGIF.ImageLocation = "C:\Windows\Computer Repair Centre\Birthday.gif"
			$birthdayGIF.location = new-object system.drawing.point(-30,-70)
			$birthday.controls.Add($birthdayGIF)
			# Create new runspace
			$Runspace = [RunspaceFactory]::CreateRunspace()
			$PowerShell = [PowerShell]::Create()
			$PowerShell.Runspace = $Runspace
			$Runspace.Open()
			# Set parameters to pass to new thread.
			$Params = 
			@{
			    Form = $birthday
			}
			# Add the codeblock and parameters to the runspace
			$PowerShell.AddScript($CreateDialog).AddParameters($Params) | Out-Null
			# Start the runspace (this is done before calling ShowDialog() for the form.  Otherwise it would halt script execution) 
			$AsyncObject = $PowerShell.BeginInvoke()
			# Fire up our form
			$birthday.ShowDialog()
			# Cleanup (don't want memory leaks)
			$PowerShell.EndInvoke($AsyncObject) | Out-Null
			$PowerShell.Dispose()
			}
		if ($date -like '*.04.06*') {
			$CreateDialog = 
			{
			    Param
			    (
			        $Form
			    )
				Start-Sleep -s 20
			    $Form.Close()
			}
			# Create our Form object
			Add-Type -AssemblyName System.Windows.Forms
			$birthday = New-Object System.Windows.Forms.Form
			$birthday.Text = ""
			$birthday.TopMost = $true
			$birthday.Width = 450
			$birthday.Height = 240
			$birthday.Icon = "$Env:p2eincfilepath\CRC.ico"
			# Create birthday gif
			$birthdayGIF = New-Object system.windows.Forms.PictureBox
			$birthdayGIF.Width = 480
			$birthdayGIF.Height = 332
			$birthdayGIF.ImageLocation = "C:\Windows\Computer Repair Centre\Birthday.gif"
			$birthdayGIF.location = new-object system.drawing.point(-30,-70)
			$birthday.controls.Add($birthdayGIF)
			# Create new runspace
			$Runspace = [RunspaceFactory]::CreateRunspace()
			$PowerShell = [PowerShell]::Create()
			$PowerShell.Runspace = $Runspace
			$Runspace.Open()
			# Set parameters to pass to new thread.
			$Params = 
			@{
			    Form = $birthday
			}
			# Add the codeblock and parameters to the runspace
			$PowerShell.AddScript($CreateDialog).AddParameters($Params) | Out-Null
			# Start the runspace (this is done before calling ShowDialog() for the form.  Otherwise it would halt script execution) 
			$AsyncObject = $PowerShell.BeginInvoke()
			# Fire up our form
			$birthday.ShowDialog()
			# Cleanup (don't want memory leaks)
			$PowerShell.EndInvoke($AsyncObject) | Out-Null
			$PowerShell.Dispose()
			}
		if ($date -like '*.06.09*') {
			$CreateDialog = 
			{
			    Param
			    (
			        $Form
			    )
				Start-Sleep -s 20
			    $Form.Close()
			}
			# Create our Form object
			Add-Type -AssemblyName System.Windows.Forms
			$birthday = New-Object System.Windows.Forms.Form
			$birthday.Text = ""
			$birthday.TopMost = $true
			$birthday.Width = 450
			$birthday.Height = 240
			$birthday.Icon = "$Env:p2eincfilepath\CRC.ico"
			# Create birthday gif
			$birthdayGIF = New-Object system.windows.Forms.PictureBox
			$birthdayGIF.Width = 480
			$birthdayGIF.Height = 332
			$birthdayGIF.ImageLocation = "C:\Windows\Computer Repair Centre\Birthday.gif"
			$birthdayGIF.location = new-object system.drawing.point(-30,-70)
			$birthday.controls.Add($birthdayGIF)
			# Create new runspace
			$Runspace = [RunspaceFactory]::CreateRunspace()
			$PowerShell = [PowerShell]::Create()
			$PowerShell.Runspace = $Runspace
			$Runspace.Open()
			# Set parameters to pass to new thread.
			$Params = 
			@{
			    Form = $birthday
			}
			# Add the codeblock and parameters to the runspace
			$PowerShell.AddScript($CreateDialog).AddParameters($Params) | Out-Null
			# Start the runspace (this is done before calling ShowDialog() for the form.  Otherwise it would halt script execution) 
			$AsyncObject = $PowerShell.BeginInvoke()
			# Fire up our form
			$birthday.ShowDialog()
			# Cleanup (don't want memory leaks)
			$PowerShell.EndInvoke($AsyncObject) | Out-Null
			$PowerShell.Dispose()
			}
		if ($date -like '*.05.16*') {
			$CreateDialog = 
			{
			    Param
			    (
			        $Form
			    )
				Start-Sleep -s 20
			    $Form.Close()
			}
			# Create our Form object
			Add-Type -AssemblyName System.Windows.Forms
			$birthday = New-Object System.Windows.Forms.Form
			$birthday.Text = ""
			$birthday.TopMost = $true
			$birthday.Width = 450
			$birthday.Height = 240
			$birthday.Icon = "$Env:p2eincfilepath\CRC.ico"
			# Create birthday gif
			$birthdayGIF = New-Object system.windows.Forms.PictureBox
			$birthdayGIF.Width = 480
			$birthdayGIF.Height = 332
			$birthdayGIF.ImageLocation = "C:\Windows\Computer Repair Centre\Birthday.gif"
			$birthdayGIF.location = new-object system.drawing.point(-30,-70)
			$birthday.controls.Add($birthdayGIF)
			# Create new runspace
			$Runspace = [RunspaceFactory]::CreateRunspace()
			$PowerShell = [PowerShell]::Create()
			$PowerShell.Runspace = $Runspace
			$Runspace.Open()
			# Set parameters to pass to new thread.
			$Params = 
			@{
			    Form = $birthday
			}
			# Add the codeblock and parameters to the runspace
			$PowerShell.AddScript($CreateDialog).AddParameters($Params) | Out-Null
			# Start the runspace (this is done before calling ShowDialog() for the form.  Otherwise it would halt script execution) 
			$AsyncObject = $PowerShell.BeginInvoke()
			# Fire up our form
			$birthday.ShowDialog()
			# Cleanup (don't want memory leaks)
			$PowerShell.EndInvoke($AsyncObject) | Out-Null
			$PowerShell.Dispose()
			}
		if ($date -like '*.06.24*') {
			$CreateDialog = 
			{
			    Param
			    (
			        $Form
			    )
				Start-Sleep -s 20
			    $Form.Close()
			}
			# Create our Form object
			Add-Type -AssemblyName System.Windows.Forms
			$birthday = New-Object System.Windows.Forms.Form
			$birthday.Text = ""
			$birthday.TopMost = $true
			$birthday.Width = 450
			$birthday.Height = 240
			$birthday.Icon = "$Env:p2eincfilepath\CRC.ico"
			# Create birthday gif
			$birthdayGIF = New-Object system.windows.Forms.PictureBox
			$birthdayGIF.Width = 480
			$birthdayGIF.Height = 332
			$birthdayGIF.ImageLocation = "C:\Windows\Computer Repair Centre\Birthday.gif"
			$birthdayGIF.location = new-object system.drawing.point(-30,-70)
			$birthday.controls.Add($birthdayGIF)
			# Create new runspace
			$Runspace = [RunspaceFactory]::CreateRunspace()
			$PowerShell = [PowerShell]::Create()
			$PowerShell.Runspace = $Runspace
			$Runspace.Open()
			# Set parameters to pass to new thread.
			$Params = 
			@{
			    Form = $birthday
			}
			# Add the codeblock and parameters to the runspace
			$PowerShell.AddScript($CreateDialog).AddParameters($Params) | Out-Null
			# Start the runspace (this is done before calling ShowDialog() for the form.  Otherwise it would halt script execution) 
			$AsyncObject = $PowerShell.BeginInvoke()
			# Fire up our form
			$birthday.ShowDialog()
			# Cleanup (don't want memory leaks)
			$PowerShell.EndInvoke($AsyncObject) | Out-Null
			$PowerShell.Dispose()
			}
			if ($crc.Checked)	{
			$progress.Items.Add("CRC OEM is checked."  )
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
		    $progress.Items.Add("Starting installation of CRC OEM information ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			if ($IP -like '*212.159.116.68*') {
				$progress.Items.Add("Installer being run from Romsey.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name Logo -value "C:\Windows\Computer Repair Centre\CRC.bmp"
				Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name Manufacturer -value "Computer Repair Centre"
				Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name SupportHours -value "Mon-Fri 9:15am-5pm - Sat 9:15am-4pm"
				Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name SupportPhone -value "01794 517142"
				Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name SupportURL -value "https://www.firstforitrepairs.co.uk"
				}
			elseIf ($IP -like '*82.23.152.201*') {
				$progress.Items.Add("Installer being run from Chandlers Ford.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name Logo -value "C:\Windows\Computer Repair Centre\CRC.bmp"
				Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name Manufacturer -value "Computer Repair Centre"
				Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name SupportHours -value "Mon-Fri 9am-5pm - Sat 9am-4pm"
				Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name SupportPhone -value "08712 244129"
				Set-ItemProperty -path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation -name SupportURL -value "https://www.brmcomputers.co.uk"
				}
			$progress.Items.Add("Completed installation of CRC OEM information.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		$progress.Items.Add("Starting installation of Chocolately ...")
		$progress.SelectedIndex = $progress.Items.Count - 1;
		$progress.SelectedIndex = -1;
		iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
		$Programs = choco list --localonly
		if ($Programs -like '*chocolatey*') {
			$progress.Items.Add("Completed installation of Chocolatey.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		else {
			$progress.Items.Add("The installation of Chocolatey has failed.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		$progress.Items.Add("Starting installation of DotNet 4.5 ...")
		$progress.SelectedIndex = $progress.Items.Count - 1;
		$progress.SelectedIndex = -1;
		choco install dotnet4.5 -y | Out-File "C:/Windows/Computer Repair Centre/$log.log" -Append
		$Programs = choco list --localonly
		if ($Programs -like '*DotNet4.5*') {
			$progress.Items.Add("Completed installation of DotNet 4.5.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		else {
			$progress.Items.Add("The installation of DotNet 4.5 has failed.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		$progress.Items.Add("Starting installation of DotNet 4.6.1 ...")
		$progress.SelectedIndex = $progress.Items.Count - 1;
		$progress.SelectedIndex = -1;
		choco install dotnet4.6.1 -y | Out-File "C:/Windows/Computer Repair Centre/$log.log" -Append
		$Programs = choco list --localonly
		if ($Programs -like '*DotNet4.6.1*') {
			$progress.Items.Add("Completed installation of DotNet 4.6.1.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		else {
			$progress.Items.Add("The installation of DotNet 4.6.1 has failed.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		$progress.Items.Add("Starting installation of PowerShell 5 ...")
		$progress.SelectedIndex = $progress.Items.Count - 1;
		$progress.SelectedIndex = -1;
		choco install powershell -y | Out-File "C:/Windows/Computer Repair Centre/$log.log" -Append
		$Programs = choco list --localonly
		if ($Programs -like '*PowerShell 5*') {
			$progress.Items.Add("Completed installation of PowerShell 5.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		else {
			$progress.Items.Add("The installation of PowerShell 5 has failed.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		if ($apacheOpenOffice.Checked -and $libreOffice.Checked -and $wpsOffice.Checked) {
			$progress.Items.Add("You have selected multiple Office programs, please select only one. No Office programs will be installed."  )
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		if ($7zip.Checked)	{
			$progress.Items.Add("7-zip is checked."  )
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Starting installation of 7-zip ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			choco install 7zip.install -y --ignore-checksum | Out-File "C:/Windows/Computer Repair Centre/$log.log" -Append
			$Programs = choco list --localonly
			if ($Programs -like '*7zip*') {
				$progress.Items.Add("Completed installation of 7-zip.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				}
			else {
				$progress.Items.Add("The installation of 7-zip has failed.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				}
			}
		if ($apacheOpenOffice.Checked -and !$libreOffice.Checked -and !$wpsOffice.Checked)	{
			$progress.Items.Add("Apache OpenOffice is checked."  )
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Starting installation of Apache OpenOffice ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			choco install openoffice -y --ignore-checksum | Out-File "C:/Windows/Computer Repair Centre/$log.log" -Append
			$Programs = choco list --localonly
			if ($Programs -like '*OpenOffice*') {
				$progress.Items.Add("Completed installation of Apache OpenOffice.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				}
			else {
				$progress.Items.Add("The installation of Apache OpenOffice has failed.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				}
			}
	    if ($googleChrome.Checked)	{
			$progress.Items.Add("Google Chrome is checked."  )
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Starting installation of Google Chrome ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			choco install googlechrome -y --ignore-checksums | Out-File "C:/Windows/Computer Repair Centre/$log.log" -Append
			$Programs = choco list --localonly
			if ($Programs -like '*GoogleChrome*') {
				$progress.Items.Add("Completed installation of Google Chrome.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				}
			else {
				$progress.Items.Add("The installation of Google Chrome has failed.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				}
			}
		if ($kaspersky.Checked)	{
			$progress.Items.Add("Kaspersky Internet Security 2017 is checked."  )
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Starting installation of Kaspersky Internet Security 2017 ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			choco install kis -y --ignore-checksum | Out-File "C:/Windows/Computer Repair Centre/$log.log" -Append
			$Programs = choco list --localonly
			if ($Programs -like '*kis*') {
				$progress.Items.Add("Completed installation of Kaspersky Internet Security 2017.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				}
			else {
				$progress.Items.Add("The installation of Kaspersky Internet Security 2017 has failed.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				}
			}
		if ($libreOffice.Checked -and !$apacheOpenOffice.Checked -and !$wpsOffice.Checked)	{
			$progress.Items.Add("LibreOffice is checked."  )
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Starting installation of LibreOffice ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			choco install libreoffice -y --ignore-checksum | Out-File "C:/Windows/Computer Repair Centre/$log.log" -Append
			$Programs = choco list --localonly
			if ($Programs -like '*libreoffice*') {
				$progress.Items.Add("Completed installation of LibreOffice.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				}
			else {
				$progress.Items.Add("The installation of LibreOffice has failed.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				}
			}
	    if ($mozillaFirefox.Checked)	{
			$progress.Items.Add("Mozilla Firefox is checked."  )
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Starting installation of Mozilla Firefox ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			choco install firefox -y --ignore-checksum | Out-File "C:/Windows/Computer Repair Centre/$log.log" -Append
			$Programs = choco list --localonly
			if ($Programs -like '*Firefox*') {
				$progress.Items.Add("Completed installation of Mozilla Firefox.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				}
			else {
				$progress.Items.Add("The installation of Mozilla Firefox has failed.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				}
			}
		if ($teamViewer.Checked)	{
			$progress.Items.Add("TeamViewer is checked."  )
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Starting installation of TeamViewer ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			choco install teamviewer -y --ignore-checksum | Out-File "C:/Windows/Computer Repair Centre/$log.log" -Append
			$Programs = choco list --localonly
			if ($Programs -like '*teamviewer*') {
				$progress.Items.Add("Completed installation of TeamViewer.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				}
			else {
				$progress.Items.Add("The installation of TeamViewer has failed.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				}
			}
		if ($vlc.Checked)	{
			$progress.Items.Add("VLC Media Player is checked."  )
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Starting installation of VLC Media Player ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			choco install vlc -y --ignore-checksum | Out-File "C:/Windows/Computer Repair Centre/$log.log" -Append
			$Programs = choco list --localonly
			if ($Programs -like '*vlc*') {
				$progress.Items.Add("Completed installation of VLC Media Player.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				}
			else {
				$progress.Items.Add("The installation of VLC Media Player has failed.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				}
			}
		if ($wpsOffice.Checked -and !$apacheOpenOffice.Checked -and !$libreOffice.Checked)	{
			$progress.Items.Add("WPS Office is checked."  )
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Starting installation of WPS Office ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			choco install wps-office-free -y --ignore-checksum | Out-File "C:/Windows/Computer Repair Centre/$log.log" -Append
			$Programs = choco list --localonly
			if ($Programs -like '*wps-office-free*') {
				$progress.Items.Add("Completed installation of WPS Office.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				}
			else {
				$progress.Items.Add("The installation of WPS Office has failed.")
				$progress.SelectedIndex = $progress.Items.Count - 1;
				$progress.SelectedIndex = -1;
				}
			}
	    if (!$crc.Checked -and !$7zip.Checked -and !$apacheOpenOffice.Checked -and !$googleChrome.Checked -and !$kaspersky.Checked -and !$libreOffice.Checked -and !$mozillaFirefox.Checked -and !$teamViewer.Checked -and !$vlc.Checked -and !$wpsOffice.Checked){
			$progress.Items.Add("No programs are selected, please select some programs to install.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			}
		if ($WindowsOld -like '*True*') {
			$progress.Items.Add("Found preious Windows installation.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Moving old documents to the desktop.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			Move-Item "C:\Windows.old\Users\" "C:\Users\$User\Desktop\"
			Start-Sleep -s 10
			Rename-Item "C:\Users\$User\Desktop\Users" "C:\Users\$User\Desktop\Recovered Documents"
			}
		if ($WindowsOld000 -like '*True*') {
			$progress.Items.Add("Found previous Windows installation.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Moving old documents to the desktop.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			Move-Item "C:\Windows.old.000\Users\" "C:\Users\$User\Desktop\"
			Start-Sleep -s 10
			Rename-Item "C:\Users\$User\Desktop\Users" "C:\Users\$User\Desktop\Recovered Documents"
			}
		if ($WindowsOld001 -like '*True*') {
			$progress.Items.Add("Found previous Windows installation.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Moving old documents to the desktop.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			Move-Item "C:\Windows.old.001\Users\" "C:\Users\$User\Desktop\"
			Start-Sleep -s 10
			Rename-Item "C:\Users\$User\Desktop\Users" "C:\Users\$User\Desktop\Recovered Documents"
			}
		if ($WindowsOld002 -like '*True*') {
			$progress.Items.Add("Found previous Windows installation.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Moving old documents to the desktop.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			Move-Item "C:\Windows.old.002\Users\" "C:\Users\$User\Desktop\"
			Start-Sleep -s 10
			Rename-Item "C:\Users\$User\Desktop\Users" "C:\Users\$User\Desktop\Recovered Documents"
			}
		if ($WindowsOld003 -like '*True*') {
			$progress.Items.Add("Found previous Windows installation.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Moving old documents to the desktop.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			Move-Item "C:\Windows.old.003\Users\" "C:\Users\$User\Desktop\"
			Start-Sleep -s 10
			Rename-Item "C:\Users\$User\Desktop\Users" "C:\Users\$User\Desktop\Recovered Documents"
			}
		if ($OS -like '*6.1*')	{
			$progress.Items.Add("This computer is running Windows 7.")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			$progress.Items.Add("Setting taskbar icons ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband" -Name "Favorites"
			& "C:\Windows\Computer Repair Centre\SysPin.exe" "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" c:5386
			& "C:\Windows\Computer Repair Centre\SysPin.exe" "C:\Program Files\Mozilla Firefox\firefox.exe" c:5386
			& "C:\Windows\Computer Repair Centre\SysPin.exe" "C:\Windows\explorer.exe" c:5386
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
			Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband" -Name "Favorites"
			& "C:\Windows\Computer Repair Centre\SysPin.exe" "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" c:5386
			& "C:\Windows\Computer Repair Centre\SysPin.exe" "C:\Program Files\Mozilla Firefox\firefox.exe" c:5386
			& "C:\Windows\Computer Repair Centre\SysPin.exe" "C:\Windows\explorer.exe" c:5386
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
			Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband" -Name "Favorites"
			& "C:\Windows\Computer Repair Centre\SysPin.exe" "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" c:5386
			& "C:\Windows\Computer Repair Centre\SysPin.exe" "C:\Program Files\Mozilla Firefox\firefox.exe" c:5386
			& "C:\Windows\Computer Repair Centre\SysPin.exe" "C:\Windows\explorer.exe" c:5386
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
			$progress.Items.Add("Setting taskbar icons ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband" -Name "Favorites"
			& "C:\Windows\Computer Repair Centre\SysPin.exe" "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" c:5386
			& "C:\Windows\Computer Repair Centre\SysPin.exe" "C:\Program Files\Mozilla Firefox\firefox.exe" c:5386
			& "C:\Windows\Computer Repair Centre\SysPin.exe" "C:\Windows\explorer.exe" c:5386
			$progress.Items.Add("Disabling hibernation mode ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			Set-ItemProperty -path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power" -name HiberbootEnabled -value 0
			$progress.Items.Add("Disabling Wi-Fi Sense ...")
			$progress.SelectedIndex = $progress.Items.Count - 1;
			$progress.SelectedIndex = -1;
			New-Item -Path HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting -Force | Out-Null
			Set-ItemProperty -Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" -Name "Value" -Type DWord -Value 0
			Set-ItemProperty -Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" -Name "Value" -Type DWord -Value 0
			$progress.Items.Add("The install has finished! The installer will close in 15 seconds.")
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
	$installer.Text = "CRC Installer v1.11.2"
	$installer.Name = "form1"
	$installer.DataBindings.DefaultDataSourceUpdateMode = 0
	$System_Drawing_Size = New-Object System.Drawing.Size
	$System_Drawing_Size.Width = 650
	$System_Drawing_Size.Height = 330
	$installer.ClientSize = $System_Drawing_Size
	$installer.Icon = "$Env:p2eincfilepath\CRC.ico"
	
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
	$System_Drawing_Size.Height = 310
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
	$crc.Image = [System.Drawing.Image]::FromFile("$Env:p2eincfilepath\CRC.ico")
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
	$System_Drawing_Point.Y = 199
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
	$System_Drawing_Point.Y = 106
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
	$System_Drawing_Point.Y = 137
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
	$System_Drawing_Point.Y = 261
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
	$System_Drawing_Point.Y = 168
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
	$System_Drawing_Point.Y = 230
	$teamViewer.Location = $System_Drawing_Point
	$teamViewer.DataBindings.DefaultDataSourceUpdateMode = 0
	$teamViewer.Name = "teamViewer"
	$teamViewer.Checked = 1
	$teamViewer.Image = [System.Drawing.Image]::FromFile("C:\Windows\Computer Repair Centre\TeamViewer.ico")
	$installer.Controls.Add($teamViewer)
	
#Apache OpenOffice
	$apacheOpenOffice.UseVisualStyleBackColor = $True
	$System_Drawing_Size = New-Object System.Drawing.Size
	$System_Drawing_Size.Width = 36
	$System_Drawing_Size.Height = 24
	$apacheOpenOffice.Size = $System_Drawing_Size
	$apacheOpenOffice.TabIndex = 1
	$System_Drawing_Point = New-Object System.Drawing.Point
	$System_Drawing_Point.X = 27
	$System_Drawing_Point.Y = 75
	$apacheOpenOffice.Location = $System_Drawing_Point
	$apacheOpenOffice.DataBindings.DefaultDataSourceUpdateMode = 0
	$apacheOpenOffice.Name = "apacheOpenOffice"
	$apacheOpenOffice.Checked = 0
	$apacheOpenOffice.Image = [System.Drawing.Image]::FromFile("C:\Windows\Computer Repair Centre\ApacheOpenOffice.ico")
	$installer.Controls.Add($apacheOpenOffice)
	
#WPS Office
	$wpsOffice.UseVisualStyleBackColor = $True
	$System_Drawing_Size = New-Object System.Drawing.Size
	$System_Drawing_Size.Width = 36
	$System_Drawing_Size.Height = 24
	$wpsOffice.Size = $System_Drawing_Size
	$wpsOffice.TabIndex = 1
	$System_Drawing_Point = New-Object System.Drawing.Point
	$System_Drawing_Point.X = 27
	$System_Drawing_Point.Y = 292
	$wpsOffice.Location = $System_Drawing_Point
	$wpsOffice.DataBindings.DefaultDataSourceUpdateMode = 0
	$wpsOffice.Name = "wpsOffice"
	$wpsOffice.Checked = 0
	$wpsOffice.Image = [System.Drawing.Image]::FromFile("C:\Windows\Computer Repair Centre\WPSOffice.ico")
	$installer.Controls.Add($wpsOffice)
	
#Save the initial state of the form
	$InitialFormWindowState = $installer.WindowState
	$installer.add_Load($OnLoadForm_StateCorrection)
	
#Show the Form
	$installer.ShowDialog() | Out-Null
	}
	
#Call the Function
GenerateForm
