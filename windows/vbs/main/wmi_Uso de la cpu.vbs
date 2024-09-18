Set objSWbemServices = GetObject("winmgmts:\\.\root\cimv2")
Set colItems = objSWbemServices.ExecQuery("SELECT * FROM Win32_PerfFormattedData_PerfOS_Processor")
For Each objItem in colItems
   WScript.Echo objItem.Name & " Porcentaje de tiempo:" & objItem.PercentProcessorTime & "%"
Next