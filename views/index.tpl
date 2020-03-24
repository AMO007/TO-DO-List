<!DOCTYPE html>
<html>

<head>
    <title>TO-Do list</title>
    <meta charset="utf-8" />

    <!-- BootstrapCDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!-- JQUERRY -->
    <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

    <!-- Custom-CSS -->
    <link rel="stylesheet" href="static/style.css">
    
    <!--Font Awesome -->
    <script defer src="static/fontawesome/js/all.js"></script>

</head>

<body>

    <div class="container">

        <h1>Simple TO-DO list</h1>
        <p>Python + Bubble + SQlite</p>
        <form class="form-inline" action="/add-task" method="post">
            <input type="text" class="form-control m-2" name="description" placeholder="New task">
            <input type="text" class="form-control m-2" name="author" placeholder="Autor">
            <button type="submit" class="btn btn-primary m-2 AddTask"><i class="fas fa-plus"></i> Add</button>
            <button type="button" class="btn btn-success m-2 DoneTask"><i class="fas fa-check"></i> Done</button>
            <button type="button" class="btn btn-danger m-2 RemoveTask"><i class="far fa-trash-alt"></i> Delete</button>
        </form>
        <ul class="list-inline">
            <li class="list-inline-item" id = "total_result"><b>Total task's:</b> <span></span></li>
            <li class="list-inline-item" id = "done_tasks"><b>Done task's:</b> <span></span></li>
            <li class="list-inline-item" id = "selected_tasks"><b>Selected:</b> <span>0</span></li>
        </ul>
        <div class="row mt-3">
            <div class="col-12">
                <div class="table-responsive-md">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col"><div class="custom-control custom-checkbox">
                                                    <input class="custom-control-input totalTaskSelect" type="checkbox" id="totalInlineCheckbox1" value="option1">
                                                    <label class="custom-control-label" for="totalInlineCheckbox1">№</label>
                                            </div></th>
                            <th scope="col">Task</th>
                            <th scope="col">Autor</th>
                            <th scope="col">Date</th>
                        </tr>
                    </thead>
                    <tbody class="tasks-rows">
                    % for task in tasks:
                      % if task.is_completed:
                        <tr data_tsk_id="{{ task.tsk_id }}" class="complete">
                      % else:
                        <tr data_tsk_id="{{ task.tsk_id }}">
                      % end
                            <td>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input taskSelect" id="customCheck{{ task.tsk_id }}" data_tsk_id="{{ task.tsk_id }}">
                                    <label class="custom-control-label" for="customCheck{{ task.tsk_id }}">{{ task.tsk_id }}</label>
                                </div>
                            </td>
                            <td>{{ task.description }}</td>
                            <td>{{ task.author }}</td>
                            <td>{{ task.dt }}</td>
                        </tr>
                    % end
                    </tbody>
                </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Custom JS -->
    <script src="static/script.js"></script>

</body>


</html>