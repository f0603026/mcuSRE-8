@echo off


:loop

 set /p IP=please input scp IP 
 scp haha.bat bigred@120.96.143.%IP%:%USERPROFILE%\Documents
 echo IP:%IP% %USERPROFILE% haha.bat OK
 ssh bigred@120.96.143.%IP% %USERPROFILE%\Documents\haha.bat 

goto:loop

