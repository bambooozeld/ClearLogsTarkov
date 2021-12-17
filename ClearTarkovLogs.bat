@echo off
echo Make sure you set your default path to logs correct!
timeout 2 /nobreak > nul
set "default=D:\Games\EFT\Logs"
echo Starting...
timeout 2 /nobreak>nul
:retry
set /p LogsDirectory=Please input your Logs Directory (Default: %default% (Change in file)):
if "%LogsDirectory%"=="" set "LogsDirectory=%default%"
if NOT EXIST "%LogsDirectory%" (
    echo Directory not valid, please retry
    goto :retry
)
pushd "%LogsDirectory%"
set curdir=%cd:~-4%
if %curdir% == Logs goto :Working
goto :retry
:Working
echo "%cd%" is going to be deleted in 5 Seconds...
timeout 5 /nobreak > nul 
for /d %%d in (*) do rd "%%d" /s /q > nul
echo Done! Closing in 5 Seconds...
timeout  5 /nobreak > nul
EXIT
