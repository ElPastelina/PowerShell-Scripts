# This script works by moving the Mods files out of the Mods folder, deactivating them. A 'Deactivated Mods' folder will be 
# created in \Documents\Electronic Arts\The Sims 4 to store the deactivated mods.
# The activation will work in the reverse way, moving de Mods from the Deactivated Mods folder into the main Mods folder.

Add-Type -AssemblyName PresentationFramework

$simsPath = $env:USERPROFILE + '\Documents\Electronic Arts\The Sims 4\'

# Checks if the "Deactivate Mods" folder exists. If not, it will be created
if (Test-Path -Path (Join-Path -Path $simsPath -ChildPath '\Deactivated Mods')) {} else {
    New-Item -Path $simsPath -ItemType Directory -Name 'Deactivated Mods'
}

# Check if there is any file the Mods folder and than moves them to the Deactivated Mods folder
if ((Get-ChildItem -Path (Join-Path -Path $simsPath -ChildPath '\Mods') | Measure-Object).Count -gt 0){
    [System.Windows.MessageBox]::Show('The Sims 4 Mods Deactivated')
    Get-ChildItem -Path (Join-Path -Path $simsPath -ChildPath '\Mods')| Move-Item -Destination 'C:\Users\jsbro\Documents\Electronic Arts\The Sims 4\Deactivated Mods\'

} elseif ((Get-ChildItem -Path (Join-Path -Path $simsPath -ChildPath '\Deactivated Mods') | Measure-Object).Count -gt 0){
    [System.Windows.MessageBox]::Show('The Sims 4 Mods Activated')
    Get-ChildItem -Path (Join-Path -Path $simsPath -ChildPath '\Deactivated Mods') | Move-Item -Destination 'C:\Users\jsbro\Documents\Electronic Arts\The Sims 4\Mods\'
} else {
    [System.Windows.MessageBox]::Show('Something went wrong, good luck find out what.')
}
