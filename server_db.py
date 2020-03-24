from bottle import route, run, static_file, view, redirect, request
from datetime import datetime as dt
from db import TodoItem
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

# db connection

engine = create_engine("sqlite:///tasks.db")
Session = sessionmaker(bind=engine)
s = Session()

# Route static JS/CSS

@route("/static/<filename:path>")
def send_static(filename):
    return static_file(filename, root="static")

# Route main page

@route("/")
@view("index")
def index():
    tasks = s.query(TodoItem).order_by(TodoItem.tsk_id)
    return {"tasks": tasks}

# Add task's function

@route("/add-task", method="POST")
def add_task():
    desc = request.POST.description.strip()
    auth = request.POST.author
    today = dt.now().date()
    if len(desc) > 0 and len(auth) > 0:
        t = TodoItem(desc, auth, today)
        s.add(t)
        s.commit()
    return redirect("/")

# Remove task's function

@route("/api/delete/<tsk_id:int>")
def api_delete(tsk_id):
    s.query(TodoItem).filter(TodoItem.tsk_id == tsk_id).delete()
    s.commit()
    return redirect("/")

# Complete task's function

@route("/api/complete/<tsk_id:int>")
def api_complete(tsk_id):
    t = s.query(TodoItem).filter(TodoItem.tsk_id == tsk_id).first()
    t.is_completed = True
    s.commit()
    return "Ok"

run(host="localhost", port=8080)