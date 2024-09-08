'
' Pone a  hibernar la pc
'
ACEPTAR = 6
set shell = createObject("WScript.Shell")
answer = MsgBox("¿Supender el equipo?", 324, "Hibernar")

if answer = ACEPTAR then
  shell.run "shutdown /h", 0, true
  else 
end if