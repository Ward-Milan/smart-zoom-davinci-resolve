@echo off
REM ==============================================================================
REM Smart Zoom & Zoom Generator - Script d'installation automatique Windows
REM ==============================================================================

echo ======================================================
echo   Installation de Smart Zoom & Zoom Generator (Windows)
echo ======================================================

set "RESOLVE_DIR=%APPDATA%\Blackmagic Design\DaVinci Resolve\Support\Fusion"
set "FUSES_DIR=%RESOLVE_DIR%\Fuses"
set "TEMPLATES_DIR=%RESOLVE_DIR%\Templates\Edit\Effects\Smart Zoom"
set "SCRIPT_DIR=%~dp0"

echo Repertoire Resolve : %RESOLVE_DIR%

if not exist "%FUSES_DIR%" mkdir "%FUSES_DIR%"
if not exist "%TEMPLATES_DIR%" mkdir "%TEMPLATES_DIR%"

echo Installation du moteur Fuse...
copy /Y "%SCRIPT_DIR%src\Fuses\SmartZoom.fuse" "%FUSES_DIR%\SmartZoom.fuse"

echo Installation des templates d'effets...
xcopy /E /I /Y "%SCRIPT_DIR%src\Templates\Edit\Effects\Smart Zoom\*" "%TEMPLATES_DIR%\"

echo ======================================================
echo   Installation terminee avec succes !
echo ======================================================
echo Ouvrez ou redemarrez DaVinci Resolve.
echo Page Montage -^> Boite a outils -^> Effets -^> Smart Zoom.
pause
