# Ensure elevated privileges (UAC prompt)
$IsAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (-not $IsAdmin) {
    Write-Host "Error: Administrator privileges required to create symlinks." -ForegroundColor Red
    Write-Host "Please re-run this script in an elevated PowerShell prompt (Run as Administrator)." -ForegroundColor Yellow
    exit 1
}

# MAP: Relative path in project = Absolute system path
$Dotfiles = [ordered]@{
    "git\.gitconfig"     = "$HOME\.gitconfig"
    #"powershell\profile" = "$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
}

foreach ($SourceRel in $Dotfiles.Keys) {
    $Source = Join-Path $PSScriptRoot $SourceRel
    $Target = $Dotfiles[$SourceRel]

    # Dotfile not found in the project
    if (-not (Test-Path $Source)) {
        Write-Host "Missing source (in project): $SourceRel" -ForegroundColor Yellow
        continue
    }

    # Clear previous config
    if (Test-Path $Target) {
        Remove-Item $Target -Force -Recurse
    }

    # Make sure target path exists
    $TargetParent = Split-Path $Target -Parent
    if (-not (Test-Path $TargetParent)) {
        New-Item -ItemType Directory -Path $TargetParent -Force | Out-Null
    }

    # Create symbolic link
    New-Item -ItemType SymbolicLink -Path $Target -Target $Source | Out-Null
    Write-Host "Linked: $SourceRel -> $Target" -ForegroundColor Green
}