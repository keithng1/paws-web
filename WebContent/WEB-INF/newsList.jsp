<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>News</title>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.1.1.min.js"></script>

<script type="text/javascript" src="js/semantic.min.js"></script>

<link href="http://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!--Import sementic.css components-->
<link type="text/css" rel="stylesheet" href="css/semantic.css" />

<link type="text/css" rel="stylesheet" href="components/icon.css" />


<link type="text/css" rel="stylesheet" href="css/style.css" />


<meta charset="UTF-8">




<link type="text/css" rel="stylesheet" href="css/style.css" />
<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<style>
@
viewport {
	width: auto;
}
</style>

<script>
           
            $(document).ready(function() {
            	$('.ui.dropdown').dropdown();
            	
            	if(${year} == 0)
           		{
           			$("#yearDisplay").text("All");
           		}
            	else
           		{
            		$("#pagination").remove();    
                   	$("#yearDisplay").text("${year}");    
           		}
            	
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
   					aPagination.setAttribute("href", "News?page="+(i+1));
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
            	
            	$.getJSON("NewsYearsLoader", function(data) {
            		
            		var option = document.createElement("div");
                    option.setAttribute("value", 0);
                    option.setAttribute("onclick", "window.location.href=\"News\"");
                    
                    option.setAttribute("class", "item");
                    option.innerHTML = "All";
                    
                    
                    document.getElementById("yearSelect").appendChild(option);
            		
                    if (data.length > 0) {
                        $.each(data, function(key, value) {
                      		var option = document.createElement("div");
                            option.setAttribute("value", value.year);
                            if(0 == value.year)
	                            option.setAttribute("class", "item active");
                            else
                                option.setAttribute("class", "item");
                            	
                            option.setAttribute("onclick", "window.location.href=\"News?year="+value.year + "\"");
                            
                            option.innerHTML = value.year;
                            
                            
                            document.getElementById("yearSelect").appendChild(option);
                        });
                        
                    }
                });
            	
            	
            	
            	/* if(0!=0)
           		{
            		var button = document.createElement("button");
                    button.setAttribute("class", "ui green button");
                    button.innerHTML = "Show All";
                    document.getElementById("year").appendChild(button);
           		} */
            	
            
                $.getJSON("NewsLoader?page=" + ${page} + "&year="+ ${year}, function(data) {
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
                            div4.setAttribute("style", "cursor: pointer;");
                            div4.setAttribute("onclick", "location.href = 'ViewNews?newsID=" + value.newsID + "'");
                            
                            var div5 = document.createElement("div");
                            div5.setAttribute("class", "four wide column");

                            
                            var img = document.createElement("img");
                            
                            if(value.image != null)
                            {	
	                           	img.setAttribute("src", "/static/" + value.image);
	                            img.setAttribute("width", "100%");
	                            img.setAttribute("style", "padding: 2.5%;");
                            }
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

                            var div9 = document.createElement("div");
                            div9.setAttribute("class", "meta");
                            
                            var span1 = document.createElement("span");
                            span1.innerHTML = formatDate(value.date);
                            
                            div9.appendChild(span1);


                            div8.innerText = strip(value.content).substr(0, 430) + '...';;
                            div8.appendChild(span);
                            div8.appendChild(document.createElement("br"));
                            

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
                
                /* $('#yearSelect').change(function() {
                	
               		document.location.href = "News?year=" + $('#yearSelect :selected').val();
                }); */

            });
            
 			function strip(html) {
                var tmp = document.createElement("div");
                tmp.innerHTML = html;
                return tmp.textContent || tmp.innerText || "";
            }

            function formatDate(date)
            {
            	var complete = date.split('-');
            	var str_month = ['', 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
            	if(complete[1] < 10)
            		return str_month[complete[1].substring(1)] + ' ' + complete[2] + ', ' + complete[0];
            	
            	return str_month[complete[1]] + ' ' + complete[2] + ', ' + complete[0];
            	
            	
            }
            
            /* $(document).on('change', '#yearSelect', function(e) { 
            	 
            	e.preventDefault();
                var option_val = $("#yearSelect").val(); //store the dynamic value of select option
                alert(option_val);
               	$( "#yearSelect" ).find( 'div[value="' + 0 + '"]' ).prop( "selected", true ); //Set select option 'Selected'
               
            	     
            }); */
        </script>


</head>

<body>
	<script>
	function search(e)
	{
        if(e.keyCode === 13){
            e.preventDefault(); // Ensure it is only this code that rusn

    		var searchWord = document.getElementById("searchWord").value;
    		window.location = "Search?query=" + searchWord;
  		}
	
	}
</script>


<div class="ui nav" style="padding: 3%;">

     <div class="ui secondary menu navmenu">

         <div style="padding-right:5%; min-width: 100px; width: 240px;">
             <a href="./"><img src="img/logo.png" style=" width:200px; height: auto;"> </a>
         </div>



         <div class="ui dropdown item">

             ABOUT <i class="dropdown icon"></i>
             <div class="menu">
                 <a class="item" href="AboutPAASCU">About PAASCU</a>
                 <a class="item" href="BoardMembers">Board Members</a>
                 <a class="item" href="CommissionMembers">Commission Members</a>
                 <a class="item" href="InternationalAffiliations">International Affiliations</a>
             </div>
         </div>

         <a class="item" href="News">NEWS</a>
         <a class="item" href="Accreditation">ACCREDITATION</a>
         <a class="item" href="Members">OUR MEMBERS</a>
         <a class="item" href="Downloads">DOWNLOADS</a>
         <a class="item" href="ContactUs">CONTACT</a>
         <div class="right menu">
             <div class="item">
                 <div class="ui icon input">
                     <input id="searchWord" type="text" placeholder="Search..." onkeypress="search(event);">
                     <i class="search link icon"></i>
                 </div>
             </div>

         </div>
     </div>

 </div>




	<div class="main-body-container">

		<div class="ui grid">


			<div class="sixteen wide column" id="divStart">
				<div class="ui grid">
					<div class="left floated left aligned eight wide column">
						<h1 style="color: #45484c;">News</h1>
					</div>
					
					<div class="right floated right aligned eight wide column">
						<div class="eight wide column" id="year">
							Showing news from the year:
							<div class="ui selection dropdown">
						
							  <i class="dropdown icon"></i>
							  <div class="text" id="yearDisplay"></div>
							  <div class="menu" id="yearSelect">
							    
							  </div>
							</div>
						</div>
					</div>
					<!-- 
					<div class="right floated right aligned eight wide column">
						<div class="ui selection dropdown">
						
						  <i class="dropdown icon"></i>
						  <div class="text" id="yearDisplay"></div>
						  <div class="menu" id="yearSelect">
						    
						  </div>
						</div>
						
					</div> -->

				</div>
				<hr>
				<br>
			</div>
		</div>


		<br> <br> <br>

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
	
 <div class="ui inverted vertical footer segment footerbg">
   <br>
   <br>
   <br>


   <div class="ui center aligned main-body-container">
       <div class="ui stackable inverted divided grid">
           <div class="four wide column" style="padding-right:10%;">
		        <div class="ui inverted link list">
		            <img class="item" width="250px" height="auto;" src="img/footer-logo.png">
		            <a href="AboutPAASCU" class="item footer-text">About PAASCU</a>
		            <br>
		            <a href="BoardMembers" class="item footer-text">Board Members</a>
		            <br>
		            <a href="CommissionMembers" class="item footer-text">Commission Members</a>
		            <br>
		        	<a href="InternationalAffiliations" class="item footer-text">International Affiliations</a>
		            <br>
		        </div>
		    </div>
		    <div class="four wide column">
		        <h4 class="ui inverted header green">Our Members</h4>
		
		        <div class="ui inverted link list">
		            <a href="Members?educLevel=1" class="item footer-text">Elementary School</a>
		            <br>
		            <a href="Members?educLevel=2" class="item footer-text">Secondary School</a>
		            <br>
		            <a href="Members?educLevel=3" class="item footer-text">Integrated Basic Education</a>
		            <br>
		            <a href="Members?educLevel=4" class="item footer-text">Tertiary Education</a>
		            <br>
		            <a href="Members?educLevel=5" class="item footer-text">Graduate Education</a>
		            <br>
		            <a href="Members?educLevel=6" class="item footer-text">Medical Education</a>
		            <br>
		            <a href="Members?educLevel=7" class="item footer-text">CECSTE</a>
		         </div>
		    </div>
		
		    <div class="six wide column">
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
		    <!-- <div class="five wide column">
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
		    </div> -->
		</div>

        <br>
    </div>
</div>

</body>






</html>


