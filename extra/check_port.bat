@echo off
echo ================================
echo       REMOTE PORT CHECKER
echo ================================
echo.
set /p target=Enter target IP or hostname: 
set /p port=Enter port number: 
echo.
echo Checking port %port% on %target% ...
powershell -command "try { $client = New-Object System.Net.Sockets.TcpClient('%target%', %port%); Write-Host 'Port %port% is open.'; $client.Close(); } catch { Write-Host 'Port %port% is closed or unreachable.' }"
echo.
pause
