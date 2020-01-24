Set-Location C:\Users\B926FT

$ENV:PATH="C:\Program Files\Microsoft VS Code\bin;$ENV:PATH"

# Load scripts from autoload dir
Get-ChildItem "Documents/WindowsPowerShell/autoload/*.ps1" | ForEach-Object{
    .$_
}