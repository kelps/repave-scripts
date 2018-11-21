#https://github.com/chocolatey/boxstarter
#https://boxstarter.org/Learn/WebLauncher

function Move-Libraries {
	if (Test-Path d:) {
		Write-BoxtarterMessage "Moving libraries to the 'D:' drive"

		if (!(Test-Path D:\Desktop)) {
			New-Item -ItemType Directory -Path D:\Desktop
		}
		Move-LibraryDirectory "Desktop" "D:\Desktop" 

		if (!(Test-Path D:\Downloads)) {
			New-Item -ItemType Directory -Path D:\Downloads
		}
		Move-LibraryDirectory "Downloads" "D:\Downloads" -DoNotMoveOldContent

		if (Test-Path D:\OneDrive\Images) {
			Move-LibraryDirectory "My Pictures" "D:\OneDrive\Imagens" -DoNotMoveOldContent
		}
		if (Test-Path D:\OneDrive\Music) {
			Move-LibraryDirectory "My Music" "D:\OneDrive\Music" -DoNotMoveOldContent
		}
	} else {
		Write-BoxtarterMessage "No D: drive available"
	}
}

function Apply-File-Explorer-Settings {
	Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowFileExtensions -DisableOpenFileExplorerToQuickAccess -DisableShowRecentFilesInQuickAccess -DisableShowFrequentFoldersInQuickAccess -EnableExpandToOpenFolder -EnableShowRibbon

	# will expand explorer to the actual folder you're in
	Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneExpandToCurrentFolder -Value 1

	#adds things back in your left pane like recycle bin
	Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneShowAllFolders -Value 1

	#opens PC to This PC, not quick access
	Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -Value 1

	#taskbar where window is open for multi-monitor
	Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name MMTaskbarMode -Value 2
}

function Install-IIS {
	#https://weblog.west-wind.com/posts/2017/May/25/Automating-IIS-Feature-Installation-with-Powershell

	Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole                           
	Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServer                               
	Enable-WindowsOptionalFeature -Online -FeatureName IIS-CommonHttpFeatures                      
	Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpErrors                              
	Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpRedirect                            
	Enable-WindowsOptionalFeature -Online -FeatureName IIS-ApplicationDevelopment                  
	Enable-WindowsOptionalFeature -Online -FeatureName IIS-NetFxExtensibility                      
	Enable-WindowsOptionalFeature -Online -FeatureName IIS-NetFxExtensibility45                    
	Enable-WindowsOptionalFeature -Online -FeatureName IIS-HealthAndDiagnostics                    
	Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpLogging                             
	Enable-WindowsOptionalFeature -Online -FeatureName IIS-LoggingLibraries                        
	Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpTracing                             
	Enable-WindowsOptionalFeature -Online -FeatureName IIS-Security                                
	Enable-WindowsOptionalFeature -Online -FeatureName IIS-URLAuthorization                        
	Enable-WindowsOptionalFeature -Online -FeatureName IIS-RequestFiltering                        
	Enable-WindowsOptionalFeature -Online -FeatureName IIS-IPSecurity                              
	Enable-WindowsOptionalFeature -Online -FeatureName IIS-Performance                             
	Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpCompressionDynamic                  
	Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerManagementTools                
	Enable-WindowsOptionalFeature -Online -FeatureName IIS-ManagementScriptingTools    
	Enable-WindowsOptionalFeature -Online -FeatureName IIS-StaticContent                           
	Enable-WindowsOptionalFeature -Online -FeatureName IIS-DefaultDocument                         
	Enable-WindowsOptionalFeature -Online -FeatureName IIS-DirectoryBrowsing                       
	Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebDAV                                  
	Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebSockets                              
	Enable-WindowsOptionalFeature -Online -FeatureName IIS-ApplicationInit                         
	Enable-WindowsOptionalFeature -Online -FeatureName IIS-ASPNET                                  
	Enable-WindowsOptionalFeature -Online -FeatureName IIS-ASPNET45                                
	Enable-WindowsOptionalFeature -Online -FeatureName IIS-ASP                                     
	Enable-WindowsOptionalFeature -Online -FeatureName IIS-ISAPIExtensions                         
	Enable-WindowsOptionalFeature -Online -FeatureName IIS-ISAPIFilter                             
	Enable-WindowsOptionalFeature -Online -FeatureName IIS-ServerSideIncludes                      
	Enable-WindowsOptionalFeature -Online -FeatureName IIS-CustomLogging                           
	Enable-WindowsOptionalFeature -Online -FeatureName IIS-BasicAuthentication                     
	Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpCompressionStatic                   
	Enable-WindowsOptionalFeature -Online -FeatureName IIS-ManagementConsole                       
	Enable-WindowsOptionalFeature -Online -FeatureName IIS-ManagementService                       
	Enable-WindowsOptionalFeature -Online -FeatureName IIS-WindowsAuthentication                   
	Enable-WindowsOptionalFeature -Online -FeatureName IIS-DigestAuthentication     
	
	choco install webdeploy /y
	choco install urlrewrite /y
}

