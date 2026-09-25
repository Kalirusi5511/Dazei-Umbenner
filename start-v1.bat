@echo off
setlocal enabledelayedexpansion
title Datei umbenennen
color 0A

echo ================================================
echo   Datei-Umbenenner - Multi-Ordner-Suche
echo ================================================
echo.
set /p "DATEI=Dateiname (z.B. test.bat oder config.json): "

if "%DATEI%"=="" (
    echo Kein Dateiname eingegeben!
    pause
    exit /b
)

REM --- Echte Pfade über Registry auslesen ---
for /f "tokens=2*" %%A in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Desktop 2^>nul') do set "DESKTOP=%%B"
for /f "tokens=2*" %%A in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Pictures" 2^>nul') do set "PICTURES=%%B"
for /f "tokens=2*" %%A in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Personal" 2^>nul') do set "DOCUMENTS=%%B"
for /f "tokens=2*" %%A in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" 2^>nul') do set "DOWNLOADS=%%B"

REM --- Umgebungsvariablen auflösen (%USERPROFILE% etc.) ---
call set "DESKTOP=%DESKTOP%"
call set "PICTURES=%PICTURES%"
call set "DOCUMENTS=%DOCUMENTS%"
call set "DOWNLOADS=%DOWNLOADS%"

echo.
echo Suche nach "%DATEI%" in:
echo   - Aktueller Ordner: %CD%
echo   - Desktop: !DESKTOP!
echo   - Bilder: !PICTURES!
echo   - Dokumente: !DOCUMENTS!
echo   - Downloads: !DOWNLOADS!
echo.
echo Bitte warten...
echo.

set "GEFUNDEN="
set "GEFUNDENER_PFAD="

for %%O in (
    "."
    "!DESKTOP!"
    "!PICTURES!"
    "!DOCUMENTS!"
    "!DOWNLOADS!"
) do (
    if exist "%%~O\%DATEI%" (
        set "GEFUNDEN=1"
        set "GEFUNDENER_PFAD=%%~O\%DATEI%"
        echo GEFUNDEN: "%%~O\%DATEI%"
    )
)

if not defined GEFUNDEN (
    echo.
    echo FEHLER: "%DATEI%" wurde nirgends gefunden!
    echo.
    echo Tipp: Pruefe, ob die Datei wirklich so heisst.
    echo Gross-/Kleinschreibung ist egal, aber der Name muss exakt sein.
    pause
    exit /b
)

echo.
set /p "NEU=Neuer Name (z.B. neu.bat): "

if "%NEU%"=="" (
    echo Kein neuer Name eingegeben!
    pause
    exit /b
)

ren "!GEFUNDENER_PFAD!" "%NEU%"
echo.
echo Fertig: "%DATEI%" -^> "%NEU%"
echo Pfad: !GEFUNDENER_PFAD!
pause