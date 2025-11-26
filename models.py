from pydantic import BaseModel
from typing import List, Dict

# Data Models
class Projects(BaseModel):
    Id: int
    Name: str
    Description: str
    Technologies: list[str]
    Duration: str
    Role: str

class Skills(BaseModel):
    Name: str
    Proficiency: str
    Experience: str
    
class CV(BaseModel):
    BasicInfo: List[Dict[str, str]]
    Projects: List[Projects]
    Skills: List[Skills]
