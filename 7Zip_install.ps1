
Configuration package {
    

    Install-Module -Name cChoco
    Node localhost {
        cChocoinstaller Install {
            InstallDir = "C:\Choco"
            }
        
        cChocoPackageInstaller Install7Zip {
            Name = '7Zip.install'
            DependsOn = '[cChocoInstaller]Install'
            }
        }
    }

Package

Start-DscConfiguration -ComputerName localhost