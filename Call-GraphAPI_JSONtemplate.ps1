# Template for a function to POST to a Graph API resource

####################################################
Function REPLACENAME {
    <#
    .SYNOPSIS
    
    .DESCRIPTION
    
    .EXAMPLE
        <function> -JSON <path to JSON>

    .NOTES
    
    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [ValidateSet("GET","POST","PATCH","PUT","DELETE")]
        [string]$Method,

        [Parameter(Mandatory)]
        [ValidateSet("v1.0","beta")]
        [string]$graphApiVersion,
        
        [Parameter(Mandatory)]
        [string]$AP_resource,
        
        [Parameter(Mandatory)]
        [string]$JSONfile
    )

    if ($method = "v1.0"){
        $graphApiVersion = "v1.0"
    } else {
        $graphApiVersion = "Beta"
    }

    $JSON = Get-Content -Path $JSONfile
    $uri = "https://graph.microsoft.com/$graphApiVersion/$($AP_resource)"

    if($JSON -eq "" -or $null -eq $JSON){
        write-host "No JSON specified" -f Red
    } else {    
        Test-JSON -JSON $JSON
        Invoke-RestMethod -Uri $uri -Headers $authToken -Method Post -Body $JSON -ContentType "application/json"    
    }
}

####################################################