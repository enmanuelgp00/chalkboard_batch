set objArgs = WScript.Arguments
set objShell = createObject("Shell.Application")
objShell.ShellExecute objArgs(0), "", "", "runas", 1
