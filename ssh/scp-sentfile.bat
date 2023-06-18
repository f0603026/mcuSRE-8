@echo off

:: 輸入發送檔案名稱
set /p name="please input scp file Name: "

:: 讀取所有電腦 IP 提取後三碼
for /F "tokens=4 delims=." %%c in (iplist.txt) do (
	:: echo %%c
:: scp 檔案到 rbean 家目錄
	scp "%name%" bigred@120.96.143.%%c:C:\Users\rbean\
:: 代碼執行成功 發送 ip + sent ok	
if ERRORLEVEL == 0 ( 
	echo %%c sent OK )
pause
)


