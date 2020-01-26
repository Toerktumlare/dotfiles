# Load scripts from autoload dir
Get-ChildItem "$HOME/Documents/WindowsPowerShell/autoload/*.ps1" | ForEach-Object{
    .$_
}