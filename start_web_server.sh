#!/bin/bash

# Face Recognition Attendance System - Web Server Startup Script

echo "=========================================="
echo "Face Recognition Attendance System"
echo "Web Interface Startup"
echo "=========================================="
echo ""

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "Error: Python 3 is not installed."
    echo "Please install Python 3.8 or higher."
    exit 1
fi

echo "✓ Python 3 found: $(python3 --version)"

# Check if requirements are installed
echo ""
echo "Checking dependencies..."

if ! python3 -c "import flask" &> /dev/null; then
    echo "Installing Flask dependencies..."
    pip install -r requirements_web.txt
else
    echo "✓ Dependencies already installed"
fi

# Create necessary directories
echo ""
echo "Setting up directories..."
mkdir -p dataset models static/css static/js templates

echo "✓ Directory structure created"

# Start the Flask server
echo ""
echo "=========================================="
echo "Starting Flask Web Server..."
echo "=========================================="
echo ""
echo "Access the application at:"
echo "👉 http://localhost:5000"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""

python3 app.py
