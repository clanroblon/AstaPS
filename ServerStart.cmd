@echo off
setlocal
cd /d "%~dp0"

title AstaPS Server

echo ============================================================
echo  AstaPS - Genshin Private Server
echo ============================================================
echo.

set "JAVA=C:\Program Files\Zulu\zulu-21\bin\java.exe"

if not exist "%JAVA%" (
    echo ERROR: Java 21 was not found:
    echo %JAVA%
    echo.
    pause
    exit /b 1
)

set "JAR="

for /f "delims=" %%F in ('dir /b /a-d /o-d "grasscutter-*.jar" 2^>nul') do (
    if not defined JAR set "JAR=%%F"
)

if not defined JAR (
    if exist "grasscutter.jar" set "JAR=grasscutter.jar"
)

if not defined JAR (
    echo ERROR: No AstaPS grasscutter JAR was found.
    echo.
    pause
    exit /b 1
)

echo Java:
"%JAVA%" -version
echo.

echo Server JAR:
echo %JAR%
echo.

echo Database:
echo astaps
echo.

echo Starting AstaPS...
echo ============================================================
echo.

"%JAVA%" -jar "%JAR%"

echo.
echo ============================================================
echo  AstaPS has stopped.
echo ============================================================
pause
