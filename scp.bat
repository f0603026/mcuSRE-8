@echo off


:loop
set /p ip="IP? "

scp C:\Users\bigred\.ssh\id_ed25519.pub bigred@120.96.143.%ip%:%USERPROFILE%\.ssh\authorized_keys


scp C:\Users\bigred\.ssh\id_ed25519.pub bigred@120.96.143.%ip%:C:\Users\rbean\.ssh\authorized_keys



scp C:\Users\bigred\.ssh\id_ed25519.pub bigred@120.96.143.%ip%:C:\ProgramData\ssh\administrators_authorized_keys


goto loop

:: !QAZ2wsx  
::exit