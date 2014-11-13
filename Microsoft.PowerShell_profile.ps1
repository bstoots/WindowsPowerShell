# Add Scripts directory to the PS path
#Join-Path (Split-Path -Parent $PROFILE) Scripts

# TODO - Force PSBabushka to scan WindowsPowerShell directory regardless of start directory
cd (Split-Path -Parent $PROFILE)

# PSBabushka - Config management
# TODO - Check that PSBabushka actually imported
Import-Module PSBabushka

# Make sure PsGet is installed
Invoke-PSBabushka 'PsGet-Installed'

# Make sure PSReadLine is installed
Invoke-PSBabushka 'PSReadLine-Installed'
# TODO - Move these into their own directories or something ...
Invoke-PSBabushka 'PSReadline-Config-TabComplete'

# Make sure PoshGit is installed
Invoke-PSBabushka 'PoshGit-Installed'

# posh-git - Git goodies, prompt etc
# TODO - Figure out a way to do this with PSBabushka
if (Get-Module posh-git) {
  # Set up a simple prompt, adding the git prompt parts inside git repos
  # D:\Users\bstoots\Documents\WindowsPowerShell\Modules\posh-git\profile.example.ps1
  function global:prompt {
    $realLASTEXITCODE = $LASTEXITCODE
    # Reset color, which can be messed up by Enable-GitColors
    $Host.UI.RawUI.ForegroundColor = $GitPromptSettings.DefaultForegroundColor
    Write-Host($pwd.ProviderPath) -nonewline
    Write-VcsStatus
    $global:LASTEXITCODE = $realLASTEXITCODE
    return "> "
  }
  Enable-GitColors
}
