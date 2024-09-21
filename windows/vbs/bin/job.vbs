set args = WScript.Arguments
cmmd = args(0)
set shell = createObject("WScript.shell")

shell.run cmmd, 0, false