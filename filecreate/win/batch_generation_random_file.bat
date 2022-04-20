@ECHO OFF
SETLOCAL EnableDelayedExpansion
SET TAB=    "
FOR /L %%i IN (1 1 %1) DO (
	call:rand 10 200
	SET /A SIZE=!RAND_NUM!
	echo|set /p=!SIZE! !TAB!
	fsutil file createnew Dummy_%%i.tmp !SIZE!
)
goto:EOF
:rand
SET /A RAND_NUM=%RANDOM% * (%2 - %1 + 1) / 32768 + %1
goto:EOF
ENDLOCAL
