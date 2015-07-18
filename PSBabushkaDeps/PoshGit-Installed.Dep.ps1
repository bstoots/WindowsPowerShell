New-PSBabushkaDep `
	-Name 'PoshGit-Installed' `
	-Requires 'PsGet-Installed' `
	-Met { Get-Command -Module 'Posh-Git' } `
	-Meet { 
    # We clone manually to avoid having the PsGet installer trash our profile with its defaults
    # TODO: Would be good to get this fixed upstream ...
    git clone "git@github.com:dahlbyk/posh-git.git" "$PSScriptRoot\..\Modules\posh-git" 
    Import-Module Posh-Git 
  }
