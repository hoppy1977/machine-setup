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
chocolatey feature disable -n=allowGlobalConfirmation

Write-host "Choco Packages Ended At: $((Get-Date).ToString())"
