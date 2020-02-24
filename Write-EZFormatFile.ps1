﻿function Write-EZFormatFile
{
    <#
    .Synopsis
        Creates a new EZFormat file.
    .Description
        Creates a new EZFormat file.  EZFormat files use EZOut to create format and types files for a module.
    #>
    param(
    # Any -FormatView commands.
    [ScriptBlock[]]
    $Format,

    # Any -TypeView commands.
    [ScriptBlock[]]
    $Type
    )

    begin {
        $ezFormatTemplate = @'
#requires -Module EZOut
#  Install-Module EZOut or https://github.com/StartAutomating/EZOut
$myFile = $MyInvocation.MyCommand.ScriptBlock.File
$myModuleName = $($myFile | Split-Path -Leaf) -replace '\.ezformat\.ps1', ''
$myRoot = $myFile | Split-Path
Push-Location $myRoot
$formatting = @(
    # Add your own Write-FormatView here, or put them in a Formatting or Views directory

    foreach ($potentialDirectory in 'Formatting','Views') {
        Join-Path $myRoot $potentialDirectory |
            Get-ChildItem -ea ignore |
            Import-FormatView -FilePath {$_.Fullname}
    }
)

if ($formatting) {
    $myFormatFile = Join-Path $myRoot "$myModuleName.format.ps1xml"
    $formatting | Out-FormatData -Module $MyModuleName | Set-Content $myFormatFile -Encoding UTF8
}

$types = @(
    # Add your own Write-TypeView statements here
)

if ($types) {
    $myTypesFile = Join-Path $myRoot "$myModuleName.types.ps1xml"
    $types | Out-TypeData | Set-Content $myTypesFile -Encoding UTF8
}
Pop-Location
'@
    }


    process {
        if ($Type) {
            $ezFormatTemplate = $ezFormatTemplate.Replace('# Write-TypeView', $Type -join [Environment]::NewLine)
        }
        if ($Format) {
            $ezFormatTemplate = $ezFormatTemplate.Replace('# Write-FormatView', $Format -join [Environment]::NewLine)
        }

        return $ezFormatTemplate
    }
}
