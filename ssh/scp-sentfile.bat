@echo off

set /p name="please input scp file Name: "

for /F "tokens=4 delims=." %%c in (iplist.txt) do (
	:: echo %%c
	scp "%name%" bigred@120.96.143.%%c:C:\Users\rbean\
	if ERRORLEVEL == 0 ( 
	echo %%c sent OK )
pause
)


