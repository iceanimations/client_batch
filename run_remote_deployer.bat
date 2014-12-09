@echo off

for /f "tokens=1* delims= " %%a in ('date/t') do set cdate=%%b
for /f "tokens=1,2 eol=/ delims=/ " %%a in ('date/t') do set mm=%%b
for /f "tokens=1,2 delims=/ eol=/" %%a in ('echo %cdate%') do set dd=%%b
for /f "tokens=2,3 delims=/ " %%a in ('echo %cdate%') do set yyyy=%%b
for /f "tokens=1,2* delims=: " %%a in ('time /t') do (
    set hr=%%a
    set mn=%%b
    set pm=%%c
)

set datestr=%yyyy%%mm%%dd%
set timestr=%pm%%hr%%mn%

REM set user=%USERDOMAIN%\%USERNAME%
REM echo ENTER PASSWORD FOR %user%:
REM set /p password=

SETLOCAL
set logpath=%~dp0logs\
set logfile=%logpath%remote_deployer.%datestr%%timestr%.log

echo =========================================================
echo USER:%USERDOMAIN%\%USERNAME% PC:%COMPUTERNAME%
date /t
time /t
echo =========================================================

echo ========================================================= >> %logfile%
echo USER:%USERDOMAIN%\%USERNAME% PC:%COMPUTERNAME% >> %logfile%
date /t >> %logfile%
time /t >> %logfile%
echo =========================================================>> %logfile%

call remote_deployer.bat >> %logfile% 2>&1

