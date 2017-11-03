@echo off
Title Collecting Information
color 2
cls
if exist log.txt then del log.txt
set LogFile="log.txt"
echo.Begin>%LogFile%
net use x: \\192.168.1.12\C$
psexec \\192.168.1.12 /c TS_VM.bat %LogFile%
copy x:\Information.txt %~dp0
copy /b %LogFile%+Information.txt %LogFile%
del x:\Information.txt
net use x: /delete /y

net use x: \\192.168.1.13\C$
psexec \\192.168.1.13 /c TS_VM.bat %LogFile%
copy x:\Information.txt %~dp0
copy /b %LogFile%+Information.txt %LogFile%
del x:\Information.txt
net use x: /delete /y

net use x: \\192.168.1.14\C$
psexec \\192.168.1.14 /c TS_VM.bat %LogFile%
copy x:\Information.txt %~dp0
copy /b %LogFile%+Information.txt %LogFile%
del x:\Information.txt
net use x: /delete /y

net use x: \\192.168.1.16\C$
psexec \\192.168.1.16 /c TS_VM.bat %LogFile%
copy x:\Information.txt %~dp0
copy /b %LogFile%+Information.txt %LogFile%
del x:\Information.txt
net use x: /delete /y

net use x: \\192.168.1.23\C$
psexec \\192.168.1.23 /c TS_VM.bat %LogFile%
copy x:\Information.txt %~dp0
copy /b %LogFile%+Information.txt %LogFile%
del x:\Information.txt
net use x: /delete /y

net use x: \\192.168.1.180\C$
psexec \\192.168.1.180 /c TM_HMI.bat %LogFile%
copy x:\Information.txt %~dp0
copy /b %LogFile%+Information.txt %LogFile%
del x:\Information.txt
net use x: /delete /y

net use x: \\192.168.1.181\C$
Rpsexec \\192.168.1.181 /c TM_HMI.bat %LogFile%
copy x:\Information.txt %~dp0
copy /b %LogFile%+Information.txt %LogFile%
del x:\Information.txt
net use x: /delete /y

net use x: \\192.168.1.5\C$
psexec \\192.168.1.5 /c TS_HMI.bat %LogFile%
copy x:\Information.txt %~dp0
copy /b %LogFile%+Information.txt %LogFile%
del x:\Information.txt
net use x: /delete /y

net use x: \\192.168.1.20\C$
psexec \\192.168.1.20 /c TS_VM.bat %LogFile%
copy x:\Information.txt %~dp0
copy /b %LogFile%+Information.txt %LogFile%
del x:\Information.txt
net use x: /delete /y

REM del Information.txt

Title Finished!
pause
