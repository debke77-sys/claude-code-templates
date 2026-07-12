@echo off
title Zorgplanner
cd /d "%~dp0"

where python >nul 2>nul
if %errorlevel%==0 (
  start "Zorgplanner-server (laat dit venster open staan)" /min python -m http.server 8420
  goto :serverGestart
)
where py >nul 2>nul
if %errorlevel%==0 (
  start "Zorgplanner-server (laat dit venster open staan)" /min py -m http.server 8420
  goto :serverGestart
)

echo Python is niet gevonden op dit systeem.
echo Installeer Python via https://www.python.org/downloads/ (vink bij installatie "Add to PATH" aan) en probeer het daarna opnieuw.
pause
exit /b 1

:serverGestart
timeout /t 2 /nobreak >nul
start "" http://localhost:8420/index.html
echo De Zorgplanner draait nu op http://localhost:8420
echo Er is een apart "Zorgplanner-server" venstertje geopend (geminimaliseerd) - laat dat open staan
echo zolang je de app gebruikt. Het sluiten van dat venstertje stopt de app.
echo.
echo Dit venster mag je gewoon sluiten.
pause
