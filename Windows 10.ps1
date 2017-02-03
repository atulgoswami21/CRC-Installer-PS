	if ($OS -like '*10.0*')     {
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
		If (!(Test-Path HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting)) {
			New-Item -Path HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting -Force | Out-Null
			}
		Set-ItemProperty -Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" -Name "Value" -Type DWord -Value 0
		Set-ItemProperty -Path "HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" -Name "Value" -Type DWord -Value 0
		$listBox1.Items.Add("Disabling Bing Search in Start Menu ...")
		Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "BingSearchEnabled" -Type DWord -Value 0
		$listBox1.Items.Add("Disabling Start Menu suggestions ...")
		Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SystemPaneSuggestionsEnabled" -Type DWord -Value 0
		$listBox1.Items.Add("Disabling Advertising ID ...")
		If (!(Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo")) {
			New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" | Out-Null
			}
		Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name "Enabled" -Type DWord -Value 0
		$listBox1.Items.Add("Disabling Cortana ...")
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
		$listBox1.Items.Add("Stopping and disabling Diagnostics Tracking Service ...")
		Stop-Service "DiagTrack"
		Set-Service "DiagTrack" -StartupType Disabled
		$listBox1.Items.Add("Setting taskbar icons ...")
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name Favorites -value ff
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name FavoritesChanges -value 00000010
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name FavoritesVersion -value 00000002
		Set-ItemProperty -path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband -name FavoritesRemovedChanges -value 00000001
		& "C:\Windows\BRM Computers\SetTaskbar.bat")
		$listBox1.Items.Add("The install has finished!"
		}