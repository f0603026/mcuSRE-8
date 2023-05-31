rem 結果顯示，包含自己
@echo off

rem 設定環境變數
set PATH=%PATH%;"C:\Program Files (x86)\VMware\VMware Player\"

rem 抓取目前在線上的虛擬機
for /f "tokens=1-3,* delims= " %%a in (online.tmp) do echo %%a %%b %%c

rem 讀取鍵盤輸入值
set /p ans="please input close vm name:"


rem 將輸入值帶入變數進行關機
if exist %ans% (
	vmrun stop %cd%\%ans%\%ans%.vmx
	echo %ans% is poweroff
)

rem　修改線上虛擬機選單
findstr /v "%ans%" "online.tmp" > nowonline.tmp

rem 改好後將暫存檔取代原檔
move nowonline.tmp online.tmp > nul


rem 判斷在線上的虛擬機選單是否為空，如果為空刪除他
for %%d in (online.tmp) do (
    if "%%~zd" equ "0" (
    del /S /Q online.tmp
  ) > nul
)
  
