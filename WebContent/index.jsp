<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PAASCU Home</title>
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <!--Import sementic.css components-->
        <link type="text/css" rel="stylesheet" href="css/semantic.css" />

        <link type="text/css" rel="stylesheet" href="components/icon.css" />


        <link type="text/css" rel="stylesheet" href="css/style.css" />


        <meta charset="UTF-8">




        <link type="text/css" rel="stylesheet" href="css/style.css" />
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <style>
            @viewport {
                width: auto;
            }
        </style>



    </head>

    <body>




        <jsp:include page="menubar.jsp" />


        <div class="main-body-container">


            <div style=" height:70%;" class="slider slider1">
                <div class="slides">
                    <div class="slide-item item1">
                        <div class="overlay">



                            <div class="ui four column grid">
                                <div class="two column row">
                                    <div class="column">
                                        <div class="carousel-content">
                                            <span class="carousel-header">PAASCU JOINS TRAIN IQA</span>
                                            <br>
                                            <br>
                                            <span style=" text-align: left;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam a libero hendrerit, vulputate ligula id, mattis risus. Fusce sed metus vitae odio pulvinar aliquam vel sed nisi. Fusce molestie Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam a libero hendrerit, vulputate ligula id, mattis risus. Fusce sed metus vitae odio pulvinar aliquam vel sed nisi. Fusce molestie </span>
                                            <br>
                                            <br>
                                            <button class="ui green button">READ MORE ></button>
                                        </div>
                                    </div>
                                </div>

                            </div>


                        </div>


                    </div>
                    <div class="slide-item item2">

                        <div class="overlay">



                            <div class="ui four column grid">
                                <div class="two column row">
                                    <div class="column">
                                        <div class="carousel-content">
                                            <span class="carousel-header">PAASCU JOINS TRAIN IQA</span>
                                            <br>
                                            <br>
                                            <span style=" text-align: left;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam a libero hendrerit, vulputate ligula id, mattis risus. Fusce sed metus vitae odio pulvinar aliquam vel sed nisi. Fusce molestie Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam a libero hendrerit, vulputate ligula id, mattis risus. Fusce sed metus vitae odio pulvinar aliquam vel sed nisi. Fusce molestie </span>
                                            <br>
                                            <br>
                                            <button class="ui green button">READ MORE ></button>
                                        </div>
                                    </div>
                                </div>

                            </div>


                        </div>



                    </div>

                </div>
            </div>



            <br>

            <div class="call">



                <div class="ui two column centered grid">


                    <div class="pad-down"><span class="call-text">Be a member institution.</span>
                    </div>
                    <div class="">
                        <button class="ui green button">CONTACT US</button>
                    </div>
                </div>
            </div>





            <br>
            <br>



            <div class="ui two column grid">

                <div class="column">
                    <div class="ui fluid card">

                        <div class="content">
                            <br>
                            <br>
                            <div class="description">
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam a libero hendrerit, vulputate ligula id, mattis risus. Fusce sed metus vitae odio pulvinar aliquam vel sed nisi. Fusce molestie neque pulvinar,
                            </div>
                            <br>
                            <br>
                            <a style="color: black;"><h5 style="padding-left: 3%;"> VIEW PAASCU ACCREDITED INSTITUTIONS ></h5> </a>

                            <br>
                            <br>
                        </div>
                    </div>
                </div>
                <div class="column">
                    <div class="ui fluid card">

                        <div class="content">
                            <br>
                            <br>
                            <div class="description">
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam a libero hendrerit, vulputate ligula id, mattis risus. Fusce sed metus vitae odio pulvinar aliquam vel sed nisi. Fusce molestie neque pulvinar,
                            </div>
                            <br>
                            <br>
                            <a style="color: black;"><h5 style="padding-left: 3%;"> VIEW PAASCU ACCREDITED PROGRAMS ></h5> </a>

                            <br>
                            <br>
                        </div>


                    </div>
                </div>
            </div>



            <br>
            <br>
            <br>



        </div>



		<jsp:include page="footer.jsp" />



    </body>




    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="http://cdn.jsdelivr.net/jquery.glide/1.0.6/jquery.glide.min.js"></script>

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





    </html>