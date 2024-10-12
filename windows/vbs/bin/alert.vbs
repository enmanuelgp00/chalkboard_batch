set args = WScript.Arguments
rem Set objShell = CreateObject("Wscript.Shell")
rem objShell.Run "powershell -c (New-Object Media.SoundPlayer 'C:\Windows\Media\Windows Background.wav').PlaySync();", 0, false
msgbox args(0), 48, "Alert"