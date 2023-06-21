@echo off

:: set p name=please input scp file Name 

for /F "tokens=4 delims=." %%c in (iplist.txt) do (

   powershell -command "scp C:\Users\bigred\.ssh\id_ed25519.pub bigred@120.96.143.%%c:%USERPROFILE%\.ssh\authorized_keys"
   echo %%c %USERPROFILE% authorized_keys OK
   powershell -command "scp C:\Users\bigred\.ssh\id_ed25519.pub bigred@120.96.143.%%c:C:\Users\rbean\.ssh\authorized_keys"
   echo %%c rbean authorized_keys OK
   powershell -command "scp C:\Users\bigred\.ssh\id_ed25519.pub bigred@120.96.143.%%c:C:\ProgramData\ssh\administrators_authorized_keys"
   echo %%c administrators_authorized_keys
)


