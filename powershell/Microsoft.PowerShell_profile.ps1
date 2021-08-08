if(![System.IO.File]::Exists($env:UserProfile+"\Documents\WindowsPowerShell\profile.ps1")){
  New-Item -Path $env:UserProfile"\Documents\"  -ItemType Directory -Name "WindowsPowerShell"
  New-Item -Path $env:UserProfile"\Documents\WindowsPowerShell" -ItemType SymbolicLink -Name "profile.ps1" -Target $MyInvocation.MyCommand.Definition
}

#$env:http_proxy="http://127.0.0.1:1080"
#$env:https_proxy="http://127.0.0.1:1080"
#$env:no_proxy="localhost,127.0.0.1,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16,::1,fe80::/10"
Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete

# function Test-Administrator {
#   if ($PSVersionTable.Platform -eq 'Unix') {
#     return (whoami) -eq 'root'
#   }
#   elseif ($PSVersionTable.Platform -eq 'Windows') {
#     return $false #TO-DO: find out how to distinguish this one
#   }
#   else {
#     return ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')
#   }
# }

Function prompt {
  $lastCommandFailed = -not $?

  # Write-Host $([System.Environment]::UserName) -NoNewline
  # $path="$($executionContext.SessionState.Path.CurrentLocation)"
  # if (Test-Administrator) {
  #   Write-Host $path -NoNewline -ForegroundColor Red
  # }else{
  #   Write-Host $path -NoNewline -ForegroundColor Green
  # }
  Write-Host "$($executionContext.SessionState.Path.CurrentLocation)" -NoNewline

  $arrow = ">" * ($nestedPromptLevel + 1)
  if ($lastCommandFailed) {
    Write-Host $arrow -NoNewline -ForegroundColor Red
  }
  else {
    Write-Host $arrow -NoNewline
  }
  return " "
}