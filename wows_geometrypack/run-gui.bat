@echo off
WHERE powershell >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo ERROR: powershell not found.
    echo You can install it manually or use run-text.bat
    pause
    exit 1
)

powershell -File gui-impl.ps1
