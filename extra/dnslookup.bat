@echo off
echo ===============================
echo         DNS LOOKUP TOOL
echo ===============================
set /p domain="Enter the domain (e.g., example.com): "
echo.
nslookup %domain%
echo.
pause
