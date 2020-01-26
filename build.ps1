function Initialize-Script {

    Set-ExecutionPolicy RemoteSigned -Force

    Install-PackageProvider -name NuGet -MinimumVersion 2.8.5.201 -Force

    Install-Module PSWriteColor -Scope CurrentUser
    Import-Module PSWriteColor

    Write-Color "********* Initialization completed *********" -Color Green
}

function Set-ContentFromTemplate {
    Param($Path, $TemplatePath, $Parameters)
    Write-Output $Parameters
    $content = Get-Content $TemplatePath
    foreach ($paramName in $Parameters.Keys) {
        $content = $content.replace("{{ ${paramName} }}", $Parameters.Item($paramName))
    }
    Set-Content -Path $Path -value $content
}

function Configure-Powershell {
  mkdir ~\Documents\WindowsPowerShell\autoload -Force
  & .\Microsoft.PowerShell_profile.ps1
  Copy-Item ../Microsoft.PowerShell_profile.ps1 ~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
  Write-Color "********* Powershell configured!" -Color Green
}

function Configure-Git {
    Param($Parameters)
    PowerShellGet\Install-Module posh-git -Scope CurrentUser
    Add-PoshGitToProfile -AllHosts
    Set-ContentFromTemplate -Path ~/.gitconfig -TemplatePath gitconfig -Parameters $Parameters
    Write-Color "********* Git configured! *********" -Color Green
}

function Install-Packages {

    cinst git -y
    cinst openssy -y
    cinst vscode --params '/NoDesktopIcon' -y
    cinst python -y
    cinst jq -y
    cinst curl -y
    cinst brave '/NoDesktopIcon' -y

    refreshenv

    Write-Color "********* Packages installed! *********" -Color Green
}

function Configure-VSCode {

  $ENV:PATH="C:\Program Files\Microsoft VS Code\bin;$ENV:PATH"

  code --install-extension vscodevim.vim
  code --install-extension vscoss.vscode-ansible
  code --install-extension ms-vscode.csharp
  code --install-extension ms-mssql.mssql
  code --install-extension ms-vscode.PowerShell
  code --install-extension formulahendry.code-runner
  code --install-extension ms-python.python
  code --install-extension PKief.material-icon-theme
  code --install-extension Equinusocio.vsc-material-theme

  Copy-Item ../keybindings.json ~\AppData\Roaming\Code\User\keybindings.json
  Copy-Item ../settings.json ~\AppData\Roaming\Code\User\settings.json

  Write-Color "********* VSCode all configured! *********" -Color Green
}


$arguments = $args[0]
if (!$arguments) {
    Write-Color "no arguments passed, exiting..." -Color Red
    Exit
}

$main = {
    Write-Output "********* Setting up colorized output *********"
    Initialize-Script
    Write-Color "********* Install-Packages *********" -Color Green
    Install-Packages
    Write-Color "********* COnfigure-VSCode *********" -Color Green
    Configure-VSCode
    Write-Color "********* Copnfigure-Powershell *********" -Color Green
    Configure-Powershell
    Write-Color "********* Configure-Git *********" -Color Green
    Configure-Git -Parameters $arguments
}

& $main