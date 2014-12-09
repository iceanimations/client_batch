@echo off

set username=%1
echo %username%

if not "%username%"=="" (
    set password=%2
    if "%password%" == "" (
        echo ENTER PASSWORD for %username%:
        set /p password=
    )
)

set psexec=%~dp0psexec.exe
set _cmd=net view

FOR /F %%Y IN ('%_cmd% ^|findstr "\\"') do call :deployit %%Y
GOTO :end

:deployit
    echo.
    echo.
    echo ===========
    echo %1:
    echo ===========
    setlocal
    REM Add exceptions here
    if "%1"=="\\NAS" (set res=1)
    if "%1"=="\\NASX" (set res=1)
    if "%1"=="\\NASX2" (set res=1)
    if "%1"=="\\VNASX" (set res=1)
    if "%1"=="\\VNAS" (set res=1)
    if DEFINED res (
        echo not doing anything in %1
        echo ================================================================
        GOTO :eof
    )
    if not "%username%"=="" (
        echo %psexec% %1 -u %username% -c .\_fsutil.bat
        %psexec% %1 -u %username% -p %password% -c .\_fsutil.bat
        echo.
        echo %psexec% %1 -c .\_deploy_menus.bat
        %psexec% %1 -c .\_deploy_menus.bat
    )
    if "%username%"=="" (
        echo %psexec% %1 -c .\_fsutil.bat
        %psexec% %1 -c .\_fsutil.bat
        echo.
        echo %psexec% %1 -c .\_deploy_menus.bat
        %psexec% %1 -c .\_deploy_menus.bat
    )
    echo.
    echo ================================================================
    GOTO :eof
:end

echo DONE
:eof
