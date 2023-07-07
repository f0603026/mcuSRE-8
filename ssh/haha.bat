@echo off

for /f "tokens=1 delims=;" %%z in ('echo "%PATH%"') do (
  set CN=%%z
 
)

 echo @echo 'shutdown': command not found > "%CN:~1%\shutdown.bat"