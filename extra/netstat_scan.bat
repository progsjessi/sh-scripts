netstat_scan.bat@echo off
echo ================================
echo  ACTIVE NETWORK CONNECTIONS
echo ================================
echo.
netstat -an | find "ESTABLISHED"
echo.
pause
