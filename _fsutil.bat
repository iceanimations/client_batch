@echo off

REM This script is for enabling the Symlink evaluation on the client side.
REM remote-to-remote (R2R) symlink evalution has to be enabled in order to
REM make actual project data that is spread on different locations, also
REM accessible by client, be available from a single location. TACTIC's
REM constraint. Difficult to setup but seemingly convenient in the long run.
REM add this script to the startup policy.

setlocal
if "%1" == "" set logfile=%TEMP%\fsutil.%COMPUTERNAME%.log
if not "%1" == "" set logfile=%1\fsutil.%COMPUTERNAME%.log
echo logfile: %logfile%

echo. >> %logfile% 2>&1
echo ===================================================== >> %logfile% 2>&1
date /t >> %logfile% 2>&1
time /t >> %logfile% 2>&1
echo USER: %USERDOMAIN%\%USERNAME%  PC: %COMPUTERNAME% >> %logfile% 2>&1

REM disable all first
echo -- Disabling symlink evaluation -- >> %logfile% 2>&1
echo fsutil.exe behavior set SymlinkEvaluation L2L:0 R2R:0 L2R:0 R2L:0 >> %logfile% 2>&1
fsutil.exe behavior set SymlinkEvaluation L2L:0 R2R:0 L2R:0 R2L:0 >> %logfile% 2>&1

REM enable R2R
echo -- Enabling symlink evaluation -- >> %logfile% 2>&1
echo fsutil.exe behavior set SymlinkEvaluation L2L:1 R2R:1 L2R:1 R2L:1 >> %logfile% 2>&1
fsutil.exe behavior set SymlinkEvaluation L2L:1 R2R:1 L2R:1 R2L:1 >> %logfile% 2>&1
