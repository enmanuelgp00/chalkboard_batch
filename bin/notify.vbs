Set paramArgs = WScript.Arguments
title = "Notification"
text = ""

If paramArgs.Count = 2 Then
  title = paramArgs(0)
  text = paramArgs(1)
 Else  
  If paramArgs.Count = 1 Then
    text = paramArgs(0)
  End If 
End If

mMsg text, title 

Function mMsg(txt, tlt)
mMsg = MsgBox(txt, 16, tlt) 'para returnar una valor
End Function