function Install-Windows-Features {
	Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All

	Enable-WindowsOptionalFeature -Online -FeatureName MicrosoftWindowsPowerShellV2Root            
	Enable-WindowsOptionalFeature -Online -FeatureName MicrosoftWindowsPowerShellV2                
	Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux           
	Enable-WindowsOptionalFeature -Online -FeatureName WorkFolders-Client                          
	Enable-WindowsOptionalFeature -Online -FeatureName MediaPlayback                               
	Enable-WindowsOptionalFeature -Online -FeatureName WindowsMediaPlayer                          
	Enable-WindowsOptionalFeature -Online -FeatureName NetFx3          

	Install-IIS

	Enable-WindowsOptionalFeature -Online -FeatureName WCF-Services45                              
	Enable-WindowsOptionalFeature -Online -FeatureName WCF-TCP-PortSharing45                       

	Enable-WindowsOptionalFeature -Online -FeatureName NetFx4-AdvSrvs                              
	Enable-WindowsOptionalFeature -Online -FeatureName NetFx4Extended-ASPNET45                     
	Enable-WindowsOptionalFeature -Online -FeatureName Printing-PrintToPDFServices-Features        
	Enable-WindowsOptionalFeature -Online -FeatureName Printing-XPSServices-Features               
	Enable-WindowsOptionalFeature -Online -FeatureName MSRDC-Infrastructure                        
	Enable-WindowsOptionalFeature -Online -FeatureName TelnetClient                                
	Enable-WindowsOptionalFeature -Online -FeatureName TFTP                                        
	Enable-WindowsOptionalFeature -Online -FeatureName Printing-Foundation-Features                
	Enable-WindowsOptionalFeature -Online -FeatureName FaxServicesClientPackage                    
	Enable-WindowsOptionalFeature -Online -FeatureName Printing-Foundation-InternetPrinting-Client 
}

function Apply-Start-Taskbar-Layout {
	#https://docs.microsoft.com/en-us/windows/configuration/configure-windows-10-taskbar
	#http://www.scconfigmgr.com/2016/08/03/customize-pinned-items-on-taskbar-in-windows-10-1607-during-osd-with-configmgr/
	#Import-StartLayout -LayoutPath .\pins-layout.xml -MountPath $env:SystemDrive\
}

function Remove-Unwanted-Store-Apps {
	Write-BoxtarterMessage "Remove unwanted pre-installed apps"
	$AppList = @(
		'*Disney*', 
		'*king.com*', 
		'*HiddenCity*', 
		'*DolbyLaboratories*', 
		'*Microsoft.MicrosoftOfficeHub*', 
		'*Microsoft.BingNews*', 
		'*getstarted*', 
		'*gethelp*', 
		'*bingfinance*', 
		'*sports*', 
		'*adobe*', 
		'*Microsoft.DrawboardPDF*', 
		'*facebook*', 
		'*bethesda*', 
		'*farmville*'); 
	foreach ($App in $AppList) { Get-AppxPackage -Name $App | Remove-AppxPackage }
}

function Unprovision-Unwanted-Store-Apps {
	Write-BoxtarterMessage "Unprovision unwanted apps"
	$AppList = @(
		'*Microsoft.MicrosoftOfficeHub*', 
		'*Microsoft.BingNews*', 
		'*bingfinance*', 
		'*sports*', 
		'*adobe*', 
		'*Microsoft.DrawboardPDF*', 
		'*facebook*', 
		'*bethesda*', 
		'*farmville*'); 
	foreach ($App in $AppList) { Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -like $App} | Remove-AppxProvisionedPackage -Online }
}

Disable-UAC

Disable-BingSearch

Disable-GameBarTips

Move-Libraries

Apply-File-Explorer-Settings

choco install 7zip -y
choco install kdiff3 -y
choco install filezilla -y
choco install fiddler -y
choco install postman -y
choco install soapui -y
choco install webpi -y

# MVC 3
choco install aspnetmvc.install -y

choco install linkshellextension -y
#choco install blender -y
choco install cura -y
choco install audacity -y
#TODO: create appx for Mod-T app with the bridge creator and install it 

