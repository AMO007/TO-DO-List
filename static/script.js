// Task's counter

var total_tasks = $('.tasks-rows tr').length
$('#total_result span').html(total_tasks)


// Done task's counter

$('#done_tasks span').html($('.complete').length)

// Selector for row's in thead

$(document).on('click', '.totalTaskSelect', function() {
    var check = this;
    $(this).parents('table').find('tbody :checkbox').each(function() {
        if ($(check).is(':checked')) {
            $(this).prop('checked', true);
            $(this).parents('tr').addClass('selected');
        } else {
            $(this).prop('checked', false);
            $(this).parents('tr').removeClass('selected');
        }
    });
    $('#selected_tasks span').html($('.selected').length);
});

// Selector for row's

$(document).on('click', 'tbody :checkbox', function() {
    var parents = $(this).parents('table');
    if ($(this).is(':checked')) {
        $(this).parents('tr').addClass('selected');
        $(parents).find('thead :checkbox').prop('checked', true);
    } else {
        $(this).parents('tr').removeClass('selected');
        if ($(parents).find('tbody :checkbox:checked').length == 0) {
            $(parents).find('thead :checkbox').prop('checked', false);
        }
    }
    $('#selected_tasks span').html($('.selected').length);
});

// Selector on row click

$(document).on('click', 'tbody tr', function(event) {
    if (event.target.tagName == 'TH' || event.target.tagName == 'TD') {
        $(this).find(':checkbox').trigger('click');
    }
    $('#selected_tasks span').html($('.selected').length);
});

// Done task's

$(document).on('click', '.DoneTask', function() {
    $(".selected").addClass("done")

    $(".done").each(function() {
        done = ($(this).attr("data_tsk_id"));
        $.get("/api/complete/" + done);
        $(this).addClass('complete')
        $(this).removeClass('done')
    });


    $('.taskSelect').parents("tr").removeClass('selected')
    $('.taskSelect').prop('checked', false);
    $('.totalTaskSelect').prop('checked', false);
    $('#done_tasks span').html($('.complete').length);
    $('#selected_tasks span').html($('.selected').length);

})

// Remove task's

$(document).on('click', '.RemoveTask', function() {


    $(".selected").each(function() {
        rem = ($(this).attr("data_tsk_id"));
        $.get("/api/delete/" + rem)
        total_tasks--
    });


    $(".selected").remove()
    $('#total_result span').html(total_tasks);
    $('#selected_tasks span').html($('.selected').length);
    $('#done_tasks span').html($('.complete').length);
    $('.totalTaskSelect').prop('checked', false);

})