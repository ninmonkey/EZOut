function Write-EZFormatFile
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
$formatting = @(
    # Write-FormatView
    Join-Path $myRoot Formatting | Get-ChildItem | Import-FormatView -FilePath {$_}
    Join-Path $myRoot Views | Get-ChildItem | Import-FormatView -FilePath {$_}
)
if ($formatting) {
    $myFormatFile = Join-Path $myRoot "$myModuleName.format.ps1xml"
    $formatting | Out-FormatData | Set-Content $myFormatFile -Encoding UTF8
}
$types = @(
    # Write-TypeView
)

if ($types) {
    $myTypesFile = Join-Path $myRoot "$myModuleName.types.ps1xml"
    $types | Out-TypeData | Set-Content $myTypesFile -Encoding UTF8
}
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
