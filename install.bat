@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

choco install 7zip -y
choco install kdiff3 -y
choco install filezilla -y
choco install fiddler -y
@REM choco install postman -y
choco install soapui -y
choco install webpi -y

@REM MVC 3
choco install aspnetmvc.install -y
choco install googlechrome -y
choco install firefox -y
choco install opera -y
choco install -y linkshellextension
choco install blender -y
choco install cura -y
choco install audacity -y

@echo Openning apps directly in the Windows Store app
@REM https://docs.microsoft.com/en-us/windows/uwp/launch-resume/launch-store-app 

start "" ms-windows-store://pdp/?ProductId=9N2T6F9F5ZDN @REM Nightingale REST Client
@pause
start "" ms-windows-store://pdp/?ProductId=9NBLGGH4VZW5 @REM Autodesk Sketchbook
@pause
start "" ms-windows-store://pdp/?ProductId=9WZDNCRFJ262 @REM Nextgen Reader
@pause
start "" ms-windows-store://pdp/?ProductId=9NBLGGGZNGR9 @REM Trakter
@pause
start "" ms-windows-store://pdp/?ProductId=9NJ3KMH29VGJ @REM Enpass Password Manager
@pause
start "" ms-windows-store://pdp/?ProductId=9NCBCSZSJRSB @REM Spotify
@pause
start "" ms-windows-store://pdp/?ProductId=9NBHCS1LX4R0 @REM Paint.NET
@pause
start "" ms-windows-store://pdp/?ProductId=9NBLGGH5279M @REM Open Live Writer
@pause
start "" ms-windows-store://pdp/?ProductId=9WZDNCRFJ3Q8 @REM Plex
@pause
start "" ms-windows-store://pdp/?ProductId=9NKSQGP7F2NH @REM WhatsApp desktop
@pause
start "" ms-windows-store://pdp/?ProductId=9WZDNCRDMDM3 @REM Nuget Package Explorer
@pause

start "" ms-windows-store://pdp/?ProductId=9NBLGGH35LRM @REM Affinity Designer
@pause
start "" ms-windows-store://pdp/?ProductId=9NBLGGH35LXN @REM Affinity Photo
@pause

start "" ms-windows-store://pdp/?ProductId=CFQ7TTC0K5DM @REM Office 365 Home
@REM start "" ms-windows-store://pdp/?ProductId=CFQ7TTC0K5F3 @REM Excel 2016
@REM start "" ms-windows-store://pdp/?ProductId=CFQ7TTC0K5D7 @REM Word 2016
@REM start "" ms-windows-store://pdp/?ProductId=CFQ7TTC0K5CT @REM PowerPoint 2016
@pause

start "" ms-windows-store://pdp/?ProductId=9NBLGGH4R9NZ @REM AdBlock Plus
@pause
start "" ms-windows-store://pdp/?ProductId=9NZ9D2J86W6S @REM JSON Formatter for Edge
@pause
start "" ms-windows-store://pdp/?ProductId=9NBLGGH4QWS7 @REM Page Analyzer
@pause
start "" ms-windows-store://pdp/?ProductId=9PBGQPBGBFH5 @REM Web Developer Checklist
@pause
start "" ms-windows-store://pdp/?ProductId=9N8H1T7MZC7W @REM BrowserStack
@pause
start "" ms-windows-store://pdp/?ProductId=9MSPC6MP8FM4 @REM Microsoft Whiteboard

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
