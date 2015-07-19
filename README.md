# WindowsPowerShell

My take on a highly configurable, easily deployable Windows Powershell profile.

## Requirements

* Powershell 3.0 or greater
* Git

## Installation

* Make sure there are no Powershell processes running
* Backup anything you want to keep from your existing Powershell profile:
```
%UserProfile%\My Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 
```
* Remove the existing WindowsPowerShell directory and clone this repo in its place
```
git clone git@github.com:bstoots/WindowsPowerShell.git
```
* Start a Powershell session.  All required modules will be checked and loaded upon startup
* You may need to source your profile again after loading
```
. $PROFILE
```
