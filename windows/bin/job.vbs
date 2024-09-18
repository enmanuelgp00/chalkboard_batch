set args = WScript.Arguments
commandNm = args(0)

command = ""
for each value in args
  command = command & " " & value
next

set shell = createObject("WScript.Shell")
shell.run "emulator.exe -avd Medium_Phone_API_29", 0, true
shell.run "tasklist /fi ""imagename eq " & commandNm & ".exe "" >> %userprofile%\jobsIds.tmp", 0, false



