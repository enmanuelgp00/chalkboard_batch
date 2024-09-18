set args = WScript.Arguments
set shell = createObject("WScript.Shell")
set exec = shell.exec("cmd.exe /c tasklist /fi ""imagename eq cmd.exe"" ")
output = exec.stdOut.readAll
msgbox output 
