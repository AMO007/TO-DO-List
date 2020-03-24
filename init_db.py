# Init database

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

from db import Base, TodoItem

engine = create_engine("sqlite:///tasks.db", echo=True)
Base.metadata.create_all(engine)

Session = sessionmaker(bind=engine)
s = Session()

for desc in ("Eat", "Sleep", "Python", "Hello world!"):
    auth = "Savva"
    dt= "2020-03-20"
    t = TodoItem(desc, auth, dt)
    s.add(t)

s.commit()





