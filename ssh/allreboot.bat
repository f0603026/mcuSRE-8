@echo off

:: reboot all student computer

for /F "tokens=4 delims=." %%c in (reboot.txt) do (
	powershell -command "ssh bigred@120.96.143.%%c 'shutdown.exe /r /t 0'")


