#!/bin/bash

set -e

# Get the flag from command line arguments
flag=$1

# Checks if Python3 is installed
if command -v python3 &>/dev/null
then
    echo "Python3 is installed. Starting the application..."
else
    echo "Python3 is not installed. Please install Python3 to run the application."
    exit 1
fi

# Create virtual environment if it doesn't exist
if [ ! -d "venv" ]
then
    echo "Creating virtual environment..."
    python3 -m venv venv
else
    echo "Virtual environment already exists."
fi

# Activate the virtual environment
setup_venv() {
    source venv/bin/activate
}

# Install dependencies from requirements.txt
install_dependencies() {
    if [ -f "requirements.txt" ]
    then
        echo "Installing dependencies from requirements.txt..."
        pip install -q -r requirements.txt

        if command -v pip &>/dev/null
        then
            echo "Dependencies installed successfully."
        else
            echo "Failed to install dependencies. Please check your pip installation."
            exit 1
        fi
    else
        echo "requirements.txt not found. Skipping dependency installation."
        exit 1
    fi
}

# Run the application based on the provided flag
run_app(){
    if [ $flag = "--dev" ]
    then
        echo "Starting the application in development mode..."
        uvicorn app:app --reload
    elif [ -z $flag ] || [ $flag = "--prod" ]
    then
        echo "Starting the application..."
        python3 app.py

    else
        echo "Invalid flag provided. Use --dev for development mode or --prod for production mode."
        exit 1
    fi
}


setup_venv
install_dependencies
run_app $flag