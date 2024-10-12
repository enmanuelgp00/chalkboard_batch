main
sub main ()
	file = checkFile()
	app  = 	"C:\Program Files\Notepad++\notepad++.exe"
	run app, file
end sub

function checkFile()
	set args = WScript.Arguments
	if args.length > 0 then 		
		checkFile = args(0)
	else 
		checkFile = ""
	end if
end function

sub	run (app, file)
	set shell = createObject("WScript.shell")
	shell.run withQuotes(app) & withQuotes(file), 1, false
end sub

function withQuotes(str)
	withQuotes = """" & str & """"
end function