
Set shell = createObject("WScript.Shell")
nl = vbCrLf
min = InputBox( nl & "    Do you want me to stay awake?" & nl & "    For how long?", "Stay awake?", "minutes")

Function desableTurnOff()
   shell.Run "powercfg.exe /change standby-timeout-ac 0", 0, false
   shell.Run "powercfg.exe /change hibernate-timeout-ac 0", 0, false
End Function

Function enableTurnOff()
   shell.Run "powercfg.exe /change standby-timeout-ac 30", 0, false
   shell.Run "powercfg.exe /change hibernate-timeout-ac 30", 0, false
End Function

Function millSecFrom(min)
   millSecFrom = min*60000
End Function

'Main
desableTurnOff()
WScript.Sleep millSecFrom(min)
enableTurnOff()
WScript.Echo "I'm lazy again" 
