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
    	
    	<script>
	    	$(document).ready(function() {
	    	  
	    		$.getJSON("NewsLoader", function(data){
				    if ( data.length > 0)
		    		{
				    	$.each(data, function (key, value){
								    
					    	var div1 = document.createElement("div");
					    	div1.setAttribute("class", "ui cards");
					    	
					    	var div2 = document.createElement("div");
					    	div2.setAttribute("class", "card");
					    	
					    	var div3 = document.createElement("div");
					    	div3.setAttribute("class", "content");
					    	
					    	var div4 = document.createElement("div");
					    	div4.setAttribute("class", "ui grid");
					    	
					    	var div5 = document.createElement("div");
					    	div5.setAttribute("class", "four wide column");
					    	
					    	var img = document.createElement("img");
					    	img.setAttribute("src", "img/sample.png");
					    	img.setAttribute("width", "100%");
					    	img.setAttribute("style", "padding: 2.5%;");
					    
				    		div5.appendChild(img);
				    		
				    		var div6 = document.createElement("div");
				    		div6.setAttribute("class", "ten wide column");
					    	
					    	div6.appendChild(document.createElement("br"));
					    	
					    	var div7 = document.createElement("div");
					    	div7.setAttribute("class", "header");
					    	
					    	div7.innerHTML = value.title;
					    	
					    	var div8 = document.createElement("div");
					    	div8.setAttribute("class", "description");
					    	
					    	var span = document.createElement("span");
					    	span.setAttribute("class", "news-style");
					    	
					    	div8.innerHTML = value.content;
					    	
					    	div6.appendChild(div7);
					    	div6.appendChild(div8);
					    	
					    	div4.appendChild(div5);
					    	div4.appendChild(div6);
					    	
					    	div3.appendChild(div4);
					    	div2.appendChild(div3);
					    	div1.appendChild(div2);
					    	
					    	document.getElementById("divStart").appendChild(div1);
				    	});
				    	
			    	}
				});
	    		
	    		
	    	});
    	</script>
    
    
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


        <div class="ui inverted vertical footer segment footerbg">
            <br>
            <br>
            <br>


            <div class="ui center aligned main-body-container">
                <div class="ui stackable inverted divided grid">
                    <div class="four wide column" style="padding-right:10%;">

                        <div class="ui inverted link list">
                            <img class="item" width="250px" height="auto;" src="img/footer-logo.png">
                            <a href="http://semantic-ui.com/examples/fixed.html#" class="item footer-text">History of PAASCU</a>
                            <br>
                            <a href="http://semantic-ui.com/examples/fixed.html#" class="item footer-text">Objectives</a>
                            <br>
                            <a href="http://semantic-ui.com/examples/fixed.html#" class="item footer-text">Board Memberss</a>
                            <br>
                            <a href="http://semantic-ui.com/examples/fixed.html#" class="item footer-text">Commission Members</a>
                            <br>
                        </div>
                    </div>
                    <div class="three wide column">
                        <h4 class="ui inverted header green">Our Members</h4>

                        <div class="ui inverted link list">
                            <a href="http://semantic-ui.com/examples/fixed.html#" class="item footer-text">Elementary</a>
                            <br>
                            <a href="http://semantic-ui.com/examples/fixed.html#" class="item footer-text">Highschool</a>
                            <br>
                            <a href="http://semantic-ui.com/examples/fixed.html#" class="item footer-text">Basic Education</a>
                            <br>
                            <a href="http://semantic-ui.com/examples/fixed.html#" class="item footer-text">Tertiary</a>
                            <br>
                            <a href="http://semantic-ui.com/examples/fixed.html#" class="item footer-text">Graduate School</a>
                            <br>
                            <a href="http://semantic-ui.com/examples/fixed.html#" class="item footer-text">Medical School</a>
                            <br>
                        </div>
                    </div>

                    <div class="four wide column">
                        <h4 class="ui inverted header green">Contact Us</h4>
                        <div class="ui inverted link list">
                            <span class="item footer-text"><i class="mail outline icon"></i>&nbsp;info@paascu.org.ph</span>
                            <br>
                            <span class="item footer-text"><i class="marker icon"> </i>Unit 107 The Tower at Emerald Square J.P. Rizal corner P. Tuazon Sts., 1109 Quezon City </span>
                            <br>
                            <span class="item footer-text"><i class="text telephone icon"> </i>(63 2) 911 2845, (63 2) 913 1998 <br> (63 2) 439 0934, (63 2) 421 6227</span>
                            <br>
                            <span class="item footer-text"><i class="print icon"></i>&nbsp;(63 2) 911 0807</span>
                            <br>
                        </div>
                    </div>
                    <div class="five wide column">
                        <h4 class="ui inverted header green">Be Updated</h4>
                        <p class=" footer-text">Signup for our newsletter!
                        </p>

                        <div class="ui input">
                            <input type="text" placeholder="Name">
                        </div>

                        <br>
                        <br>

                        <div class="ui input">
                            <input type="text" placeholder="Email">
                        </div>

                        <br>
                        <br>
                        <button class="ui green button">SIGN UP</button>
                    </div>
                </div>

                <br>
            </div>
        </div>



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