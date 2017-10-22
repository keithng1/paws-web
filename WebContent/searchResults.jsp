<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Results</title>
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!--Import sementic.css components-->
    <link type="text/css" rel="stylesheet" href="css/semantic.css" />

    <link type="text/css" rel="stylesheet" href="components/icon.css" />


    <link type="text/css" rel="stylesheet" href="css/style.css" />


    <meta charset="UTF-8">



 <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
 <script src="http://cdn.jsdelivr.net/jquery.glide/1.0.6/jquery.glide.min.js"></script>

 <script type="text/javascript" src="js/semantic.min.js"></script>

    <link type="text/css" rel="stylesheet" href="css/style.css" />
    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <style>
        @viewport {
            width: auto;
        }
    </style>

<script>


 $(document).ready(function() {

	document.getElementById("headerTitle").innerHTML = "Search results for ${searchWord}";

	 $.getJSON('search.json', function(data) {
		 
		 
		 if(data.length > 0)
		  $.each(data, function(key, value) {
			 if(value.content.toLowerCase().includes("${searchWord}".toLowerCase()))
			 {	 
				
				if(document.getElementById("noResults")!=null)
					document.getElementById("noResults").innerHTML = "";
				var item = document.createElement("div");
			 	item.setAttribute("class", "item");
			 	 
			 	var content = document.createElement("div");
			 	content.setAttribute("class", "content");
			 	 
			 	var a = document.createElement("a");
			 	a.setAttribute("class", "header");
				a.innerHTML = value.title;
				
				var meta = document.createElement("div");
			 	meta.setAttribute("class", "meta");
			 	
			 	var cinema = document.createElement("span");
			 	cinema.setAttribute("class", "cinema");
			 	
			 	if(value.href == "Downloads")
			 		cinema.innerHTML = "Downloads";
			 			
		 		else	
			 		cinema.innerHTML = "Accreditation";
						 	
			 	var description = document.createElement("div");
			 	description.setAttribute("class", "description");
			 	
			 	var p = document.createElement("p");
			 	if(value.content.length > 430)
			 		p.innerHTML = value.content.substring(0, 430) + "...";
			 	else
			 		p.innerHTML = value.content;
			 		
			 	var extra = document.createElement("div");
			 	extra.setAttribute("onclick", "location.href='"+value.href+"'");
			 	
			 	var uiLeft = document.createElement("div");
			 	uiLeft.setAttribute("class", "ui left floated primary button");
			 	uiLeft.innerHTML = "See More";
			 	
			 	var i = document.createElement("i");
			 	i.setAttribute("class", "right chevron icon");
			 	
			 	
			 	meta.appendChild(cinema);
			 	description.appendChild(p);
			 	uiLeft.appendChild(i);
			 	extra.appendChild(uiLeft);
			 	content.appendChild(a);
			 	content.appendChild(meta);
			 	content.appendChild(description);
			 	content.appendChild(document.createElement("br"));
			 	content.appendChild(extra);
			 	item.appendChild(content);
			 	
			 	document.getElementById("searchContents").appendChild(item);
			 }
		  });
		});
 });
  
</script>


</head>

<body>




    <jsp:include page="menubar.jsp" />



     <div class="main-body-container">

		<h1 id="headerTitle"></h1>
		<hr>
		<br>
		
		<c:if test = "${results.isEmpty()}">
        	<h5 id="noResults">No results found.</h5>
        </c:if>
       
      	<div class="ui sixteen wide column">
      		<div class="four wide column"></div>
      		<div class="twelve wide column">
		        <div class="ui divided items" id="searchContents">
		            <c:forEach items="${results}" var="result">
						<div class="item">
						    <div class="content">
						      <a class="header">${result.getTitle()}</a>
						      <div class="meta">
						        <span class="cinema">${result.getType()}</span>
						      </div>
						      <div class="description">
						        <p>${result.getParagraph()}</p>
						      </div>
						      <div class="extra" onclick="location.href='${result.getLink()}'">
						        <div class="ui left floated primary button">
						          See More
						          <i class="right chevron icon"></i>
						        </div>
						      </div>
						    </div>
						  </div>
					</c:forEach>
				 </div>
				 </div>
		</div>


        <br>
        <br>
        <br>


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