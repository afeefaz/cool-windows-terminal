Install-Module -Name PowerShellGet -Force
Install-Module PSReadLine -AllowPrerelease -Force
Install-Module PSReadLine

winget install --id Starship.Starship

$exp = "Import-Module PSReadLine

Invoke-Expression (&starship init powershell)

# Shows navigable menu of all options when hitting Tab
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

# Autocompleteion for Arrow keys
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

Set-PSReadLineOption -ShowToolTips
Set-PSReadLineOption -PredictionSource History"

$exp | Out-File ~/Documents/PowerShell/Microsoft.PowerShell_profile.ps1

New-Item -ItemType Directory -Force ~/.config;New-Item -ItemType file -Force ~/.config/starship.toml;

$starship = 'add_newline = false
format = "$python$directory$character"
[character]
success_symbol = "[➜](bold green) "
error_symbol = "[✗](bold red) "
[package]
disabled = true
[python]
format="(($virtualenv) )"'
$starship | Out-File ~/.config/starship.toml
