<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Annual Reports</title>

	   <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <!--Import sementic.css components-->
        <link type="text/css" rel="stylesheet" href="css/semantic.css" />
        <link type="text/css" rel="stylesheet" href="components/icon.css" />
        <link type="text/css" rel="stylesheet" href="css/style.css" />

 		<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>

  
        <meta charset="UTF-8">




        <link type="text/css" rel="stylesheet" href="css/style.css" />
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    	
    	
    
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
                            <a class="item" href="newsList.jsp">News</a>
                            <a class="item" href="calendarOfEvents.jsp">Calendar of Events</a>
                            <a class="item active" href="annualReports.jsp">Annual Reports</a>
                        </div>

                    </div>

                </div>




                <div class="thirteen wide column" id="divStart">

                    <h1 style="color: #45484c;">Annual Reports</h1>
                    <hr>
                    <br>
                    <br>
<!-- 
                    <div class="ui cards">
                        <div class="card">
                            <div class="content">

                                <div class="ui grid">
                                    <div class="four wide column"> <img src="img/sample.png" width="100%" style="padding: 2.5%;">
                                    </div>
                                    <div class="ten wide column">
                                        <br>
                                        <div class="header">PAASCU joins TRAIN IQA</div>
                                        <div class="description"><span class="news-style">
										     Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. </span>
                                            <br>
                                            <a href="news-page.html">See more ></a>
                                        </div>

                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>





                    <div class="ui cards">
                        <div class="card">
                            <div class="content">

                                <div class="ui grid">
                                    <div class="four wide column"> <img src="img/sample.png" width="100%" style="padding: 2.5%;">
                                    </div>
                                    <div class="ten wide column">
                                        <br>
                                        <div class="header">PAASCU joins TRAIN IQA</div>
                                        <div class="description"><span class="news-style">
      Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. </span>
                                            <br>
                                            <a href="news-page.html">See more ></a>
                                        </div>

                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>





                    <div class="ui cards">
                        <div class="card">
                            <div class="content">

                                <div class="ui grid">
                                    <div class="four wide column"> <img src="img/sample.png" width="100%" style="padding: 2.5%;">
                                    </div>
                                    <div class="ten wide column">
                                        <br>
                                        <div class="header">PAASCU joins TRAIN IQA</div>
                                        <div class="description"><span class="news-style">
      Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. </span>
                                            <br>
                                            <a href="news-page.html">See more ></a>
                                        </div>

                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>


 -->


                </div>
            </div>


            <br>
            <br>
            <br>

            <center>


                <div class="ui pagination menu">
                    <a class="item"> &#60; </a>
                    <a class="active item">1</a>
                    <a class="item">2</a>
                    <a class="item">3</a>
                    <a class="item">4</a>
                    <a class="item">5</a>
                    <a class="item">6</a>
                    <a class="item">&#62;</a>
                </div>


            </center>


        </div>

        <br>
        <br>
        <br>

      	<jsp:include page="footer.jsp" />


    </body>




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
    </script>





    </html>