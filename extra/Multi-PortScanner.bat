@echo off
setlocal EnableDelayedExpansion

echo ===============================
echo      Multi PORT SCANNER
echo ===============================
set /p target="Enter target IP or hostname: "
set /p startport="Enter starting port: "
set /p endport="Enter ending port: "

:: Create a logfile with target and port range in the name
set logfile=port_scan_%target%_%startport%-%endport%.log

echo [*] Starting port scan on %target% from port %startport% to %endport%.
echo Scan started at %date% %time% > "%logfile%"

for /L %%p in (%startport%,1,%endport%) do (
    echo [*] Checking port %%p...
    powershell -noprofile -command "try { \$socket = New-Object System.Net.Sockets.TcpClient; \$socket.Connect('%target%', %%p); if(\$socket.Connected){Write-Host 'Port %%p OPEN'}; \$socket.Close() } catch { }" >> "%logfile%"
)

echo Scan completed at %date% %time% >> "%logfile%"
echo.
echo [*] Port scan complete. Results saved in %logfile%.
pause
