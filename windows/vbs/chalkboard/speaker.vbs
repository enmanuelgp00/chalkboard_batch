Set speech = CreateObject("sapi.spvoice")
'speech.Speak "What do you want me to say?"
speak = InputBox("What do you want me to say?", "") '(texto, titulo, default input)
speech.Speak speak