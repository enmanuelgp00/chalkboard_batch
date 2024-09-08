Set arg = WScript.Arguments
Set person = CreateObject("sapi.spvoice")
text = ""
For Each word in arg
   text = text & " " & word
Next

person.speak text

