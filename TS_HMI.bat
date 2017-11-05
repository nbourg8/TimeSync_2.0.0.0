@echo off
set LogFile=c:\Information.txt
Title "%computername% : Synchronizing Times"

net stop w32time
net start w32time
w32tm /resync /nowait

for /f "tokens=3" %%a in ('reg query hkey_users\.default /v imageversion ^|findstr /ri "REG_SZ"') do (set image=%%a)
for /f "tokens=4" %%a in ('cscript slmgr.vbs /xpr ^|findstr /r "machine"') do (set activation=%%a)
echo.%computername%,%image%,%activation%,%date%,%time%>%LogFile%
