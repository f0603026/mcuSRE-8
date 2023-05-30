@echo off
rem 如果沒輸入檔名直接離開
if "%1"=="" (
   echo 'vmcreate vm'
   goto :eof
)
rem 如果虛擬機已存在，刪除它
if exist %1\ (
 rd /S/Q %1\

)
rem 建立新的資料夾
mkdir %1\ > nul

rem 將模板機放入建立的資料夾
xcopy iac001\ %1\ /E /Y  > nul

rem 輸出虛擬機建立結果
echo "%1 vm is create"

rem 虛擬機更改複製的模板機名稱及硬碟檔案等相關檔案
powershell -Command "(gc .\%1\iac001.vmx) -replace 'displayName = \"iac001\"','displayName = \"%1\"' -replace 'scsi0:0.fileName = \"iac001.vmdk\"','scsi0:0.fileName = \"%1.vmdk\"' -replace 'nvram = \"iac001.nvram\"','nvram = \"%1.nvram\"' -replace 'vmxstats.filename = \"iac001.scoreboard\"','vmxstats.filename = \"%1.scoreboard\"' -replace 'extendedConfigFile = \"iac001.vmxf\"','extendedConfigFile = \"%1.vmxf\"'| Out-File -Encoding "UTF8" vm.temp"

rem 移除舊的設定檔
del .\%1\iac001.vmx > nul

rem 將舊硬碟檔更名
move .\%1\iac001.vmdk .\%1\%1.vmdk >nul

rem 將新的設定檔移入
copy /Y "./vm.temp" ".\%1\%1.vmx" >nul

rem 將暫存設定檔刪除
del /Q vm.temp
