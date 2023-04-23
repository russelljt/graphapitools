# Template for a function to POST to a Graph API resource

####################################################
Function REPLACENAME {
    <#
    .SYNOPSIS
    
    .DESCRIPTION
    
    .EXAMPLE
    
    .NOTES
    
    #>

    param (
        [Parameter(Mandatory)]
        [ValidateSet("GET","POST","PATCH","PUT","DELETE")]
        [string]$Method,

        [Parameter(Mandatory)]
        [ValidateSet("v1.0","beta")]
        [string]$graphApiVersion,
        
        [Parameter(Mandatory)]
        [string]$AP_resource
    )

    # Enter content set for HTTP request per Graph API documentation
    $Content = @{     }

    if ($method = "v1.0"){
        $graphApiVersion = "v1.0"
    } else {
        $graphApiVersion = "Beta"
    }

    $Body = $Content | ConvertTo-Json 
    Invoke-RestMethod -Uri $uri -Headers $authToken -Method $Method -Body $Body -ContentType "application/json"    

}

####################################################