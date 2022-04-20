REM log.csv
REM 10:00,Aserver,ERR001,Dbconnectio...
REM 10:01,Aserver,ERR002,DbUser...

@echo off
setLocal EnableDelayedExpansion
FOR /F %%x in (log.csv) DO ( 
	echo %%x
	for /f "tokens=1,2,3,4 delims=," %%a in ("%%x") DO (
		set fn=%%a&set ss=%%b&set to=%%c&set of=%%d		
		echo !fn! !ss! !to! !of!
	)
)
endlocal
