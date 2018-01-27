@echo off
set LogFile=c:\Information.txt
Title "%computername% : Synchronizing Times"

cd c:\progra~1\vmware\vmware~1\
vmwaretoolboxcmd.exe timesync disable
vmwaretoolboxcmd.exe timesync enable


for /f "tokens=3" %%a in ('reg query hkey_users\.default /v imageversion ^|findstr /ri "REG_SZ"') do (set image=%%a)
for /f "tokens=4" %%a in ('cscript slmgr.vbs /xpr ^|findstr /r "machine"') do (set activation=%%a)
echo.%date% %time% %activation% %image% %computername%>%LogFile%
