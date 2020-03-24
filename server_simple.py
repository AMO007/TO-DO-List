from bottle import route, run, static_file, view, redirect, request
from datetime import datetime as dt

class TodoItem:
    def __init__(self, tsk_id, description, author, dt):
        self.tsk_id = tsk_id
        self.description = description
        self.author = author
        self.dt = dt
        self.is_completed = False

tasks_db = {
    1: TodoItem(1, "Eat", "Savva", "2020-03-20"),
    2: TodoItem(2, "Sleep", "Savva", "2020-03-20"),
    3: TodoItem(3, "Python", "Savva", "2020-03-20"),
    4: TodoItem(4, "Hello world!", "Savva", "2020-03-20"),
    5: TodoItem(5, "Прокуратон", "Savva", "2020-03-20"),
}

# Route static JS/CSS

@route("/static/<filename:path>")
def send_static(filename):
    return static_file(filename, root="static")

# Route main page

@route("/")
@view("index")
def index():
    tasks = tasks_db.values()
    return {"tasks": tasks}

# Add task's function

@route("/add-task", method="POST")
def add_task():
    desc = request.POST.description.strip()
    auth = request.POST.author
    today = dt.now().date()
    if len(desc) > 0 and len(auth) > 0:
        new_tsk_id = max(tasks_db.keys()) + 1

        t = TodoItem(new_tsk_id, desc, auth, today)
        tasks_db[new_tsk_id] = t
    
    return redirect("/")

# Remove task's function

@route("/api/delete/<tsk_id:int>")
def api_delete(tsk_id):
    tasks_db.pop(tsk_id)
    return redirect("/")

# Complete task's function

@route("/api/complete/<tsk_id:int>")
def api_complete(tsk_id):
    tasks_db[tsk_id].is_completed = True
    return "Ok"

run(host="localhost", port=8080, autoreload=True)
