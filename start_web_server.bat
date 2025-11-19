@echo off
REM Face Recognition Attendance System - Web Server Startup Script (Windows)

echo ==========================================
echo Face Recognition Attendance System
echo Web Interface Startup
echo ==========================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo Error: Python is not installed.
    echo Please install Python 3.8 or higher.
    pause
    exit /b 1
)

echo [OK] Python found
echo.

REM Check if requirements are installed
echo Checking dependencies...
python -c "import flask" >nul 2>&1
if errorlevel 1 (
    echo Installing Flask dependencies...
    pip install -r requirements_web.txt
) else (
    echo [OK] Dependencies already installed
)

REM Create necessary directories
echo.
echo Setting up directories...
if not exist "dataset" mkdir dataset
if not exist "models" mkdir models
if not exist "static\css" mkdir static\css
if not exist "static\js" mkdir static\js
if not exist "templates" mkdir templates

echo [OK] Directory structure created

REM Start the Flask server
echo.
echo ==========================================
echo Starting Flask Web Server...
echo ==========================================
echo.
echo Access the application at:
echo http://localhost:5000
echo.
echo Press Ctrl+C to stop the server
echo.

python app.py
pause
