$env:ChocolateyInstall='D:\Choco'
$env:chocolateyProxyLocation='http://127.0.0.1:1080/'
[Environment]::SetEnvironmentVariable('ChocolateyInstall', $env:ChocolateyInstall, 'User')
[Environment]::SetEnvironmentVariable('chocolateyProxyLocation', $env:chocolateyProxyLocation, 'User')
Set-ExecutionPolicy Bypass -Scope Process -Force
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco config set cacheLocation D:\Choco\cache