choco install googlechrome -y
choco install firefox -y
choco install opera -y

Install-Windows-Features

Remove-Unwanted-Store-Apps

Unprovision-Unwanted-Store-Apps

Write-BoxtarterMessage "Openning apps directly in the Windows Store app"
# https://docs.microsoft.com/en-us/windows/uwp/launch-resume/launch-store-app 

start-process ms-windows-store://pdp/?ProductId=9NBLGGH4VZW5 # Autodesk Sketchbook
pause
start-process ms-windows-store://pdp/?ProductId=9WZDNCRFJ262 # Nextgen Reader
pause
start-process ms-windows-store://pdp/?ProductId=9NBLGGGZNGR9 # Trakter
pause
start-process ms-windows-store://pdp/?ProductId=9NJ3KMH29VGJ # Enpass Password Manager
pause
start-process ms-windows-store://pdp/?ProductId=9NCBCSZSJRSB # Spotify
pause
start-process ms-windows-store://pdp/?ProductId=9NBHCS1LX4R0 # Paint.NET
pause
start-process ms-windows-store://pdp/?ProductId=9NBLGGH5279M # Open Live Writer
pause
start-process ms-windows-store://pdp/?ProductId=9WZDNCRFJ3Q8 # Plex
pause
start-process ms-windows-store://pdp/?ProductId=9NKSQGP7F2NH # WhatsApp desktop
pause
Start-Process ms-windows-store://pdp/?ProductId=9NZTWSQNTD0S # Telegram
pause
start-process ms-windows-store://pdp/?ProductId=9WZDNCRDMDM3 # Nuget Package Explorer
pause
Start-Process ms-windows-store://pdp/?ProductId=9MZBFRMZ0MNJ # Microsoft Edge DevTools Preview
pause
start-process ms-windows-store://pdp/?ProductId=9NBLGGH35LRM # Affinity Designer
pause
start-process ms-windows-store://pdp/?ProductId=9NBLGGH35LXN # Affinity Photo
pause
start-process ms-windows-store://pdp/?ProductId=9PP3C07GTVRH # Blender 3D
pause

start-process ms-windows-store://pdp/?ProductId=CFQ7TTC0K5DM # Office 365 Home
# start-process ms-windows-store://pdp/?ProductId=CFQ7TTC0K5F3 # Excel 2016
# start-process ms-windows-store://pdp/?ProductId=CFQ7TTC0K5D7 # Word 2016
# start-process ms-windows-store://pdp/?ProductId=CFQ7TTC0K5CT # PowerPoint 2016
pause
Start-Process ms-windows-store://pdp/?ProductId=CFQ7TTC0K569 # Skype for Business 2016
pause
Start-Process ms-windows-store://pdp/?ProductId=9WZDNCRFJ364 # Skype
pause

start-process ms-windows-store://pdp/?ProductId=9NBLGGH4R9NZ # AdBlock Plus
pause
start-process ms-windows-store://pdp/?ProductId=9NZ9D2J86W6S # JSON Formatter for Edge
pause
start-process ms-windows-store://pdp/?ProductId=9NBLGGH4QWS7 # Page Analyzer
pause
start-process ms-windows-store://pdp/?ProductId=9PBGQPBGBFH5 # Web Developer Checklist
pause
start-process ms-windows-store://pdp/?ProductId=9N8H1T7MZC7W # BrowserStack
pause
start-process ms-windows-store://pdp/?ProductId=9MSPC6MP8FM4 # Microsoft Whiteboard
pause
Start-Process ms-windows-store://pdp/?ProductId=9NBLGGH4SKZW # Desktop App Converter
pause 
Start-Process ms-windows-store://pdp/?ProductId=9WZDNCRDFXZS # Wunderlist
pause
Start-Process ms-windows-store://pdp/?ProductId=9N5TDP8VCMHS # Web Media Extensions


start-process https://www.microsoft.com/en-us/sql-server/sql-server-editions-express # SQL Express
# look into using https://chocolatey.org/packages/sql-server-express

start-process https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms # SQL Management Studio
# look into using https://chocolatey.org/packages/sql-server-management-studio

start-process https://www.visualstudio.com/downloads/ # Visual Studio Enterprise
# look into using https://chocolatey.org/packages/visualstudio2017enterprise

Write-BoxtarterMessage "Wait for SQL Server, SQL Management Studio and Visual Studio to finish installing before continuing"
pause

Apply-Start-Taskbar-Layout

Enable-UAC

Enable-MicrosoftUpdate

Install-WindowsUpdate -acceptEula