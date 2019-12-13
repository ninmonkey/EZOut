﻿@{
    ModuleToProcess = 'EZOut.psm1'
    ModuleVersion = '1.5'
    GUID = 'cef786f0-8a0b-4a5d-a2c6-b433095354cd'
    Author = 'James Brundage'
    CompanyName = 'Start-Automating'
    Copyright = '2011'
    Description = 'Taking the Fight out of PowerShell Formatting'
    FunctionsToExport =
        'Add-FormatData', 'Clear-FormatData', 'Out-FormatData', 'Remove-FormatData',
        'Add-TypeData', 'Clear-TypeData', 'Out-TypeData', 'Remove-TypeData','Import-FormatView',
        'Write-FormatView','Write-FormatCustomView', 'Write-FormatTableView',
        'Write-FormatTreeView','Write-FormatWideView', 'Write-FormatListView', 'Write-FormatViewExpression',
        'Write-TypeView','ConvertTo-PropertySet','Write-PropertySet',
        'Get-FormatFile', 'Find-FormatView', 'Get-PropertySet', 'Write-EZFormatFile'
    AliasesToExport = 'Write-CustomAction'
    FormatsToProcess = 'EZOut.format.ps1xml'
    PrivateData = @{
        Colors = @{
            Xml = @{
                AttributeName = '#fafa00'
                AttributeValue = '#00bfff'
                Punctuation  = '#a9a9a9'
                Tag = '#00ffff'
                Element = '#00af00'
                InnerText = '#8bda8b'
            }
        }
        PSData = @{
            Tags = '.ps1xml', 'Format','Output','Types', 'Colorized'
        }
    }
}
