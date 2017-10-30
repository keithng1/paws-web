<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>News</title>


        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>

        <script type="text/javascript" src="js/semantic.min.js"></script>



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

        <script>
            function strip(html) {
                var tmp = document.createElement("div");
                tmp.innerHTML = html;
                return tmp.textContent || tmp.innerText || "";
            }

            $(document).ready(function() {
				
 				var pageCount =  (parseInt(${newsCount}/5));
            	if(${newsCount}%5 > 0) 
            		pageCount+=1;
           		
         			for(var i = 0; i<pageCount; i++)
    				{
    					var aPagination = document.createElement("a");
    					aPagination.innerHTML = i+1;
    					aPagination.setAttribute("class", "item");
    					if(${page} == i+1)
    						aPagination.setAttribute("class", "active item");
    					aPagination.setAttribute("href", "NewsList?page="+(i+1));
    					$(aPagination).insertBefore('#nextPaginate');
    				}
         		
            	
            	if(pageCount == ${page})
            	{
            		$(function () {
            		    $('#nextPaginate').on("click", function (e) {
            		        e.preventDefault();
            		    });
            		});
            	}
            	
            	if(${page} == 1)
            	{
            		$(function () {
            		    $('#backPaginate').on("click", function (e) {
            		        e.preventDefault();
            		    });
            		});
            	}
            		
            		
                $.getJSON("NewsLoader?page=" + ${page}, function(data) {
                    if (data.length > 0) {
                        $.each(data, function(key, value) {

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
                            div7.style.fontWeight = 'bold';
                            div7.style.fontSize = '18px';

                            div7.innerHTML = value.title;

                            var div8 = document.createElement("div");
                            div8.setAttribute("class", "description");

                            var span = document.createElement("span");
                            span.setAttribute("class", "news-style");

                            var a = document.createElement("a");
                            a.setAttribute("href", "ViewNews?newsID=" + value.newsID);
                            a.innerHTML = "See More >";

                            var div9 = document.createElement("div");
                            div9.setAttribute("class", "meta");
                            
                            var span1 = document.createElement("span");
                            span1.innerHTML = formatDate(value.date);
                            
                            div9.appendChild(span1);


                            div8.innerText = strip(value.content).substr(0, 430) + '...';;
                            div8.appendChild(span);
                            div8.appendChild(document.createElement("br"));
                            div8.appendChild(a);


                            div6.appendChild(div7);
                            div6.appendChild(div9);
                            div6.appendChild(document.createElement("br"));

                            
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
            
            
            function formatDate(date)
            {
            	var complete = date.split('-');
            	var str_month = ['', 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
            	if(complete[1] < 10)
            		return str_month[complete[1].substring(1)] + ' ' + complete[2] + ', ' + complete[0];
            	
            	return str_month[complete[1]] + ' ' + complete[2] + ', ' + complete[0];
            	
            	
            }
        </script>


    </head>

    <body>





        <jsp:include page="menubar.jsp" />



        <div class="main-body-container">

            <div class="ui grid">
            

				

                <div class="sixteen wide column" id="divStart">

                    <h1 style="color: #45484c;">News</h1>
                    <hr>
                    <br>
                    <br>
				<select class="ui dropdown">
				  <option value="">Gender</option>
				  <option value="1">Male</option>
				  <option value="0">Female</option>
				</select>




                </div>
            </div>


            <br>
            <br>
            <br>

            <center>


                <div class="ui pagination menu">
                    <a class="item" id="backPaginate" href="NewsList?page=${page-1}">&#60;</a>
                   
   				    <a class="item" id="nextPaginate" href="NewsList?page=${page+1}">&#62;</a>
                </div>


            </center>


        </div>

        <br>
        <br>
        <br>
        <jsp:include page="footer.jsp" />

    </body>





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

   



    </html>