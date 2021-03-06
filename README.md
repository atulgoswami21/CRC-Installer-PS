# CRC Installer PowerShell 1.11.4

When run you will get a form that allows to select what programs you wish to install.

Can install the CRC OEM information, 7-zip, Apache OpenOffice, Google Chrome, Kaspersky Internet Security 2017, LibreOffice, Microsoft DotNet 4.5, Microsoft DotNet 4.6.1, Mozilla Firefox, PowerShell 5, TeamViewer, VLC Media Player, and WPS Office.

If run on Windows 8 and 8.1 it also changes the default Explorer page to "This PC".

If run on Windows 10 it also disables Windows 10 hibernation mode, Wi-Fi sense, and changes the default Explorer page to "This PC".

Will check for previous installation of Windows and then copy over the old Users folder to the Desktop.

# Update 1.11.4

No longer installs LibreOffice by defualt and added the new Mozilla Firefox Quantum.

# Update 1.11.3

Removed the moving of Windows.Old folders due to permissions issue.

# Update 1.11.2

Added sleep after moving previous "Users" folder.

# Update 1.11.1

Fixed previous "Users" folder not being renamed.

# Update 1.11.0

Installer will check if the programs have installed successfully and notify you of any failures.

# Update 1.10.1

Now checks for up to 5 previous Windows installations instead of 1.

# Update 1.10.0

Checks for previous Windows installation and then moves old documents to the desktop if it finds any.

# Update 1.9.1

Installer now tells you local info in text box.

# Update 1.9.0

Added Apache OpenOffice and WPS Office as install options.

# Update 1.8.7

Fixed an issue where it should be checking IP instead of SSID.

# Update 1.8.6

Replaced SSID check with public IP check so it now works on towers as well as laptops and rearranged installation process.

# Update 1.8.5

Moved location check to run immediately after "Install" is pressed.

# Update 1.8.4

Added form that lets you select your location if it can't find it.

# Update 1.8.3

Added feature to find IP and then install the correct OEM information if Wi-Fi is nto available.

# Update 1.8.2

Fixed crashing issue with Wi-Fi searching.

# Update 1.8.1

Improved taskbar pinning on Windows 7, 8, and 8.1. Reintroduced taskbar pinning for Windows 10.

# Update 1.8.0

Added feature that auto detects current Wi-Fi network, eliminating the need for multiple installers.

# Update 1.7.5

Removed commands that disable some telememtary and Cortana.

# Update 1.7.4

Fixed incorrect wording when installing Mozilla Firefox.

# Update 1.7.3

Fixed command prompt not going invisible on Romsey installer and changed wording for installation.

# Update 1.7.2

Changed directory for icon file.

# Update 1.7.1

Updated exe to include icon and loading animation.

# Update 1.7.0

Added loading form so you know the program is loading.

# Update 1.6.0

Made command line invisible for sleaker look.

# Update 1.5.6

Fixed crashing issue on Windows 7.

# Update 1.5.5

Fixed problem with Kaspersky and TeamViewer not installing.

# Update 1.5.4

Fixed crashing problem.

# Update 1.5.3

Fixed issue with Documents folder.

# Update 1.5.2

Fixed file cleanup on completion.

# Update 1.5.1

Removed extra lines for downloading files.

# Update 1.5.0

Temporarily removed automatically setting taskbar icons in Windows 10 due to issue and added KIS Chocolatey package.

# Update 1.4.1

Fixed OEM website HTTPS information.

# Update 1.4.0

Added autoscrolling feature to list box and reduced size of install window.

# Update 1.3.0

Renamed to CRC Installer and added new Romsey version.

# Update 1.2.1

Fixed issue with Google Chrome checksums.

# Update 1.2.0

Replaced text with icon of program for cleaner look.

# Update 1.1.3

Fixed crashing issue with icon file.

# Update 1.1.2

Removed exit button and will now close 15 seconds after the install has finished.

# Update 1.1.1

Fixed issue with downloading CleanCF.ps1.

# Update 1.1.0

Programs now install in alphabetical order and added an exit button than cleans up temporary files.
