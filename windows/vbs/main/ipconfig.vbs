Set shell = createObject("WScript.Shell")
Set objExec = shell.Exec("ipconfig /all")

enter = vbCrLf
line = ""

Do While Not objExec.StdOut.AtEndOfStream
  line = line & objExec.StdOut.Readline() & enter
Loop

WScript.Echo line


