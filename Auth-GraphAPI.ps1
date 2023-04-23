# Requires MSAL.PS module to be installed

function New-GraphAuth {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$domain,

        [Parameter(Mandatory)]
        [ValidateSet("DeviceCode","Interactive")]
        [string]$authProvider,

        [Parameter(Mandatory)]
        [string]$appID
    )

    if ($authProvider -eq "Interactive"){
        $authParams = @{
            ClientId    = $appID # Application (client) ID
            TenantId    = $domain
            Interactive = $true
        }
    } else {
        $authParams = @{
            ClientId    = $appID # Application (client) ID
            TenantId    = $domain
            DeviceCode = $true
        }
    }

    $auth = Get-MsalToken @authParams
    $auth
    $token = $auth.AccessToken
}