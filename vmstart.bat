rem 包含此行關閉運行過程
@echo off

rem 設定環境變數
set PATH=%PATH%;"C:\Program Files (x86)\VMware\VMware Player\"

rem 列出可開啟虛擬機輸出虛擬機選單
dir /ad > totalvm.txt
rem 使用 for 迴圈解析出檔案/資料夾欄位
for /f "tokens=5,* delims= " %%c in (totalvm.txt) do echo %%c

rem 讀取輸入值
set /p ans="please input vm name:"


rem 刪除剛剛所建立的選單
del /Q /S totalvm.txt > nul

rem 如果輸入的選單存在，使用 vmrum 開啟虛擬機
if exist %ans% (
	vmrun start %cd%\%ans%\%ans%.vmx
	echo %ans% is online
)

rem 虛擬機開完後會抓虛擬機的 ip
if exist %ans% (
  echo catching the %ans% ip......
  timeout /t 50 > nul
  vmrun getguestipaddress %cd%\%ans%\%ans%.vmx > ip.txt
)

rem 清理畫面
cls

rem 顯示虛擬機 ip 
for /f "tokens=1-4,* delims=." %%a in (ip.txt) do echo %ans%VM ip is %%a.%%b.%%c.%%d

rem 將開機後的機器與 ip輸入至暫存檔案
for /f "tokens=1-4,* delims=." %%a in (ip.txt) do echo %ans%VM ip is %%a.%%b.%%c.%%d > online.tmp

rem 移除剛剛所建立用於抓取 ip 數據的 ip.txt
del /Q /S ip.txt >nul


