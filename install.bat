@powershell -NoProfile -ExecutionPolicy Bypass -Command ". { iwr -useb https://boxstarter.org/bootstrapper.ps1 } | iex; get-boxstarter -Force" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

@powershell -NoProfile -ExecutionPolicy Bypass -Command "Install-BoxstarterPackage -PackageName http://boxstarter.org/package/nr/url?https://raw.githubusercontent.com/kelps/repave-scripts/master/install.ps1 -DisableReboots"

@REM start "" http://boxstarter.org/package/nr/url?https://raw.githubusercontent.com/kelps/repave-scripts/master/install.ps1
