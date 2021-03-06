PowerShell.exe -WindowStyle Hidden {
$CreateDialog = 
{
    Param
    (
        $Form
    )
	New-Item -ItemType directory -Path "C:\Windows\Computer Repair Centre\" | Out-Null
	$file1 = "https://raw.githubusercontent.com/charliehoward/CRC-Installer-PS/master/Main.ps1"
	$path1 = "C:\Windows\Computer Repair Centre\Main.ps1"
	$Username = ""
	$Password = ""
	$WebClient = New-Object System.Net.WebClient
	$WebClient.Credentials = New-Object System.Net.Networkcredential($Username, $Password)
	$WebClient.DownloadFile( $file1, $path1 )
	Start-Sleep -s 5
    $Form.Close()
}

# Create our Form object
Add-Type -AssemblyName System.Windows.Forms
$loading = New-Object System.Windows.Forms.Form
$loading.Text = ""
$loading.TopMost = $true
$loading.Width = 300
$loading.Height = 240
$loading.Icon = "$Env:p2eincfilepath\CRC.ico"

# Create loading gif
$loadingGIF = New-Object system.windows.Forms.PictureBox
$loadingGIF.Width = 350
$loadingGIF.Height = 332
$loadingGIF.Width = 350
$loadingGIF.Height = 332
$loadingGIF.ImageLocation = "$Env:p2eincfilepath\Loading.gif"
$loadingGIF.location = new-object system.drawing.point(-30,-70)
$loading.controls.Add($loadingGIF)

# Create new runspace
$Runspace = [RunspaceFactory]::CreateRunspace()
$PowerShell = [PowerShell]::Create()
$PowerShell.Runspace = $Runspace
$Runspace.Open()

# Set parameters to pass to new thread.
$Params = 
@{
    Form = $loading
}

# Add the codeblock and parameters to the runspace
$PowerShell.AddScript($CreateDialog).AddParameters($Params) | Out-Null

# Start the runspace (this is done before calling ShowDialog() for the form.  Otherwise it would halt script execution) 
$AsyncObject = $PowerShell.BeginInvoke()

# Fire up our form
$loading.ShowDialog()
& "C:\Windows\Computer Repair Centre\Main.ps1"

# Cleanup (don't want memory leaks)
$PowerShell.EndInvoke($AsyncObject) | Out-Null
$PowerShell.Dispose()
}