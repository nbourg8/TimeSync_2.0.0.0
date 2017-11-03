@echo off
set LogFile=c:\Information.txt
Title "%computername% : Synchronizing Times"

w32tm.exe /resync
ping 127.0.0.1 -n 3 > nul
w32tm.exe /query /status

for /f "tokens=3" %%a in ('reg query hkey_users\.default /v imageversion ^|findstr /ri "REG_SZ"') do (set image=%%a)
for /f "tokens=4" %%a in ('cscript slmgr.vbs /xpr ^|findstr /r "machine"') do (set activation=%%a)
echo.%computername%,%image%,%activation%,%date%,%time%>%LogFile%
