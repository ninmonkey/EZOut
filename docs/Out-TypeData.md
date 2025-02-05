Out-TypeData
------------




### Synopsis
Takes a series of type views and format actions and outputs a type data XML



---


### Description

Takes a series of type views and format actions and outputs a type data XML



---


### Examples
Create a quick view for any XML element.
Piping it into Out-FormatData will make one or more format views into a full format XML file
Piping the output of that into Add-FormatData will create a temporary module to hold the formatting data
There's also a Remove-FormatData and

```PowerShell
Write-FormatView -TypeName "System.Xml.XmlNode" -Wrap -Property "Xml" -VirtualProperty @{
    "Xml" = {
        $strWrite = New-Object IO.StringWriter
        ([xml]$_.Outerxml).Save($strWrite)
        "$strWrite"
    }
} |
    Out-FormatData
```


---


### Parameters
#### **TypeXml**

The Format XML Document.  The XML document can be supplied directly,
but it's easier to use Write-FormatView to create it






|Type           |Required|Position|PipelineInput |
|---------------|--------|--------|--------------|
|`[XmlDocument]`|true    |1       |true (ByValue)|



#### **OutputPath**

The output path.
This can be a string or a dictionary.
If it is a dictionary, the keys must a be a `[string]` or `[regex]` defining a pattern, and the value will be the path.






|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[PSObject]`|false   |2       |false        |





---


### Syntax
```PowerShell
Out-TypeData [-TypeXml] <XmlDocument> [[-OutputPath] <PSObject>] [<CommonParameters>]
```
