Write-EZFormatFile
------------------




### Synopsis
Creates a new EZFormat file.



---


### Description

Creates a new EZFormat file.  EZFormat files use EZOut to create format and types files for a module.



---


### Parameters
#### **Format**

Any -FormatView commands.






|Type             |Required|Position|PipelineInput        |
|-----------------|--------|--------|---------------------|
|`[ScriptBlock[]]`|false   |1       |true (ByPropertyName)|



#### **Type**

Any -TypeView commands.






|Type             |Required|Position|PipelineInput        |
|-----------------|--------|--------|---------------------|
|`[ScriptBlock[]]`|false   |2       |true (ByPropertyName)|



#### **ModuleName**

The name of the module.  By default, this will be inferred from the name of the file.






|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |3       |true (ByPropertyName)|Name   |



#### **SourcePath**

The source path.  By default, the script's root.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |4       |true (ByPropertyName)|



#### **DestinationPath**

The destination path.  By default, the script's root.






|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|false   |5       |true (ByPropertyName)|DestPath|



#### **OutputPath**

The output path for the .ezout file.
If no output path is provided, the code will be outputted directly.






|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |6       |true (ByPropertyName)|





---


### Syntax
```PowerShell
Write-EZFormatFile [[-Format] <ScriptBlock[]>] [[-Type] <ScriptBlock[]>] [[-ModuleName] <String>] [[-SourcePath] <String>] [[-DestinationPath] <String>] [[-OutputPath] <String>] [<CommonParameters>]
```
