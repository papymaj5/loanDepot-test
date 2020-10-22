<#
.SYNOPSIS
    This script takes a string and attempts to find a repeating char and returns the first if found, else thows an error.
.PARAMETER ScriptString
    String used to execute script. Defaulted to abcdedcba
.EXAMPLE
        Test.ps1 -ScriptString 'abcdedcba'
.NOTES
    Updated on: 10/21/2020
    Created by: Jon Clausen
    Filename: Test.ps1
#>
[CmdletBinding()]
param(
    [string] $ScriptString = 'abcdedcba'
)

function Get-FirstRecChar {
    <#
    .SYNOPSIS
        This function takes a string and attempts to find a repeating char and returns the first if found, else thows an error.
    .EXAMPLE
        Get-FirstRecChar -FuncString $ScriptString
    .PARAMETER FuncString
        String used to execute function.
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string] $FuncString
    )
    
    begin {
        $Order = [ordered]@{}
    }
    
    process {
        foreach ($IndvChar in $FuncString.ToLower().ToCharArray()) {
            if ($Order.$IndvChar) { 
                return $IndvChar 
            }
            else { 
                $Order += @{ $IndvChar = 1 } 
            }
        }
        Write-Error "Did not find repeating char" -ErrorAction Stop
    }
}

$Output = Get-FirstRecChar -FuncString $ScriptString

Write-Output "The first repeated char is: $Output"