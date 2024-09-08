Set objSWbemServices = GetObject("winmgmts:\\.\root\cimv2")
Set colItem = objSWbemServices.ExecQuery("SELECT * FROM Win32_Processor")

For Each obj In colItem
   WScript.Echo "name " & obj.name
Next 
