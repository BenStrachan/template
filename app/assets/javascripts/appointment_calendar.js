$(document).ready(function() {
      var arr = $('#business_appointment').data('url');

      var calendar = $('#calendar').fullCalendar({
        header: {
          left: 'prev,next today myCustomButton',
          center: 'title',
          right: 'month,agendaWeek,agendaDay,listWeek',
        },

      defaultView: 'agendaWeek',
      editable: true,
      selectable: true,
      nowIndicator: true,
      timezone: "Australia/Brisbane",
      events: arr,
      //header and other values
      select: function(start, end, allDay) {
          starttime = moment(start).format("ddd, MMM Do YYYY, h:mm a");
          endtime = moment(end).format("ddd, MMM Do YYYY, h:mm a");
          todaytime = moment().format("ddd, MMM Do YYYY, h:mm a");
          var mywhen = starttime + ' - ' + endtime;
          $('#createEventModal #appointment_from').val(starttime);
          $('#createEventModal #appointment_to').val(endtime);
          $('#createEventModal #apptAllDay').val(allDay);
          $('#createEventModal #when').text(mywhen);
          $('#createEventModal').modal('show');
       },

       eventDrop: function(event, delta, revertFunc) {
          event_data = {
            event: {
              id: event.id,
              start: event.start.format(),
              end: event.end.format()
            }
          };
          $.ajax({
              url: "/app/calendar/" + calEvent.id  + "/edit",
              data: event_data,
              type: 'PATCH'
          });
        },

        eventResize: function(event, delta, revertFunc) {

          alert(event.title + " end is now " + event.end.format());

          if (!confirm("is this okay?")) {
            revertFunc();
          }

        },

       eventClick: function(calEvent, jsEvent, view) {
          $.ajax({
            type: 'GET',
            url: "/app/calendar/" + calEvent.id  + "/edit",
            dataType: "script"
          });

        },
        eventRender: function(event, element)
        {
            element.find('.fc-time').append("<br/>" + event.residentname);
            element.find('.fc-time').append("<br/>" + event.appointmenttype);
        }

    });


    $('#submitButton').on('click', function(e){
    // We don't want this to act as a link so cancel the link action
        e.preventDefault();

        doSubmit();
    });

    function doSubmit(){
        $("#createEventModal").modal('hide');
        console.log($('#apptStartTime').val());
        console.log($('#apptEndTime').val());
        console.log($('#apptAllDay').val());

    $("#calendar").fullCalendar('renderEvent',
        {
            title: $('#residentName').val(),
            start: new Date($('#apptStartTime').val()),
            end: new Date($('#apptEndTime').val()),
            allDay: ($('#apptAllDay').val() == "true"),
        },
        true);
    }

});
