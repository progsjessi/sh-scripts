@echo off
setlocal EnableDelayedExpansion

echo =====================================
echo        DIRECTORY BRUTEFORCER
echo =====================================
set /p url="Enter base URL (include http:// or https://, no trailing slash): "
set /p wordlist="Enter full path to directory wordlist file: "
if not exist "%wordlist%" (
    echo [ERROR] Wordlist file "%wordlist%" not found.
    pause
    exit /b 1
)
set /p output="Enter output filename (e.g., dirs_found.txt): "

:: Create/initialize the output file
echo Directory brute force started at %date% %time% > "%output%"
echo Base URL: %url% >> "%output%"
echo -------------------------------------------------- >> "%output%"
echo.

for /f "usebackq delims=" %%d in ("%wordlist%") do (
    set "dir=%%d"
    :: Remove any surrounding spaces or quotes (if any)
    set "dir=!dir:"=!"
    set "full_url=%url%/!dir!"
    for /f "delims=" %%c in ('curl -s -o nul -w "%%{http_code}" "!full_url!"') do (
        set "code=%%c"
    )
    if "!code!"=="200" (
        echo [FOUND] !full_url! returned HTTP 200
        echo [FOUND] !full_url! - HTTP 200 >> "%output%"
    ) else if "!code!"=="403" (
        echo [FOUND] !full_url! returned HTTP 403 (Forbidden)
        echo [FOUND] !full_url! - HTTP 403 >> "%output%"
    ) else (
        echo [*] !full_url! returned HTTP !code!
    )
)

echo.
echo [*] Directory brute force complete. Results saved in %output%.
pause
