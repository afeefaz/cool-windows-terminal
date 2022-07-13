winget install --id Starship.Starship

$exp = "Invoke-Expression (&starship init powershell)"
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
