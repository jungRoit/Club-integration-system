<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="SITE_URL" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Thames IT Club | Dashboard</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="${SITE_URL}/static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="${SITE_URL}/static/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

        <!-- Theme style -->
        <link href="${SITE_URL}/static/css/AdminLTE.css" rel="stylesheet" type="text/css" />

        <link href="${SITE_URL}/static/css/fullcalendar.css" rel="stylesheet" type="text/css" />
        <link href="${SITE_URL}/static/css/fullcalendar.print.css" rel="stylesheet" type="text/css" media='print' />

    </head>
    <body class="skin-black">
        <!-- header logo: style can be found in header.less -->
        <header class="header">
            <a href="#" class="logo">
                <!-- Add the class icon to your logo image or logo icon to add the margining -->
                Thames IT Club
            </a>
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <button href="#" class="navbar-btn sidebar-toggle tog" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>

                </button>


                <button class="btn btn-dark pull-right">Sign out</button>

            </nav>


        </header>
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="left-side sidebar-offcanvas">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="${SITE_URL}/static/img/avatar.png" class="img-circle" alt="User Image" />
                        </div>
                        <div class="pull-left info">
                            <p>Hello, Roit</p>

                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>
                    <!-- search form -->
                    <form action="#" method="get" class="sidebar-form">
                        <div class="input-group">
                            <input type="text" name="q" class="form-control" placeholder="Search..."/>
                            <span class="input-group-btn">
                                <button type='submit' name='seach' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
                            </span>
                        </div>
                    </form>
                    <!-- /.search form -->
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li class="active">
                            <a href="${SITE_URL}/dashboard">
                                <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                            </a>
                        </li>
                        <li>
                            <a href="${SITE_URL}/dashboard/members">
                                <i class="fa fa-user"></i> <span>Members</span>
                            </a>
                        </li>
                        <li>
                            <a href="${SITE_URL}/dashboard/meetings">
                                <i class="fa fa-users"></i> <span>Meeting</span>
                            </a>
                        </li>
                        <li>
                            <a href="${SITE_URL}/dashboard/events">
                                <i class="fa fa-calendar"></i> <span>Events</span> 
                            </a>
                        </li>
                        <li>
                            <a href="${SITE_URL}/dashboard/messages">
                                <i class="fa fa-envelope"></i> <span>Messages</span> 
                            </a>
                        </li>
                        <li>
                            <a href="${SITE_URL}/dashboard/accounts">
                                <i class="fa fa-envelope"></i> <span>Club Accounts</span> 
                            </a>
                        </li>
                        <li>
                            <a href="${SITE_URL}/dashboard/calendar">
                                <i class="fa fa-envelope"></i> <span>Calendar</span> 
                            </a>
                        </li>



                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">

                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Dashboard
                        <small>Control panel</small>
                    </h1>

                </section>

                <!-- Main content -->
                <section class="content">


                    <div class="row">
                        <div class="col-md-3">
                            <div class="box box-primary">
                                <div class="box-header">
                                    <h4 class="box-title">Draggable Events</h4>
                                </div>
                                <div class="box-body">
                                    <!-- the events -->
                                    <div id='external-events'>                                        
                                        <div class='external-event bg-green'>Lunch</div>
                                        <div class='external-event bg-red'>Go home</div>
                                        <div class='external-event bg-aqua'>Do homework</div>
                                        <div class='external-event bg-yellow'>Work on UI design</div>
                                        <div class='external-event bg-navy'>Sleep tight</div>
                                        <p>
                                            <input type='checkbox' id='drop-remove' /> <label for='drop-remove'>remove after drop</label>
                                        </p>
                                    </div>
                                </div><!-- /.box-body -->
                            </div><!-- /. box -->
                            <div class="box box-primary">
                                <div class="box-header">
                                    <h3 class="box-title">Create Event</h3>
                                </div>
                                <div class="box-body">
                                    <div class="btn-group" style="width: 100%; margin-bottom: 10px;">
                                        <button type="button" id="color-chooser-btn" class="btn btn-danger btn-block btn-sm dropdown-toggle" data-toggle="dropdown">Color <span class="caret"></span></button>
                                        <ul class="dropdown-menu" id="color-chooser">
                                            <li><a class="text-green" href="#"><i class="fa fa-square"></i> Green</a></li>
                                            <li><a class="text-blue" href="#"><i class="fa fa-square"></i> Blue</a></li>                                            
                                            <li><a class="text-navy" href="#"><i class="fa fa-square"></i> Navy</a></li>                                            
                                            <li><a class="text-yellow" href="#"><i class="fa fa-square"></i> Yellow</a></li>
                                            <li><a class="text-orange" href="#"><i class="fa fa-square"></i> Orange</a></li>
                                            <li><a class="text-aqua" href="#"><i class="fa fa-square"></i> Aqua</a></li>
                                            <li><a class="text-red" href="#"><i class="fa fa-square"></i> Red</a></li>
                                            <li><a class="text-fuchsia" href="#"><i class="fa fa-square"></i> Fuchsia</a></li>
                                            <li><a class="text-purple" href="#"><i class="fa fa-square"></i> Purple</a></li>
                                        </ul>
                                    </div><!-- /btn-group -->
                                    <div class="input-group">                                          
                                        <input id="new-event" type="text" class="form-control" placeholder="Event Title">
                                        <div class="input-group-btn">
                                            <button id="add-new-event" type="button" class="btn btn-default btn-flat">Add</button>
                                        </div><!-- /btn-group -->
                                    </div><!-- /input-group -->
                                </div>
                            </div>
                        </div><!-- /.col -->
                        <div class="col-md-9">
                            <div class="box box-primary">                                
                                <div class="box-body no-padding">
                                    <!-- THE CALENDAR -->
                                    <div id="calendar"></div>
                                </div><!-- /.box-body -->
                            </div><!-- /. box -->
                        </div><!-- /.col -->
                    </div><!-- /.row -->  


                </section>
            </aside>
        </div>


        <!-- jQuery 2.0.2 -->
        <script src="${SITE_URL}/static/vendor/jquery/jquery.min.js"></script>
        <!-- jQuery UI 1.10.3 -->
        <script src="${SITE_URL}/static/vendor/jquery/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <script src="${SITE_URL}/static/vendor/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>


        <script src="${SITE_URL}/static/js/AdminLTE/app.js" type="text/javascript"></script>

        <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
        <script src="${SITE_URL}/static/js/AdminLTE/dashboard.js" type="text/javascript"></script>        

        <script src="${SITE_URL}/static/js/fullcalendar.min.js" type="text/javascript"></script>

        <script>
            $(document).ready(function () {
                $(".tog").on('click', function () {
                    $(".sidebar-offcanvas").slideToggle();
                });
            });



        </script>

        <script type="text/javascript">
            $(function () {


                $('#calendar').fullCalendar({
                    events: [
                        {
                            title: 'Orientation',
                            start: '2018-02-01',
                            backgroundColor: "#000000"
                        },
                        {
                            title: 'FiFa',
                            start: '2018-2-05',
                            end: '2018-02-07',
                            backgroundColor: "#00a65a", //Success (green)
                            
                        },
                        {
                            title: 'General-Meeting',
                            start: '2018-02-09T12:30:00',
                            allDay: false // will make the time show
                        }
                    ]
                });


                /* initialize the external events
                 -----------------------------------------------------------------*/
                function ini_events(events) {
                    ele.each(function () {

                        // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
                        // it doesn't need to have a start or end
                        var eventObject = {
                            title: $.trim($(this).text()) // use the element's text as the event title
                        };

                        // store the Event Object in the DOM element so we can get to it later
                        $(this).data('eventObject', eventObject);

                        // make the event draggable using jQuery UI
                        $(this).draggable({
                            zIndex: 1070,
                            revert: true, // will cause the event to go back to its
                            revertDuration: 0  //  original position after the drag
                        });

                    });
                }
                ini_events($('#external-events div.external-event'));

                /* initialize the calendar
                 -----------------------------------------------------------------*/
                //Date for the calendar events (dummy data)
                var date = new Date();
                var d = date.getDate(),
                        m = date.getMonth(),
                        y = date.getFullYear();
                $('#calendar').fullCalendar({
                    header: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'month,agendaWeek,agendaDay'
                    },
                    buttonText: {//This is to add icons to the visible buttons
                        prev: "<span class='fa fa-caret-left'></span>",
                        next: "<span class='fa fa-caret-right'></span>",
                        today: 'today',
                        month: 'month',
                        week: 'week',
                        day: 'day'
                    },
                    //Random default events
                    events: [
                        {
                            title: 'All Day Event',
                            start: new Date(y, m, 1),
                            backgroundColor: "#f56954", //red 
                            borderColor: "#f56954" //red
                        },
                        {
                            title: 'Long Event',
                            start: new Date(y, m, d - 5),
                            end: new Date(y, m, d - 2),
                            backgroundColor: "#f39c12", //yellow
                            borderColor: "#f39c12" //yellow
                        },
                        {
                            title: 'Meeting',
                            start: new Date(y, m, d, 10, 30),
                            allDay: false,
                            backgroundColor: "#0073b7", //Blue
                            borderColor: "#0073b7" //Blue
                        },
                        {
                            title: 'Lunch',
                            start: new Date(y, m, d, 12, 0),
                            end: new Date(y, m, d, 14, 0),
                            allDay: false,
                            backgroundColor: "#00c0ef", //Info (aqua)
                            borderColor: "#00c0ef" //Info (aqua)
                        },
                        {
                            title: 'Birthday Party',
                            start: new Date(y, m, d + 1, 19, 0),
                            end: new Date(y, m, d + 1, 22, 30),
                            allDay: false,
                            backgroundColor: "#00a65a", //Success (green)
                            borderColor: "#00a65a" //Success (green)
                        },
                        {
                            title: 'Click for Google',
                            start: new Date(y, m, 28),
                            end: new Date(y, m, 29),
                            url: 'http://google.com/',
                            backgroundColor: "#3c8dbc", //Primary (light-blue)
                            borderColor: "#3c8dbc" //Primary (light-blue)
                        }
                    ],
                    editable: true,
                    droppable: true, // this allows things to be dropped onto the calendar !!!
                    drop: function (date, allDay) { // this function is called when something is dropped

                        // retrieve the dropped element's stored Event Object
                        var originalEventObject = $(this).data('eventObject');

                        // we need to copy it, so that multiple events don't have a reference to the same object
                        var copiedEventObject = $.extend({}, originalEventObject);

                        // assign it the date that was reported
                        copiedEventObject.start = date;
                        copiedEventObject.allDay = allDay;
                        copiedEventObject.backgroundColor = $(this).css("background-color");
                        copiedEventObject.borderColor = $(this).css("border-color");

                        // render the event on the calendar
                        // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
                        $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);

                        // is the "remove after drop" checkbox checked?
                        if ($('#drop-remove').is(':checked')) {
                            // if so, remove the element from the "Draggable Events" list
                            $(this).remove();
                        }

                    }
                });

                /* ADDING EVENTS */
                var currColor = "#f56954"; //Red by default
                //Color chooser button
                var colorChooser = $("#color-chooser-btn");
                $("#color-chooser > li > a").click(function (e) {
                    e.preventDefault();
                    //Save color
                    currColor = $(this).css("color");
                    //Add color effect to button
                    colorChooser
                            .css({"background-color": currColor, "border-color": currColor})
                            .html($(this).text() + ' <span class="caret"></span>');
                });
                $("#add-new-event").click(function (e) {
                    e.preventDefault();
                    //Get value and make sure it is not null
                    var val = $("#new-event").val();
                    if (val.length == 0) {
                        return;
                    }

                    //Create event
                    var event = $("<div />");
                    event.css({"background-color": currColor, "border-color": currColor, "color": "#fff"}).addClass("external-event");
                    event.html(val);
                    $('#external-events').prepend(event);

                    //Add draggable funtionality
                    ini_events(event);

                    //Remove event from text input
                    $("#new-event").val("");
                });
            });
        </script>

    </body>
</html>