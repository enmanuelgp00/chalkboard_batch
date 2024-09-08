for /r %i in (%whereToSearch%) do (
	if exist "%i" (
		echo true
	)
)