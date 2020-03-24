from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String, Boolean

Base = declarative_base()

class TodoItem(Base):
    __tablename__ = "tasks"

    tsk_id = Column(Integer, primary_key=True)
    description = Column(String(255))
    author = Column(String(255))
    dt = Column(String(255))
    is_completed = Column(Boolean, default = False)

    def __init__ (self, description, author, dt):
        self.description = description
        self.author = author
        self.dt = dt