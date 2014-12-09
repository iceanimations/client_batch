@echo off

SETLOCAL
if "%1" == "" set logfile=%TEMP%\deploy_user_setup.%COMPUTERNAME%.log
if not "%1" == "" set logfile=%1\deploy_user_setup.%COMPUTERNAME%.log
echo logfile: %logfile%

if "%COMPUTERNAME"=="\\NAS" (set res=1)
if "%COMPUTERNAME"=="\\NASX" (set res=1)
if "%COMPUTERNAME"=="\\NASX2" (set res=1)
if "%COMPUTERNAME"=="\\VNASX" (set res=1)
if DEFINED res (
    echo not doing anything here %1
    echo ================================================================
    GOTO :end
)

echo. >> %logfile% 2>&1
echo ================================================================ >> %logfile% 2>&1
date /t >> %logfile% 2>&1
time /t >> %logfile% 2>&1
echo USER: %USERDOMAIN%\%USERNAME%  PC: %COMPUTERNAME% >> %logfile% 2>&1

echo. >> %logfile% 2>&1
echo Copying userSetup to various versions of maya >> %logfile% 2>&1

for %%v in ( 2011 2012 2013 2014 2015 ) DO (

    echo. >> %logfile% 2>&1
    echo del /F "c:/Program Files/Autodesk/Maya%%v/scripts/startup/userSetup.mel" >> %logfile% 2>&1
    del /F "c:/Program Files/Autodesk/Maya%%v/scripts/startup/userSetup.mel" >> %logfile% 2>&1

    echo. >> %logfile% 2>&1
    echo del /F "c:/Program Files/Autodesk/Maya%%v/scripts/startup/iceSetup.mel" >> %logfile% 2>&1
    del /F "c:/Program Files/Autodesk/Maya%%v/scripts/startup/iceSetup.mel" >> %logfile% 2>&1

    echo. >> %logfile% 2>&1
    echo mklink "c:/Program Files/Autodesk/Maya%%v/scripts/startup/userSetup.mel" "R:\Pipe_Repo\Users\Hussain\utilities\loader\client\userSetup.mel" >> %logfile% 2>&1
    mklink "c:/Program Files/Autodesk/Maya%%v/scripts/startup/userSetup.mel" "R:\Pipe_Repo\Users\Hussain\utilities\loader\client\userSetup.mel" >> %logfile% 2>&1
)

echo. >> %logfile% 2>&1
echo rmdir /q /s "c:/ProgramData/Microsoft/Windows/Start Menu/Programs/ICE" >> %logfile% 2>&1
rmdir /q /s "c:/ProgramData/Microsoft/Windows/Start Menu/Programs/ICE" >> %logfile% 2>&1

echo. >> %logfile% 2>&1
echo rmdir /q /s "c:/Program Files/ICE" >> %logfile% 2>&1
rmdir /q /s "c:/Program Files/ICE" >> %logfile% 2>&1

rem    mkdir "c:/Program Files/ICE"
rem    xcopy /y /s /e "R:\Pipe_Repo\Users\Qurban\applications" "c:/Program Files/ICE"

echo. >> %logfile% 2>&1
echo rmdir /q /s "c:/Program Files/ICE/src" >> %logfile% 2>&1
rmdir /q /s "c:/Program Files/ICE/src" >> %logfile% 2>&1

echo. >> %logfile% 2>&1
echo Adding ICE Menu to Windows Start Menu >> %logfile% 2>&1
echo mklink /D "c:/ProgramData/Microsoft/Windows/Start Menu/Programs/ICE" "R:/Pipe_Repo/Users/Qurban/applications" >> %logfile% 2>&1
mklink /D "c:/ProgramData/Microsoft/Windows/Start Menu/Programs/ICE" "R:/Pipe_Repo/Users/Qurban/applications" >> %logfile% 2>&1
echo ================================================================ >> %logfile% 2>&1
GOTO :end

:end
echo DONE
