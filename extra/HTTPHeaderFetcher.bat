@echo off
echo ===============================
echo   WEB SERVER FINGERPRINTING
echo ===============================
set /p url="Enter URL (include http:// or https://): "
echo.
echo Fetching HTTP headers from %url%...
curl -I %url%
echo.
pause
