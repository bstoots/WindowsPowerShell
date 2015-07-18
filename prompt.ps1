# Custom prompt definition
function global:prompt {
  # Writes current path
  Write-Host($pwd.ProviderPath) -nonewline
  # Show git info if available
  Write-VcsStatus
  # Kills the PS suffix
  return "> "
}
