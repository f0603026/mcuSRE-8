@echo off

set /p name="please input scp file Name: "

for /F "tokens=4 delims=." %%c in (iplist.txt) do (
	:: echo %%c
	ssh bigred@120.96.143.%%c del /Q C:\Users\rbean\ "%name%"
	if ERRORLEVEL == 0 ( 
	echo %%c del OK )
pause
)

