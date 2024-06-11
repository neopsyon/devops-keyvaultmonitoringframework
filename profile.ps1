$ErrorActionPreference = 'stop'

$modules = @(
    @{Name = 'Az.KeyVault'; Version = '4.9.2' }
    @{Name = 'Az.Storage'; Version = '5.4.1' }
    @{Name = 'Az.Resources'}
)

foreach ($module in $modules) {
    try {
        if ($module.containsKey('Version')) {
            Import-Module $module.Name -RequiredVersion $module.Version -Force
        }
        else {
            Import-Module $module.Name -Force 
        }
    }
    catch {
        if ($_.Exception.Message -like '*Assembly with same name is already loaded*') {
            continue
        }
        else {
            throw $_
        }
    }
}

if ($env:MSI_SECRET) {
    Disable-AzContextAutosave -Scope Process | Out-Null
    Connect-AzAccount -Identity
}