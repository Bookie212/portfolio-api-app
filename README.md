# Portfolio API

A FastAPI-based portfolio API that serves resume data from a JSON file with separate endpoints for CV, skills, and projects.

## Features

- RESTful API endpoints for resume data
- JSON-based data storage
- Pydantic models for data validation
- Automated local development setup
- Dockerized for easy deployment
- FastAPI automatic interactive documentation

## Project Structure
```
portfolio-api/
├── app.py             
├── models.py          
├── resume.json         
├── requirements.txt    
├── Dockerfile         
├── setup.sh           
└── README.md          
```

## Running Locally

### 1. Clone Repository

If you are setting this up from a git repo:
```bash
git clone git@github.com:Bookie212/portfolio-api-app.git
cd portfolio-api
```

If you have the files directly, ensure all files listed in the "Project Structure" are in your working directory.

### 2. Run the setup script

Make the script executable (first time only):
```bash
chmod +x setup.sh
```

Run in production mode:
```bash
./setup.sh
```

Run in development mode (with auto-reload):
```bash
./setup.sh --dev
```

**What the script does:**
- Checks if Python 3 is installed
- Creates virtual environment if it doesn't exist
- Activates the virtual environment
- Installs dependencies from requirements.txt
- Runs the app based on the flag selected

The application should now be accessible at http://localhost:8000

## Docker Instructions

### 1. Build the Docker image

From the project's root directory (where the Dockerfile is located):
```bash
docker build -t portfolio-api .
```

### 2. Run the Docker container
```bash
docker run -p 8000:8000 portfolio-api
```

The app will be accessible at http://localhost:8000 on your host machine.

## API Endpoints

### GET /cv
Returns complete CV data including all personal information, skills, and projects.

**Response:** Full CV object

### GET /skills
Returns a list of all skills.

**Response:** Array of skill objects

### GET /projects
Returns a list of all projects.

**Response:** Array of project objects

### GET /docs
FastAPI automatically generates interactive API documentation.

**Access at:** http://localhost:8000/docs

## Technologies Used

- **FastAPI** - Modern web framework for building APIs
- **Pydantic** - Data validation using Python type hints
- **Uvicorn** - ASGI server for running the application
- **Docker** - Containerization platform
