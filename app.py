import json
from fastapi import FastAPI, HTTPException
from pathlib import Path
from models import Projects, Skills, CV


app = FastAPI()

# Utility function to load CV data from JSON file
def load_cv() -> CV:
    file_path = Path("resume.json")

    if not file_path.exists():
        raise HTTPException(status_code=404, detail="resume.json file not found")

    data = json.loads(file_path.read_text())
    return CV.model_validate(data)

# API Endpoints
@app.get("/")
def read_root():
    return {"message": "Welcome to the CV API"}

@app.get("/cv", response_model=CV)
def get_cv():
    return load_cv()

@app.get("/projects", response_model=list[Projects])
def get_projects():
    cv = load_cv()
    return cv.Projects

@app.get("/skills", response_model=list[Skills])
def get_skills():
    cv = load_cv()
    return cv.Skills

# Run the application
if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="127.0.0.1", port=8000)

