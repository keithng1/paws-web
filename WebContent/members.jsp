<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Institution Members</title>
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
			function checkWidth(init)
			{
			    /*If browser resized, check width again */
			    if ($(window).width() < 1080) {
			        $('#divLetterPagination').addClass('vertical');
			    }
			    else {
			        if (!init) {
			            $('#divLetterPagination').removeClass('vertical');
			        }
			    }
			}
		</script>

		<script>

		  $(document).ready(function() {
			  
			  checkWidth(true);

			    $(window).resize(function() {
			        checkWidth(false);
		    	});
			  
			  for (var i = 65; i <= 90; i++) 
			  {
				  var a = document.createElement("a");
				  if(String.fromCharCode(i) == "${letter}")
					  a.setAttribute("class", "active item");
				  else
					  a.setAttribute("class", "item");
				  
				  (function(ii){
					  a.onclick = function() { 
						  loadFilteredInstitutions(String.fromCharCode(ii), 0);
						};
				    })(i);
				  
				  
				 
					
				  a.innerHTML = String.fromCharCode(i);
				  document.getElementById("divLetterPagination").appendChild(a);
			  }
			  
			  loadFilteredInstitutions("A", ${educLevel});
				  	
		  
		  });
		  
		  function loadFilteredByLevel(level)
		  {
			  $('#divLetterPagination').empty();
			  $('#instList').empty();
			  
			  $("#menuBarMembers a").each(function(){
				  if($(this).attr('id') == level)
				 {
					  $(this).removeClass();
					  $(this).addClass("active item");
						 
				 }
				  else 
				  {
					  $(this).removeClass();
				  	  $(this).addClass("item");
			  	  }
				  
					  
				});
			  
			  for (var i = 65; i <= 90; i++) 
			  {
				  var a = document.createElement("a");
				  if(i == 65)
					  a.setAttribute("class", "active item");
				  else
					  a.setAttribute("class", "item");
				  
				  (function(ii, level1){
					  a.onclick = function() { 
						  loadFilteredInstitutions(String.fromCharCode(ii), level1);
						};
				    })(i, level);
				  
				  
				 
					
				  a.innerHTML = String.fromCharCode(i);
				  document.getElementById("divLetterPagination").appendChild(a);
			  }
			  
			  loadFilteredInstitutions("A", level);
		  }
		  
		  function loadFilteredInstitutions(letter, level)
		  {
			  if(level == null)
				  level = 0;
			  
			  $("#menuBarMembers a").each(function(){
				  if($(this).attr('id') == level)
				 {
					  $(this).removeClass();
					  $(this).addClass("active item");
						 
				 }
				  else 
				  {
					  $(this).removeClass();
				  	  $(this).addClass("item");
			  	  }
				  
					  
				});
			  
			  $("#divLetterPagination a").each(function(){
				  if($(this).text() == letter)
				 {
					  $(this).addClass("active item");
						 
				 }
				  else 
				  {
					  $(this).removeClass();
				  	  $(this).addClass("item");
			  	  }
				  
					  
				});
		
			  $("#instList").empty();	
			  
              $.getJSON("MembersLoader?letter=" + letter + "&educLevel=" + level, function(data) {
                 		
            	  document.getElementById("totalInst").innerHTML = "Total institutions: " + data.length;
         			
               		if(data.length > 0)
               		{
               			$.each(data, function(key, value) {
                         	
	               			var aInst = document.createElement("a");
	    					aInst.setAttribute("class", "institution-list");
	  					    aInst.innerHTML = value.institutionName;
	  					    aInst.setAttribute("href", "Institution?institutionID=" + value.institutionID);
	  					    
	    					document.getElementById("instList").appendChild(aInst);
	  					    document.getElementById("instList").appendChild(document.createElement("br"));
	    					document.getElementById("instList").appendChild(document.createElement("br"));
               			});
               		}

               		else
            		{
               			var h4 = document.createElement("h4");
               			h4.innerHTML = "No institutions to display.";
               			document.getElementById("instList").appendChild(h4);
  					    
             		}

                  
              });
		  }
		</script>
    </head>

    <body>


        <jsp:include page="menubar.jsp" />

        <div class="main-body-container">

            <div class="ui stackable grid">
                <div class="three wide column">

                    <div class="ui secondary vertical menu">
                        <div class="sidebar-about" id="menuBarMembers">
                            <p class="item" style="background-color: #45484c; color: white;">
                                Our Members
                            </p>
                            <a class="item active" id = "0" onclick = "loadFilteredByLevel(0);">
						  	  A to Z
						 	 </a>
                            <a class="item" id = "1" onclick="loadFilteredByLevel(1);">
						   Elementary Education
						  </a>
                          <a class="item" id = "2" onclick="loadFilteredByLevel(2);">
						   Secondary Education
						  </a>
               	          <a class="item" id = "3 "onclick="loadFilteredByLevel(3);">
						   Integrated Basic Education
						  </a>
						
                          <a class="item" id = "4" onclick="loadFilteredByLevel(4);">
						   Tertiary Education
						  </a>
						
                          <a class="item" id = "5" onclick="loadFilteredByLevel(5);">
						   Graduate Education
						  </a>
						
                          <a class="item" id = "6" onclick="loadFilteredByLevel(6);">
						   Medical Education
						  </a>
						
           	              <a class="item" id = "7" onclick="loadFilteredByLevel(7);">
						   Engineering, Computer Science & Technology Education
						  </a>
						
						
						                            <a class="item" href="MembersMap">
						   Map View
						  </a>



                        </div>

                    </div>

                </div>




                <div class="thirteen wide column body-text-about">




                    <h1 style="color: #45484c;">Members A-Z</h1>
                    <hr>
                    <br>
                    <center>

                        <div class="ui pagination menu" id="divLetterPagination">
                        
                        </div>
                        
                    </center>
     				<h4 id="totalInst"></h4>
                    <!-- <h1 style="color: #45484c;" id="letter"></h1> -->
                   
					<div id="instList" style="margin-top: 2em;">
					
					</div>






                        </div>
                        <br>
                        <br>
                        <br>




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