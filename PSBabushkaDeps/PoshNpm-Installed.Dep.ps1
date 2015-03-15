New-PSBabushkaDep `
  -Name 'PoshNpm-Installed' `
  -Requires 'PsGet-Installed' `
  -Met { Get-Module 'posh-npm' } `
  -Meet { Install-Module 'posh-npm' }