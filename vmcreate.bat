@echo off

if "%1"=="" (
   echo 'vmcreate vm'
   goto :eof
)

if exist %1\ (
 rd /S/Q %1\

)
mkdir %1\ > nul

xcopy iac001\ %1\ /E /Y  > nul

echo "%1 vm is create"

powershell -Command "(gc .\%1\iac001.vmx) -replace 'displayName = \"iac001\"','displayName = \"%1\"' -replace 'scsi0:0.fileName = \"iac001.vmdk\"','scsi0:0.fileName = \"%1.vmdk\"' -replace 'nvram = \"iac001.nvram\"','nvram = \"%1.nvram\"' -replace 'vmxstats.filename = \"iac001.scoreboard\"','vmxstats.filename = \"%1.scoreboard\"' -replace 'extendedConfigFile = \"iac001.vmxf\"','extendedConfigFile = \"%1.vmxf\"'| Out-File -Encoding "UTF8" vm.temp"


del .\%1\iac001.vmx > nul
move .\%1\iac001.vmdk .\%1\%1.vmdk >nul
copy /Y "./vm.temp" ".\%1\%1.vmx" >nul

del /Q vm.temp
