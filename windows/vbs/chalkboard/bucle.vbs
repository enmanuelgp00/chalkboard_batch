Set ws = CreateObject("WScript.Shell")

Do
  WScript.Sleep 300
  ws.SendKeys "{c}"
Loop Until v=1
