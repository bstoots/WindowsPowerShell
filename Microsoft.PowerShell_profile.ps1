# Push current location, jump to profile location
Push-Location (Split-Path -Parent $PROFILE)

# PSBabushka - Config management
if (Get-Module -ListAvailable | Where-Object {$_.name -eq "PSBabushka"}) {
  Import-Module PSBabushka
}
else {
  # The version of PSBabushka in PsGet isn't current.  Get from git for now
  git clone "git@github.com:PSBabushka/PSBabushka.git" "$PSScriptRoot\Modules\PSBabushka"
  Import-Module PSBabushka
}

# Make sure PsGet is installed
Invoke-PSBabushka 'PsGet-Installed' *>$null

# Make sure PSReadLine is installed
Invoke-PSBabushka 'PSReadLine-Installed' *>$null
# TODO - Move these into their own directories or something ...
Invoke-PSBabushka 'PSReadline-Config-TabComplete' *>$null

# Bring in for nice NPM tab completions
#Invoke-PSBabushka 'PoshNpm-Installed' *>$null

# Make sure PoshGit is installed
Invoke-PSBabushka 'PoshGit-Installed' *>$null

# Add Scripts\ to path 
if ((Test-Path -Path ".\Scripts") -eq $false) {
  New-Item -ItemType Directory -Force -Path ".\Scripts" *>$null
}
# Don't add to Path if already in Path
if ($env:Path -notlike "*$PSScriptRoot\Scripts*") {
  $env:Path += ";$PSScriptRoot\Scripts"
}

# Load custom prompt definition
. "$PSScriptRoot\prompt.ps1"

# posh-git - Git goodies, prompt etc
# TODO - Figure out a way to do this with PSBabushka
# if (Get-Module posh-git) {
#   # Set up a simple prompt, adding the git prompt parts inside git repos
#   # D:\Users\bstoots\Documents\WindowsPowerShell\Modules\posh-git\profile.example.ps1
#   function global:prompt {
#     $realLASTEXITCODE = $LASTEXITCODE
#     # Reset color, which can be messed up by Enable-GitColors
#     $Host.UI.RawUI.ForegroundColor = $GitPromptSettings.DefaultForegroundColor
#     Write-Host($pwd.ProviderPath) -nonewline
#     Write-VcsStatus
#     $global:LASTEXITCODE = $realLASTEXITCODE
#     return "> "
#   }
#   Enable-GitColors
# }

# Pop back to /*reality*/ start location
Pop-Location
