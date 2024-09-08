Dim output

Set objShell = CreateObject("WScript.Shell")

Set objWMIServices = GetObject("winmgmts:\\.\root\cimv2")
Set colItems = objWMIServices.ExecQuery("SELECT * FROM Win32_PointingDevice")

For Each obj in colItems 
   For Each prop in obj.Properties_
      output = output & prop.Name & " : " & prop.Value & vbCrLf
   Next
Next

msg output

Sub msg(s)
   WScript.Echo s
End sub

