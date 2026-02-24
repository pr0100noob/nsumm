@echo off
title nsum.ru server
echo.
echo  ================================
echo   nsum.ru - zapusk servera
echo  ================================
echo.

python --version >nul 2>&1
if %errorlevel% == 0 (
    echo  [OK] Python naiden
    goto START
)

py --version >nul 2>&1
if %errorlevel% == 0 (
    echo  [OK] Python (py) naiden
    goto START_PY
)

echo  [ERR] Python ne naiden!
echo  Ustanovi s https://python.org
pause
exit

:START
echo.
echo  Server: http://localhost:8080
echo.
ipconfig | findstr /i "IPv4"
echo.
echo  ^ - Otkroj etot IP na telefone: http://[IP]:8080
echo.
echo  Ctrl+C - ostanovit
echo.
python -m http.server 8080
pause
exit

:START_PY
echo.
echo  Server: http://localhost:8080
echo.
ipconfig | findstr /i "IPv4"
echo.
echo  ^ - Otkroj etot IP na telefone: http://[IP]:8080
echo.
echo  Ctrl+C - ostanovit
echo.
py -m http.server 8080
pause
exit
