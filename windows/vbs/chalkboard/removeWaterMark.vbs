main 
sub main
	set shell = createObject("WScript.Shell")
	if existWaterMark(shell) then
		removeWaterMark(shell)
		if askForReboot() then 			
			rebootSystem shell 
		end if
	end if
end sub

function existWaterMark(shell)
	set exec = shell.exec("reg query ""hkcu\control panel\desktop"" /v  PaintDesktopVersion")
	stdo = exec.stdOut.readAll()
	strcount = inStr(1, stdo, "0x0", vbTextCompare)
	if (strcount = 0) then 
		existWaterMark = true
	else
		existWaterMark = false
	end if
end function

function askForReboot() 	
	yes = 6
	res = msgBox("It seems that there is a watermark because of an update. It was removed, but changes only applys after reboot. Would you like to restart now?", 36 + 256, "Watermark")
	if (res = yes) then
		askForReboot = true
	end if
end function

sub rebootSystem(shell)
	shell.run "cmd.exe /k echo Restarting in 5 seconds ... & echo [press CONTROL + C to ABOUT] & timeout /t 5 1>nul && shutdown /r /f ", 1, false
end sub

sub removeWaterMark (shell)
	shell.run "reg add ""hkcu\control panel\desktop"" /v  PaintDesktopVersion /t REG_DWORD /d 0 /f", 1, true
end sub