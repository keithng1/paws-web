<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About Commission Members</title>


	
	
	
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
		$(document).ready(function() {
  			for(var i = 1; i<8; i++)
	  			for(var j = 1; j<6; j++)
	  				$.getJSON("CommissionMembersLoader?positionID="+ j + "&educLevelID="+ i, function(data) {
	  				  	$.each(data, function(key, value) {
	  				  		if(value.educLevelID == 1)
	  		        		{
	  				  		 	if(value.commPosID == 1)
  				  		 		{
		  				  		 	var chair = document.getElementById("elemChair");
		  		        			var span1 = document.createElement("b");
		  		          			var span2 = document.createElement("span");
			  		          		var span3 = document.createElement("span");
			  		          		var span4 = document.createElement("span");
			  		          	 	    
			  		              	span1.innerHTML = value.name;
			  		              	span2.innerHTML = value.position;
			  		              	span3.innerHTML = value.institution;
			  		              	span4.innerHTML = value.city;
			  		              	
			  		              	chair.appendChild(span1);
			  		              	chair.appendChild(document.createElement("br"));
				  		            chair.appendChild(span2);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(span3);
			  		              	chair.appendChild(document.createElement("br"));
				  		          	chair.appendChild(span4);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
  				  		 		}
	  				  		 	else if(value.commPosID != 1 && value.commPosID!=5)
	  				  			{
		  				  		 	var chair = document.getElementById("elemViceCoChair");
		  		        			var span1 = document.createElement("b");
		  		          			var span2 = document.createElement("span");
			  		          		var span3 = document.createElement("span");
			  		          		var span4 = document.createElement("span");
			  		          	 	    
			  		              	span1.innerHTML = value.name;
			  		              	span2.innerHTML = value.position;
			  		              	span3.innerHTML = value.institution;
			  		              	span4.innerHTML = value.city;
			  		              	
			  		              	chair.appendChild(span1);
			  		              	chair.appendChild(document.createElement("br"));
				  		            chair.appendChild(span2);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(span3);
			  		              	chair.appendChild(document.createElement("br"));
				  		          	chair.appendChild(span4);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
  				  		 		}
		  				  		else
	  				  			{
		  				  		 	var chair = document.getElementById("elemMembers");
		  		        			var span1 = document.createElement("b");
		  		          			var span2 = document.createElement("span");
			  		          		var span3 = document.createElement("span");
			  		          		var span4 = document.createElement("span");
			  		          	 	    
			  		              	span1.innerHTML = value.name;
			  		              	span2.innerHTML = value.position;
			  		              	span3.innerHTML = value.institution;
			  		              	span4.innerHTML = value.city;
			  		              	
			  		              	chair.appendChild(span1);
			  		              	chair.appendChild(document.createElement("br"));
				  		            chair.appendChild(span2);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(span3);
			  		              	chair.appendChild(document.createElement("br"));
				  		          	chair.appendChild(span4);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
				  		 		}
	  		        			
		  		              	
	  		        		}
	  				  		else if(value.educLevelID == 2)
	  		        		{
	  		        			if(value.commPosID == 1)
  				  		 		{
		  				  		 	var chair = document.getElementById("secondaryChair");
		  		        			var span1 = document.createElement("b");
		  		          			var span2 = document.createElement("span");
			  		          		var span3 = document.createElement("span");
			  		          		var span4 = document.createElement("span");
			  		          	 	    
			  		              	span1.innerHTML = value.name;
			  		              	span2.innerHTML = value.position;
			  		              	span3.innerHTML = value.institution;
			  		              	span4.innerHTML = value.city;
			  		              	
			  		              	chair.appendChild(span1);
			  		              	chair.appendChild(document.createElement("br"));
				  		            chair.appendChild(span2);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(span3);
			  		              	chair.appendChild(document.createElement("br"));
				  		          	chair.appendChild(span4);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
  				  		 		}
	  				  		 	else if(value.commPosID != 1 && value.commPosID!=5)
	  				  			{
		  				  		 	var chair = document.getElementById("secondaryViceCoChair");
		  		        			var span1 = document.createElement("b");
		  		          			var span2 = document.createElement("span");
			  		          		var span3 = document.createElement("span");
			  		          		var span4 = document.createElement("span");
			  		          	 	    
			  		              	span1.innerHTML = value.name;
			  		              	span2.innerHTML = value.position;
			  		              	span3.innerHTML = value.institution;
			  		              	span4.innerHTML = value.city;
			  		              	
			  		              	chair.appendChild(span1);
			  		              	chair.appendChild(document.createElement("br"));
				  		            chair.appendChild(span2);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(span3);
			  		              	chair.appendChild(document.createElement("br"));
				  		          	chair.appendChild(span4);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
  				  		 		}
		  				  		else
	  				  			{
		  				  		 	var chair = document.getElementById("secondaryMembers");
		  		        			var span1 = document.createElement("b");
		  		          			var span2 = document.createElement("span");
			  		          		var span3 = document.createElement("span");
			  		          		var span4 = document.createElement("span");
			  		          	 	    
			  		              	span1.innerHTML = value.name;
			  		              	span2.innerHTML = value.position;
			  		              	span3.innerHTML = value.institution;
			  		              	span4.innerHTML = value.city;
			  		              	
			  		              	chair.appendChild(span1);
			  		              	chair.appendChild(document.createElement("br"));
				  		            chair.appendChild(span2);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(span3);
			  		              	chair.appendChild(document.createElement("br"));
				  		          	chair.appendChild(span4);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
				  		 		}
	  		        			
	  		        		}
	  				  		else if(value.educLevelID == 3)
  		        			{
  		        				if(value.commPosID == 1)
  				  		 		{
		  				  		 	var chair = document.getElementById("basicEdChair");
		  		        			var span1 = document.createElement("b");
		  		          			var span2 = document.createElement("span");
			  		          		var span3 = document.createElement("span");
			  		          		var span4 = document.createElement("span");
			  		          	 	    
			  		              	span1.innerHTML = value.name;
			  		              	span2.innerHTML = value.position;
			  		              	span3.innerHTML = value.institution;
			  		              	span4.innerHTML = value.city;
			  		              	
			  		              	chair.appendChild(span1);
			  		              	chair.appendChild(document.createElement("br"));
				  		            chair.appendChild(span2);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(span3);
			  		              	chair.appendChild(document.createElement("br"));
				  		          	chair.appendChild(span4);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
  				  		 		}
	  				  		 	else if(value.commPosID != 1 && value.commPosID!=5)
	  				  			{
		  				  		 	var chair = document.getElementById("basicEdViceCoChair");
		  		        			var span1 = document.createElement("b");
		  		          			var span2 = document.createElement("span");
			  		          		var span3 = document.createElement("span");
			  		          		var span4 = document.createElement("span");
			  		          	 	    
			  		              	span1.innerHTML = value.name;
			  		              	span2.innerHTML = value.position;
			  		              	span3.innerHTML = value.institution;
			  		              	span4.innerHTML = value.city;
			  		              	
			  		              	chair.appendChild(span1);
			  		              	chair.appendChild(document.createElement("br"));
				  		            chair.appendChild(span2);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(span3);
			  		              	chair.appendChild(document.createElement("br"));
				  		          	chair.appendChild(span4);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
  				  		 		}
		  				  		else
	  				  			{
		  				  		 	var chair = document.getElementById("basicEdMembers");
		  		        			var span1 = document.createElement("b");
		  		          			var span2 = document.createElement("span");
			  		          		var span3 = document.createElement("span");
			  		          		var span4 = document.createElement("span");
			  		          	 	    
			  		              	span1.innerHTML = value.name;
			  		              	span2.innerHTML = value.position;
			  		              	span3.innerHTML = value.institution;
			  		              	span4.innerHTML = value.city;
			  		              	
			  		              	chair.appendChild(span1);
			  		              	chair.appendChild(document.createElement("br"));
				  		            chair.appendChild(span2);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(span3);
			  		              	chair.appendChild(document.createElement("br"));
				  		          	chair.appendChild(span4);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
				  		 		}
	  		        			
  		        			}
		  				  	else if(value.educLevelID == 4)
			        		{
			        			if(value.commPosID == 1)
  				  		 		{
		  				  		 	var chair = document.getElementById("tertiaryChair");
		  		        			var span1 = document.createElement("b");
		  		          			var span2 = document.createElement("span");
			  		          		var span3 = document.createElement("span");
			  		          		var span4 = document.createElement("span");
			  		          	 	    
			  		              	span1.innerHTML = value.name;
			  		              	span2.innerHTML = value.position;
			  		              	span3.innerHTML = value.institution;
			  		              	span4.innerHTML = value.city;
			  		              	
			  		              	chair.appendChild(span1);
			  		              	chair.appendChild(document.createElement("br"));
				  		            chair.appendChild(span2);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(span3);
			  		              	chair.appendChild(document.createElement("br"));
				  		          	chair.appendChild(span4);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
  				  		 		}
	  				  		 	else if(value.commPosID != 1 && value.commPosID!=5)
	  				  			{
		  				  		 	var chair = document.getElementById("tertiaryViceCoChair");
		  		        			var span1 = document.createElement("b");
		  		          			var span2 = document.createElement("span");
			  		          		var span3 = document.createElement("span");
			  		          		var span4 = document.createElement("span");
			  		          	 	    
			  		              	span1.innerHTML = value.name;
			  		              	span2.innerHTML = value.position;
			  		              	span3.innerHTML = value.institution;
			  		              	span4.innerHTML = value.city;
			  		              	
			  		              	chair.appendChild(span1);
			  		              	chair.appendChild(document.createElement("br"));
				  		            chair.appendChild(span2);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(span3);
			  		              	chair.appendChild(document.createElement("br"));
				  		          	chair.appendChild(span4);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
  				  		 		}
		  				  		else
	  				  			{
		  				  		 	var chair = document.getElementById("tertiaryMembers");
		  		        			var span1 = document.createElement("b");
		  		          			var span2 = document.createElement("span");
			  		          		var span3 = document.createElement("span");
			  		          		var span4 = document.createElement("span");
			  		          	 	    
			  		              	span1.innerHTML = value.name;
			  		              	span2.innerHTML = value.position;
			  		              	span3.innerHTML = value.institution;
			  		              	span4.innerHTML = value.city;
			  		              	
			  		              	chair.appendChild(span1);
			  		              	chair.appendChild(document.createElement("br"));
				  		            chair.appendChild(span2);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(span3);
			  		              	chair.appendChild(document.createElement("br"));
				  		          	chair.appendChild(span4);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
				  		 		}
	  		        			
			        		}
			  				else if(value.educLevelID == 5)
			        		{
			        			if(value.commPosID == 1)
  				  		 		{
		  				  		 	var chair = document.getElementById("gradChair");
		  		        			var span1 = document.createElement("b");
		  		          			var span2 = document.createElement("span");
			  		          		var span3 = document.createElement("span");
			  		          		var span4 = document.createElement("span");
			  		          	 	    
			  		              	span1.innerHTML = value.name;
			  		              	span2.innerHTML = value.position;
			  		              	span3.innerHTML = value.institution;
			  		              	span4.innerHTML = value.city;
			  		              	
			  		              	chair.appendChild(span1);
			  		              	chair.appendChild(document.createElement("br"));
				  		            chair.appendChild(span2);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(span3);
			  		              	chair.appendChild(document.createElement("br"));
				  		          	chair.appendChild(span4);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
  				  		 		}
	  				  		 	else if(value.commPosID != 1 && value.commPosID!=5)
	  				  			{
		  				  		 	var chair = document.getElementById("gradViceCoChair");
		  		        			var span1 = document.createElement("b");
		  		          			var span2 = document.createElement("span");
			  		          		var span3 = document.createElement("span");
			  		          		var span4 = document.createElement("span");
			  		          	 	    
			  		              	span1.innerHTML = value.name;
			  		              	span2.innerHTML = value.position;
			  		              	span3.innerHTML = value.institution;
			  		              	span4.innerHTML = value.city;
			  		              	
			  		              	chair.appendChild(span1);
			  		              	chair.appendChild(document.createElement("br"));
				  		            chair.appendChild(span2);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(span3);
			  		              	chair.appendChild(document.createElement("br"));
				  		          	chair.appendChild(span4);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
  				  		 		}
		  				  		else
	  				  			{
		  				  		 	var chair = document.getElementById("gradMembers");
		  		        			var span1 = document.createElement("b");
		  		          			var span2 = document.createElement("span");
			  		          		var span3 = document.createElement("span");
			  		          		var span4 = document.createElement("span");
			  		          	 	    
			  		              	span1.innerHTML = value.name;
			  		              	span2.innerHTML = value.position;
			  		              	span3.innerHTML = value.institution;
			  		              	span4.innerHTML = value.city;
			  		              	
			  		              	chair.appendChild(span1);
			  		              	chair.appendChild(document.createElement("br"));
				  		            chair.appendChild(span2);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(span3);
			  		              	chair.appendChild(document.createElement("br"));
				  		          	chair.appendChild(span4);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
				  		 		}
	  		        			
			        		}
		  					else if(value.educLevelID == 6)
			        		{
			        			if(value.commPosID == 1)
  				  		 		{
		  				  		 	var chair = document.getElementById("medChair");
		  		        			var span1 = document.createElement("b");
		  		          			var span2 = document.createElement("span");
			  		          		var span3 = document.createElement("span");
			  		          		var span4 = document.createElement("span");
			  		          	 	    
			  		              	span1.innerHTML = value.name;
			  		              	span2.innerHTML = value.position;
			  		              	span3.innerHTML = value.institution;
			  		              	span4.innerHTML = value.city;
			  		              	
			  		              	chair.appendChild(span1);
			  		              	chair.appendChild(document.createElement("br"));
				  		            chair.appendChild(span2);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(span3);
			  		              	chair.appendChild(document.createElement("br"));
				  		          	chair.appendChild(span4);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
  				  		 		}
	  				  		 	else if(value.commPosID != 1 && value.commPosID!=5)
	  				  			{
		  				  		 	var chair = document.getElementById("medViceCoChair");
		  		        			var span1 = document.createElement("b");
		  		          			var span2 = document.createElement("span");
			  		          		var span3 = document.createElement("span");
			  		          		var span4 = document.createElement("span");
			  		          	 	    
			  		              	span1.innerHTML = value.name;
			  		              	span2.innerHTML = value.position;
			  		              	span3.innerHTML = value.institution;
			  		              	span4.innerHTML = value.city;
			  		              	
			  		              	chair.appendChild(span1);
			  		              	chair.appendChild(document.createElement("br"));
				  		            chair.appendChild(span2);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(span3);
			  		              	chair.appendChild(document.createElement("br"));
				  		          	chair.appendChild(span4);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
  				  		 		}
		  				  		else
	  				  			{
		  				  		 	var chair = document.getElementById("medMembers");
		  		        			var span1 = document.createElement("b");
		  		          			var span2 = document.createElement("span");
			  		          		var span3 = document.createElement("span");
			  		          		var span4 = document.createElement("span");
			  		          	 	    
			  		              	span1.innerHTML = value.name;
			  		              	span2.innerHTML = value.position;
			  		              	span3.innerHTML = value.institution;
			  		              	span4.innerHTML = value.city;
			  		              	
			  		              	chair.appendChild(span1);
			  		              	chair.appendChild(document.createElement("br"));
				  		            chair.appendChild(span2);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(span3);
			  		              	chair.appendChild(document.createElement("br"));
				  		          	chair.appendChild(span4);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
				  		 		}
	  		        			
			        		}
			  				else if(value.educLevelID == 7)
			        		{
			  					if(value.commPosID == 1)
  				  		 		{
		  				  		 	var chair = document.getElementById("cecsteChair");
		  		        			var span1 = document.createElement("b");
		  		          			var span2 = document.createElement("span");
			  		          		var span3 = document.createElement("span");
			  		          		var span4 = document.createElement("span");
			  		          	 	    
			  		              	span1.innerHTML = value.name;
			  		              	span2.innerHTML = value.position;
			  		              	span3.innerHTML = value.institution;
			  		              	span4.innerHTML = value.city;
			  		              	
			  		              	chair.appendChild(span1);
			  		              	chair.appendChild(document.createElement("br"));
				  		            chair.appendChild(span2);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(span3);
			  		              	chair.appendChild(document.createElement("br"));
				  		          	chair.appendChild(span4);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
  				  		 		}
	  				  		 	else if(value.commPosID != 1 && value.commPosID!=5)
	  				  			{
		  				  		 	var chair = document.getElementById("cecsteViceCoChair");
		  		        			var span1 = document.createElement("b");
		  		          			var span2 = document.createElement("span");
			  		          		var span3 = document.createElement("span");
			  		          		var span4 = document.createElement("span");
			  		          	 	    
			  		              	span1.innerHTML = value.name;
			  		              	span2.innerHTML = value.position;
			  		              	span3.innerHTML = value.institution;
			  		              	span4.innerHTML = value.city;
			  		              	
			  		              	chair.appendChild(span1);
			  		              	chair.appendChild(document.createElement("br"));
				  		            chair.appendChild(span2);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(span3);
			  		              	chair.appendChild(document.createElement("br"));
				  		          	chair.appendChild(span4);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
  				  		 		}
		  				  		else
	  				  			{
		  				  		 	var chair = document.getElementById("cecsteMembers");
		  		        			var span1 = document.createElement("b");
		  		          			var span2 = document.createElement("span");
			  		          		var span3 = document.createElement("span");
			  		          		var span4 = document.createElement("span");
			  		          	 	    
			  		              	span1.innerHTML = value.name;
			  		              	span2.innerHTML = value.position;
			  		              	span3.innerHTML = value.institution;
			  		              	span4.innerHTML = value.city;
			  		              	
			  		              	chair.appendChild(span1);
			  		              	chair.appendChild(document.createElement("br"));
				  		            chair.appendChild(span2);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(span3);
			  		              	chair.appendChild(document.createElement("br"));
				  		          	chair.appendChild(span4);
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
			  		              	chair.appendChild(document.createElement("br"));
				  		 		}
			        		}
			  				
	  					});
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
                                About
                            </p>
                            <a class="item" href="aboutPaascu.jsp">
    About PAASCU
  </a>
                            <a class="item" href="aboutBoardMembers.jsp">
   Board Members
  </a>
                            <a class="item active" href="aboutCommissionMembers.jsp">Commission Members</a>
                            <a class="item padded-menu-item" href="#elementary">Elementary Education</a>
                            <a class="item padded-menu-item" href="#secondary">Secondary Education</a>
                            <a class="item padded-menu-item">Integrated Basic Education</a>
                            <a class="item padded-menu-item" href="#tertiary">Tertiary Education</a>
                            <a class="item padded-menu-item" href="#med">Graduate Education</a>
                            <a class="item padded-menu-item" href="#med">Medical Education</a>
                            <a class="item padded-menu-item" href="#cecste">Engineering, Computer Science & Technology Education</a>

                            <a class="item" href="internationalAffiliations.jsp">
   International Affiliations
  </a>



                        </div>

                    </div>

                </div>




                <div class="thirteen wide column">

                    <h1 style="color: #45484c;">Commision Members</h1>
                    <hr>
                    <br>
                    <br>

                    <center>
                        <div class="directors">

                            <span style="font-size:18px;"><b>PHILIPPINE ACCREDITING ASSOCIATION OF SCHOOLS, COLLEGES AND UNIVERSITIES</b></span>
                            <br>
                            <span id="elementary"><b>COMMISSION ON ELEMENTARY EDUCATION</b></span>
                            <br>
                            <span id="commission-elem-year">2015</span>
                            <br>
                            <br>
                            <br>
                            
                            <div id="elemChair">
	                            <span>CHAIR</span>
	                            <br>
	                            <br>

							</div>
                            
                            <div id="elemViceCoChair"> 
                            	
							</div>

                            <div id="elemMembers"> 
                            	
							</div>



                            <span id="secondary"><b>COMMISSION ON SECONDARY EDUCATION</b></span>
                            <br>
                            <span id="commission-secondary-year">2015</span>
                            <br>
                            <br>
                            <br>
							<div id="secondaryChair">
	                            <span>CHAIR</span>
	                            <br>
	                            <br>

							</div>
                            
                            <div id="secondaryViceCoChair"> 
                            	
							</div>

                            <div id="secondaryMembers"> 
                            	
							</div>
							


                            <br>
                            <br>

                            <span id="basiced"><b>COMMISSION ON INTEGRATED BASIC EDUCATION</b></span>
                            <br><span id="commission-basic-year">2015</span>
                            <br>
                            <br>
                            <br>	
							<div id="basicEdChair">
	                            <span>CHAIR</span>
	                            <br>
	                            <br>

							</div>
                            
                            <div id="basicEdViceCoChair"> 
                            	
							</div>

                            <div id="basicEdMembers"> 
                            	
							</div>
                            <br>
                            <br>


                            <br>
                            <br>

                            <span id="tertiary"><b>COMMISSION ON TERTIARY EDUCATION</b></span>
                            <br><span id="commission-tertiary-year">2015</span>
                            <br>
                            <br>
                            <br>
                            <div id="tertiaryChair">
	                            <span>CHAIR</span>
	                            <br>
	                            <br>

							</div>
                            
                            <div id="tertiaryViceCoChair"> 
                            	
							</div>

                            <div id="tertiaryMembers"> 
                            	
							</div>
							<br>
                            <br>



                            <br>
                            <br>

                            <span id="grad"><b>COMMISSION ON GRADUATE EDUCATION</b></span>
                            <br><span id="commission-grad-year">2015</span>
                            <br>
                            <br>
                            <br> <div id="gradChair">
	                            <span>CHAIR</span>
	                            <br>
	                            <br>

							</div>
                            
                            <div id="gradViceCoChair"> 
                            	
							</div>

                            <div id="gradMembers"> 
                            	
							</div>
							<br>
                            <br>


                            <br>
                            <br>

                            <span id="med"><b>COMMISSION ON MEDICINAL EDUCATION</b></span>
                            <br><span id="commission-med-year">2015</span>
                            <br>
                            <br> <div id="medChair">
	                            <span>CHAIR</span>
	                            <br>
	                            <br>

							</div>
                            
                            <div id="medViceCoChair"> 
                            	
							</div>

                            <div id="medMembers"> 
                            	
							</div>
                            <br>
                            <br>





                            <br>
                            <br>

                            <span id="cecste"><b>COMMISSION ON ENGINEERING, COMPUTER SCIENCE & TECHNOLOGY EDUCATION (CECSTE)</b></span>
                            <br>
                            <span id="commission-cecste-year">2015</span>
                            <br>
                            <br>
                            <br>
                            <br> <div id="cecsteChair">
	                            <span>CHAIR</span>
	                            <br>
	                            <br>

							</div>
                            
                            <div id="cecsteViceCoChair"> 
                            	
							</div>

                            <div id="cecsteMembers"> 
                            	
							</div>
                            <br>
                            <br>
                            


                        </div>
                    </center>
                </div>
            </div>





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
    </script>

    </html>