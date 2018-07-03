@REM KELPS-INSPIRON taskbar: Mail, Nextgen, Explorer, Edge, Chrome, IE, Firefox, Opera, IIS, VS, SQL, Fiddler, Postman, SOAP UI, Filezilla, Excel, Affinity Designer, Affinity Photo

@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
@pause
choco install 7zip -y
@pause
choco install kdiff3 -y
@pause
choco install filezilla -y
@pause
choco install fiddler4 -y --version 4.6.3.50306 --ignore-checksums
@pause
choco install postman -y
@pause
choco install soapui -y
@pause
choco install webpi -y
@pause
@echo "MVC 3"
choco install aspnetmvc.install -y
@pause
choco install googlechrome -y
@pause
choco install firefox -y
@pause
choco install opera -y
@pause
choco install -y linkshellextension --ignore-checksums
@pause
choco install blender -y

@REM @pause
@REM choco install ilspy -y
@REM @pause
@REM cinst cura -y
@REM @pause
@REM cinst wixtoolset -y
@REM @pause
@REM @echo video editor
@REM cinst openshot -y
@REM @pause
@REM cinst audacity -y
@REM @pause
@REM cinst mediainfo -y
@REM @pause
@REM cinst visualstudiocode -y --params '"/NoDesktopIcon"'

@echo Abrindo aplicativos da loja para instalação
@REM https://docs.microsoft.com/en-us/windows/uwp/launch-resume/launch-store-app 

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

pause
start "" ms-windows-store://pdp/?ProductId=CFQ7TTC0K5DM @REM Office 365 Home
@REM start "" ms-windows-store://pdp/?ProductId=CFQ7TTC0K5F3 @REM Excel 2016


@pause
start "" ms-windows-store://pdp/?ProductId=9NBLGGH4R9NZ @REM AdBlock Plus
@pause
start "" ms-windows-store://pdp/?ProductId=9NZ9D2J86W6S @REM JSON Formatter for Edge
@pause
start "" ms-windows-store://pdp/?ProductId=9NBLGGH4QWS7 @REM Page Analyzer
@pause
start "" ms-windows-store://pdp/?ProductId=9PBGQPBGBFH5 @REM Web Developer Checklist

@pause
start "" https://www.microsoft.com/en-us/sql-server/sql-server-editions-express @REM SQL Express
@pause
start "" https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms @REM SQL Management Studio
@pause
start "" https://www.visualstudio.com/downloads/ @REM Visual Studio Enterprise


@REM start "" ms-windows-store://pdp/?ProductId=9WZDNCRFJ364 @REM Skype
@REM @pause
@REM start "" ms-windows-store://pdp/?ProductId=9N94C0BCZSHG @REM Enpass extension for Edge
@REM start "" ms-windows-store://pdp/?ProductId=9N8H1T7MZC7W @REM BrowserStack
@REM start "" ms-windows-store://pdp/?ProductId=9MSPC6MP8FM4 @REM Microsoft Whiteboard


@echo Remove provisionamento para aplicativos OneNote e Microsoft Office Hub
@powershell -NoProfile -ExecutionPolicy Bypass -Command "$AppList = @('*Microsoft.Office.OneNote*', '*Microsoft.MicrosoftOfficeHub*', '*Microsoft.BingNews*', '*bingfinance*', '*sports*', '*adobe*', '*Microsoft.DrawboardPDF*', '*facebook*', '*bethesda*', '*farmville*'); foreach ($App in $AppList) { Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -like $App} | Remove-AppxProvisionedPackage -Online }"
@echo Remove aplicativos indesejados do usuário
@powershell -NoProfile -ExecutionPolicy Bypass -Command "$AppList = @('*Disney*', '*king.com*', '*HiddenCity*', '*DolbyLaboratories*', '*Microsoft.MicrosoftOfficeHub*', '*Microsoft.BingNews*', '*getstarted*', '*gethelp*', '*bingfinance*', '*sports*', '*adobe*', '*Microsoft.DrawboardPDF*', '*facebook*', '*bethesda*', '*farmville*'); foreach ($App in $AppList) { Get-AppxPackage -Name $App | Remove-AppxPackage }"
