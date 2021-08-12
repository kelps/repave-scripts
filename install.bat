@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

choco install 7zip -y
choco install kdiff3 -y
choco install filezilla -y
choco install fiddler -y
choco install postman -y
@REM choco install soapui -y
@REM choco install webpi -y

@REM MVC 3
@REM choco install aspnetmvc.install -y
choco install googlechrome -y
@REM choco install firefox -y
@REM choco install opera -y
choco install -y linkshellextension
@REM choco install blender -y
@REM choco install cura -y
@REM choco install audacity -y

@echo Openning apps directly in the Windows Store app
@REM https://docs.microsoft.com/en-us/windows/uwp/launch-resume/launch-store-app 

@REM start "" ms-windows-store://pdp/?ProductId=9N2T6F9F5ZDN @REM Nightingale REST Client
@REM @pause
start "" ms-windows-store://pdp/?ProductId=9NBLGGH4VZW5 @REM Autodesk Sketchbook
@pause
start "" ms-windows-store://pdp/?ProductId=9WZDNCRFJ262 @REM Nextgen Reader
@pause
start "" ms-windows-store://pdp/?ProductId=9NBLGGGZNGR9 @REM Trakter
@pause
start "" ms-windows-store://pdp/?ProductId=9NJ3KMH29VGJ @REM Enpass Password Manager
@pause
@REM start "" ms-windows-store://pdp/?ProductId=9NCBCSZSJRSB @REM Spotify
@REM @pause
start "" ms-windows-store://pdp/?ProductId=9NBHCS1LX4R0 @REM Paint.NET
@pause
@REM start "" ms-windows-store://pdp/?ProductId=9NBLGGH5279M @REM Open Live Writer
@REM @pause
@REM start "" ms-windows-store://pdp/?ProductId=9WZDNCRFJ3Q8 @REM Plex
@REM @pause
start "" ms-windows-store://pdp/?ProductId=9NKSQGP7F2NH @REM WhatsApp desktop
@pause
start "" ms-windows-store://pdp/?ProductId=9WZDNCRDMDM3 @REM Nuget Package Explorer
@pause

start "" ms-windows-store://pdp/?ProductId=9NBLGGH35LRM @REM Affinity Designer
@pause
start "" ms-windows-store://pdp/?ProductId=9NBLGGH35LXN @REM Affinity Photo
@pause

@REM start "" ms-windows-store://pdp/?ProductId=CFQ7TTC0K5DM @REM Office 365 Home
@REM start "" ms-windows-store://pdp/?ProductId=CFQ7TTC0K7KX @REM Excel
@REM @pause
@REM start "" ms-windows-store://pdp/?ProductId=CFQ7TTC0K7C7 @REM Word 2016
@REM @pause
@REM start "" ms-windows-store://pdp/?ProductId=CFQ7TTC0K7C6 @REM PowerPoint 2016
@REM @pause

@REM start "" ms-windows-store://pdp/?ProductId=9NBLGGH4R9NZ @REM AdBlock Plus
@REM @pause
@REM start "" ms-windows-store://pdp/?ProductId=9NZ9D2J86W6S @REM JSON Formatter for Edge
@REM @pause
@REM start "" ms-windows-store://pdp/?ProductId=9NBLGGH4QWS7 @REM Page Analyzer
@REM @pause
@REM start "" ms-windows-store://pdp/?ProductId=9PBGQPBGBFH5 @REM Web Developer Checklist
@REM @pause
@REM start "" ms-windows-store://pdp/?ProductId=9N8H1T7MZC7W @REM BrowserStack
@REM @pause
@REM start "" ms-windows-store://pdp/?ProductId=9MSPC6MP8FM4 @REM Microsoft Whiteboard

start "" https://www.microsoft.com/en-us/sql-server/sql-server-editions-express @REM SQL Express
@REM look into https://chocolatey.org/packages/sql-server-express

start "" https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms @REM SQL Management Studio
@REM look into https://chocolatey.org/packages/sql-server-management-studio

start "" https://www.visualstudio.com/downloads/ @REM Visual Studio Enterprise
@REM look into https://chocolatey.org/packages/visualstudio2017enterprise

@echo Remove unwanted pre-installed apps
@powershell -NoProfile -ExecutionPolicy Bypass -Command "$AppList = @('*Disney*', '*king.com*', '*HiddenCity*', '*DolbyLaboratories*', '*Microsoft.MicrosoftOfficeHub*', '*Microsoft.BingNews*', '*getstarted*', '*gethelp*', '*bingfinance*', '*sports*', '*adobe*', '*Microsoft.DrawboardPDF*', '*facebook*', '*bethesda*', '*farmville*'); foreach ($App in $AppList) { Get-AppxPackage -Name $App | Remove-AppxPackage }"

@echo Unprovision unwanted apps
@powershell -NoProfile -ExecutionPolicy Bypass -Command "$AppList = @('*Microsoft.MicrosoftOfficeHub*', '*Microsoft.BingNews*', '*bingfinance*', '*sports*', '*adobe*', '*Microsoft.DrawboardPDF*', '*facebook*', '*bethesda*', '*farmville*'); foreach ($App in $AppList) { Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -like $App} | Remove-AppxProvisionedPackage -Online }"
