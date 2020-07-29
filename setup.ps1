Write-host "********************************************************************************"
Write-host "Choco Packages Started At: $((Get-Date).ToString())"

Write-host "********************************************************************************"
chocolatey feature enable -n=allowGlobalConfirmation

Write-host "********************************************************************************"
$ChocoInstallPath = "$($env:SystemDrive)\ProgramData\Chocolatey\bin"
if (!(Test-Path $ChocoInstallPath)) {
    write-host "Install Chocolatey..."
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    write-host "END Installing Chocolatey" 
} else {
    write-host "Upgrade Chocolatey..."
    choco upgrade chocolatey
    write-host "END Upgrade Chocolatey"
}

Write-host "********************************************************************************"
write-host "Install Cmder..."
cinst -y --no-progress  cmder

Write-host "********************************************************************************"
write-host "Install 7-Zip..."
cinst -y --no-progress 7zip

Write-host "********************************************************************************"
write-host "Install Chrome..."
cinst -y --no-progress GoogleChrome

Write-host "********************************************************************************"
write-host "Install SetDefaultBrowser..."
cinst -y --no-progress setdefaultbrowser

Write-host "********************************************************************************"
write-host "Install NVM..."
cinst -y --no-progress nvm

Write-host "********************************************************************************"
write-host "Install Notepad++..."
cinst -y --no-progress notepadplusplus

Write-host "********************************************************************************"
write-host "Install Postman..."
cinst -y --no-progress  postman

Write-host "********************************************************************************"
write-host "Install TortoiseGit..."
cinst -y --no-progress tortoisegit

Write-host "********************************************************************************"
write-host "Install GrepWin..."
cinst -y --no-progress grepwin

Write-host "********************************************************************************"
write-host "Install Paint.NET..."
cinst -y --no-progress paint.net

Write-host "********************************************************************************"
write-host "Install CopyQ..."
cinst -y --no-progress copyq

Write-host "********************************************************************************"
write-host "Install KeePass..."
cinst -y --no-progress keepass

Write-host "********************************************************************************"
write-host "Install VLC..."
cinst -y --no-progress vlc

Write-host "********************************************************************************"
write-host "Install ExifTool..."
cinst -y --no-progress exiftool

Write-host "********************************************************************************"
write-host "Install LockHunter..."
cinst -y --no-progress lockhunter

Write-host "********************************************************************************"
write-host "Install Vagrant..."
cinst -y --no-progress vagrant

Write-host "********************************************************************************"
write-host "Install VirtualBox..."
cinst -y --no-progress virtualbox

Write-host "********************************************************************************"
write-host "Install Anaconda3..."
cinst -y --no-progress anaconda3

Write-host "********************************************************************************"
write-host "Install Adobe Reader..."
cinst -y --no-progress adobereader

Write-host "********************************************************************************"
write-host "Install TreeSize Free..."
cinst -y --no-progress treesizefree

Write-host "********************************************************************************"
chocolatey feature disable -n=allowGlobalConfirmation

Write-host "Choco Packages Ended At: $((Get-Date).ToString())"

Write-host "********************************************************************************"
Write-host "Configure PowerShell..."
# Give PowerShell admin rights
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force -Scope CurrentUser

Write-host "********************************************************************************"
Write-host "Personalise Windows UI..."

# set keyboard layout
Set-WinUserLanguageList en-AU -Force

# set the date format, number format, etc.
Set-Culture en-AU

# set the timezone
# use Get-TimeZone -ListAvailable to list the available timezone ids.
Set-TimeZone -Id 'AUS Eastern Standard Time'

# show hidden files
Set-ItemProperty -Path HKCU:Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name Hidden -Value 1

# show file extensions
Set-ItemProperty -Path HKCU:Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name HideFileExt -Value 0

# hide the search button
Set-ItemProperty -Path HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Search -Name SearchboxTaskbarMode -Value 0

# set default Explorer location to This PC
Set-ItemProperty -Path HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -Value 1

# Show all folders in nagivation pane
Set-ItemProperty -Path HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneShowAllFolders -Value 1

# Navigation pane should automatically expand to the current folder
Set-ItemProperty -Path HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneExpandToCurrentFolder -Value 1

# Always show menus in Windows Explorer
Set-ItemProperty -Path HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name AlwaysShowMenus -Value 1

# Show all items in the system tray
New-ItemProperty -Path HKLM:Software\Microsoft\Windows\CurrentVersion\Explorer -Name EnableAutoTray -Value 0 -PropertyType DWORD

# display full path in the title bar
New-Item -Path HKCU:Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState -Force `
    | New-ItemProperty -Name FullPath -Value 1 -PropertyType DWORD `
    | Out-Null

Write-host "********************************************************************************"
