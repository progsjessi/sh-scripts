@echo off
echo ================================
echo    SYSTEM INFORMATION TOOL
echo ================================
echo.
echo Gathering system information...
echo -------------------------------
systeminfo
echo.
echo Network Configuration:
echo -------------------------------
ipconfig /all
echo.
echo Routing Table:
echo -------------------------------
route print
echo.
echo Active Network Connections:
echo -------------------------------
netstat -ano
echo.
pause
