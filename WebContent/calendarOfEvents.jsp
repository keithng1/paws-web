<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calendar of Events</title>
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <!--Import sementic.css components-->
        <link type="text/css" rel="stylesheet" href="css/semantic.css" />

        <link type="text/css" rel="stylesheet" href="components/icon.css" />

        <link type="text/css" rel="stylesheet" href="css/style.css" />

        <link type="text/css" rel="stylesheet" href="css/style.css" />
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta charset='utf-8' />
        <link href='css/fullcalendar.min.css' rel='stylesheet' />
        <link href='css/fullcalendar.print.min.css' rel='stylesheet' media='print' />
        <meta charset="UTF-8">
        <style>
            body {
                margin: 40px 10px;
                padding: 0;
                font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
                font-size: 14px;
            }
            #calendar {
                max-width: 900px;
                margin: 0 auto;
            }
            @viewport {
                width: auto;
            }
        </style>
    </head>

    <body>


        <jsp:include page="menubar.jsp" />


        <div class="main-body-container">

            <div class="ui grid">
                <div class="three wide column">





                    <div class="ui secondary vertical menu">
                        <div class="sidebar-about">
                            <p class="item" style="background-color: #45484c; color: white;">
                                News
                            </p>
                            <a class="item" href="newsList.jsp">
    News
  </a>
                            <a class="item active" href="calendarOfEvents.jsp">
       Calendar of Events
  </a>
                            <a class="item" href="annualReports.jsp">
   Annual Reports
  </a>



                        </div>

                    </div>

                </div>



                <div class="thirteen wide column">

                    <h1 style="color: #45484c;">Calendar of Events</h1>
                    <hr>
                    <br>
                    <br>

                    <br>
                    <br>
                    <div id='calendar'></div>
                </div>
            </div>
        </div>




        <br>
        <br>

        <br>
        <br>
        <br>
        <jsp:include page="footer.jsp" />


    </body>



    <script src='js/moment.min.js'></script>
    <script src='js/jquery.min.js'></script>
    <script src='js/fullcalendar.min.js'></script>


    <script type="text/javascript" src="js/semantic.min.js"></script>

    <script type="text/javascript">
        if (screen.width >= 1500) {
            document.write("<style>body{zoom:80%;}</style>");
        }
        if (screen.width >= 2000) {
            document.write("<style>body{zoom:100%;}</style>");
        }
        if (screen.width >= 2500) {
            document.write("<style>body{zoom:120%;}</style>");
        }
    </script>

    <script>
        $('.ui.dropdown')
            .dropdown();


        $('.slider').glide({
            autoplay: 2000,
            arrowsWrapperClass: 'slider-arrows',
            arrowRightText: '',
            arrowLeftText: '',

        });
    </script>


    <script>
        $(document).ready(function() {

            $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,basicWeek,basicDay'
                },
                defaultDate: '2017-05-12',
                navLinks: true, // can click day/week names to navigate views
                editable: false,
                eventLimit: true, // allow "more" link when too many events
                events: [{
                    title: 'All Day Event',
                    start: '2017-05-01'
                }, {
                    title: 'Long Event',
                    start: '2017-05-07',
                    end: '2017-05-10'
                }, {
                    id: 999,
                    title: 'Repeating Event',
                    start: '2017-05-09T16:00:00'
                }, {
                    id: 999,
                    title: 'Repeating Event',
                    start: '2017-05-16T16:00:00'
                }, {
                    title: 'Conference',
                    start: '2017-05-11',
                    end: '2017-05-13'
                }, {
                    title: 'Meeting',
                    start: '2017-05-12T10:30:00',
                    end: '2017-05-12T12:30:00'
                }, {
                    title: 'Lunch',
                    start: '2017-05-12T12:00:00'
                }, {
                    title: 'Meeting',
                    start: '2017-05-12T14:30:00'
                }, {
                    title: 'Happy Hour',
                    start: '2017-05-12T17:30:00'
                }, {
                    title: 'Dinner',
                    start: '2017-05-12T20:00:00'
                }, {
                    title: 'Birthday Party',
                    start: '2017-05-13T07:00:00'
                }, {
                    title: 'Click for Google',
                    url: 'http://google.com/',
                    start: '2017-05-28'
                }]
            });

        });
    </script>


    </html>