@echo off
setlocal

:: Check if a file path is provided
if "%~1"=="" (
    echo Usage: %0 path\to\tvpaint\file.tvp
    exit /b 1
)

:: Set the TVPaint executable path
set TVPAINT_EXEC="C:\Program Files\TVPaint Developpement\TVPaint Animation 11.7.1 Pro (64bits) (STD)\TVPaint Animation 11.7.1 Pro (64bits) (STD).exe"

:: Check if the TVPaint file exists
if exist "%~1" (
    start "" %TVPAINT_EXEC% "%~1"
) else (
    echo File does not exist: %~1
)

endlocal
