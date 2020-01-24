function Configure-Powershell {
  mkdir C:\Users\B926FT\Documents\WindowsPowerShell\autoload -Force
  Get-Location
  & .\Microsoft.PowerShell_profile.ps1
  Set-Location C:\Users\B926FT\code\dotfiles
  Copy-Item Microsoft.PowerShell_profile.ps1 C:\Users\B926FT\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

}

function Install-Packages {
    cinst git -y
    cinst openssy -y
    cinst vscode --params '/NoDesktopIcon' -y
    cinst python -y
    cinst jq -y
    cinst curl -y
}

function Configure-VSCode {
  code --install-extension vscodevim.vim
  code --install-extension vscoss.vscode-ansible
  code --install-extension ms-vscode.csharp
  code --install-extension ms-mssql.mssql
  code --install-extension ms-vscode.PowerShell
  code --install-extension formulahendry.code-runner
  code --install-extension ms-python.python
  code --install-extension PKief.material-icon-theme
  code --install-extension Equinusocio.vsc-material-theme

  Copy-Item keybindings.json ~\AppData\Roaming\Code\User\keybindings.json
  Copy-Item settings.json ~\AppData\Roaming\Code\User\settings.json
}

@(
    "Install-Packages",
    "Configure-Powershell",
    "Configure-VSCode"
) | ForEach-Object {
        echo ""
        echo "********* $_ *********"
        echo ""

        &$_
        if ($LastExitCode -ne 0) {
            Exit $LastExitCode
        }
    }