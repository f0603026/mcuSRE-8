@echo off
rem 設定 vmrun 環境變數
set PATH=%PATH%"C:\Program Files (x86)\VMware\VMware Player\";

dir /ad
set /p ans="Which vm do you want open?"

if ans==""\ (
  echo 'vmstart vm'
  goto :eof
)

if exist %ans%\ (
	vmrun start "C:\Users\bigred\vm\%ans%\%ans%.vmx"

	echo "%ans% is poweron"
)
echo "vm - %ans% : is poweron" >> on.tmp
