dim code
set fso = createObject("Scripting.fileSystemObject")
set fl  = fso.openTextFile("string.vbs", 1)
code = fl.readAll()
fl.close
executeGlobal code

show