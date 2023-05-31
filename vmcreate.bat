rem 關閉所有正確的輸出結果
@echo off
rem 輸入建立虛擬機名稱
set /p ans="Pleace input Create VM Name : "

rem 如果沒有輸入字元將會離開程式
if %ans%=="" (
   echo 'Pleace input name'
   goto :eof
)

rem 如果虛擬機已存在將刪除重新建立
if exist %ans%\ (
 rd /S/Q %ans%\

)
rem  提示字元 VM 建立中.....
echo %ans% vm is createing Pleace wait a moment...


rem 創建新的資料夾
mkdir %ans%\ > nul

rem 將模板機塞入新建資料夾
xcopy iac001\ %ans%\ /E /Y  > nul

rem  清除螢幕畫面
cls

rem  輸出虛擬機已建立完成
echo "%ans% vm is create"

rem 動用 cmd 原生功能取代模板機原本名字 改為新建立的名稱
powershell -Command "(gc .\%ans%\iac001.vmx) -replace 'displayName = \"iac001\"','displayName = \"%ans%\"' -replace 'scsi0:0.fileName = \"iac001.vmdk\"','scsi0:0.fileName = \"%ans%.vmdk\"' -replace 'nvram = \"iac001.nvram\"','nvram = \"%ans%.nvram\"' -replace 'vmxstats.filename = \"iac001.scoreboard\"','vmxstats.filename = \"%ans%.scoreboard\"' -replace 'extendedConfigFile = \"iac001.vmxf\"','extendedConfigFile = \"%ans%.vmxf\"'| Out-File -Encoding "UTF8" vm.temp"

rem 刪除舊名稱檔案
del .\%ans%\iac001.vmx > nul

rem 替vmdk 磁碟檔改名
move .\%ans%\iac001.vmdk .\%ans%\%ans%.vmdk >nul

rem 更名後暫存檔放入新建虛擬機內並更名為新的虛擬機名稱
copy /Y "./vm.temp" ".\%ans%\%ans%.vmx" >nul

rem 移除暫存檔
del /Q vm.temp
