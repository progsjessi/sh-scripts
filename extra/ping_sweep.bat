@echo off
setlocal EnableDelayedExpansion

echo ================================
echo         PING SWEEP TOOL
echo ================================
echo.
echo Enter the first three octets of your target network (e.g., 192.168.1):
set /p network=
echo.
echo Enter the starting value for the last octet:
set /p start=
echo Enter the ending value for the last octet:
set /p end=
echo.
echo Scanning network %network%.%start% to %network%.%end% ...
echo.

for /L %%i in (%start%,1,%end%) do (
    set ip=%network%.%%i
    <nul ping -n 1 -w 500 !ip! | find "TTL=" >nul
    if !errorlevel! == 0 (
        echo [ACTIVE] !ip!
    ) else (
        echo [NO RESPONSE] !ip!
    )
)
echo.
pause
