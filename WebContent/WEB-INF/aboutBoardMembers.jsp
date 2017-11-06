<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>About Board Members</title>





 <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
            <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      
      <script type="text/javascript" src="js/semantic.min.js"></script>
 
      <!--Import sementic.css components-->
      <link type="text/css" rel="stylesheet" href="css/semantic.css"/> 
      
        <link type="text/css" rel="stylesheet" href="components/icon.css"/> 
      
        
         <link type="text/css" rel="stylesheet" href="css/style.css"/> 
      
        
         <meta charset="UTF-8">
        
        

        
        <link type="text/css" rel="stylesheet" href="css/style.css"/>
      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    
      <style>
    @viewport { width: auto; }
</style>

<script>

	  $(document).ready(function() {
		  
  		$.getJSON("BoardMembersLoader", function(data) {
	  		if(data.length>0)
  			{
	  			
	  			$.each(data, function(key, value) {
	  				var year = value.year;
	  				$("#board-year").text(year);
	  				
		  			var span1 = document.createElement("b");
	        		var span2 = document.createElement("span");
	        		var span3 = document.createElement("span");
	        		var span4 = document.createElement("span");
	        	 	    
	            	span1.innerHTML = value.name;
	            	span2.innerHTML = value.position;
	            	span3.innerHTML = value.institution;
	            	span4.innerHTML = value.city;
	            	
	            	if(value.boardPositionID == 1)
		            {
	            		document.getElementById("containerPres").appendChild(span1);
		            	document.getElementById("containerPres").appendChild(document.createElement("br"));
		            	document.getElementById("containerPres").appendChild(span2);            	
		            	document.getElementById("containerPres").appendChild(document.createElement("br"));
		            	document.getElementById("containerPres").appendChild(span3);
		            	document.getElementById("containerPres").appendChild(document.createElement("br"));
		            	document.getElementById("containerPres").appendChild(span4);
		            	document.getElementById("containerPres").appendChild(document.createElement("br"));		            	
		            	document.getElementById("containerPres").appendChild(document.createElement("br"));
		            }
	            	else if(value.boardPositionID == 2)
		            {
	            		document.getElementById("containerVicePres").appendChild(span1);
		            	document.getElementById("containerVicePres").appendChild(document.createElement("br"));
		            	document.getElementById("containerVicePres").appendChild(span2);            	
		            	document.getElementById("containerVicePres").appendChild(document.createElement("br"));
		            	document.getElementById("containerVicePres").appendChild(span3);
		            	document.getElementById("containerVicePres").appendChild(document.createElement("br"));
		            	document.getElementById("containerVicePres").appendChild(span4);
		            	document.getElementById("containerVicePres").appendChild(document.createElement("br"));
		            	document.getElementById("containerVicePres").appendChild(document.createElement("br"));
		            }
	            	if(value.boardPositionID == 3)
		            {
	            		document.getElementById("containerSecretary").appendChild(span1);
		            	document.getElementById("containerSecretary").appendChild(document.createElement("br"));
		            	document.getElementById("containerSecretary").appendChild(span2);            	
		            	document.getElementById("containerSecretary").appendChild(document.createElement("br"));
		            	document.getElementById("containerSecretary").appendChild(span3);
		            	document.getElementById("containerSecretary").appendChild(document.createElement("br"));
		            	document.getElementById("containerSecretary").appendChild(span4);
		            	document.getElementById("containerSecretary").appendChild(document.createElement("br"));
		            	document.getElementById("containerSecretary").appendChild(document.createElement("br"));
			               
		            }
	            	
            	
      			});
  			}
	  		else
  			{
  				
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
    About
  </p>
  <a class="item" href="AboutPAASCU">
    About PAASCU
  </a>
   <a class="item active" href="BoardMembers">
   Board Members
  </a>
   <a class="item" href="CommissionMembers">
   Commission Members
  </a>
  <a class="item" href="InternationalAffiliations">
   International Affiliations
  </a>
 
 
 
</div>
        
         </div>    
        
        </div>
        
        
        
        
  <div class="thirteen wide column">
        
<h1 style="color: #45484c;">Board Members</h1>        
      <hr><br><br>
      
<center>
    <div class="directors">
    	
        <span style="font-size:18px;"><b>PAASCU BOARD OF DIRECTORS</b></span><br>
        <span id="board-year"></span><br><br>
        <span><b>PRESIDENT</b></span><br><br>
        <div id="containerPres">
	        <!-- <span id="president-name">FR. JOEL E. TABORA, SJ</span><br>
	        <span id="president-position">President</span><br>
	        <span id="president-school">Ateneo de Davao University</span><br>
	        <span id="president-address">Davao City</span><br> -->
		</div>
        <br>
        <span><b>VICE PRESIDENT</b></span><br>
        <br>
        <div id="containerVicePres">
	        <!-- <span id="vice-president-name">DR. RAMON L. ARCADIO</span><br>
	        <span id="vice-president-position">Professor Emeritus & Former Chancellor</span><br>
	        <span id="vice-president-school">University of the Philippines Manila</span><br>
	        <span id="vice-president-address">P.Gil St., Manila</span><br> -->
		</div>
        <br><br><br>
        <span><b>CORPORATE SECRETARY/TREASURER</b></span><br><br><br>
        
        
        
    </div>
  </center>

   
<div class="ui thirteen wide column">
    
  <div class="row">
      
      
    <div class="column">
      
      <center id="containerSecretary">
        
        <!-- <span id=cst8-name>DR. CARMELITA I. QUEBENGCO</span><br>
        <span id="cst8-position">Chancellor Emeritus</span><br>
        <span id="cst8-school">De La Salle University</span><br>
        <span id="cst8-address">Taft Avenue, Manila</span><br>
        <br>
        
        <span id=cst9-name>FR. ANTONIO S. SAMSON, SJ</span><br>
        <span id="cst9-position">Chairman of the Board</span><br>
        <span id="cst9-school">Ateneo de Iloilo</span><br>
        <span id="cst9-address">Iloilo City</span><br>
        <br>
          
        <span id=cst10-name>FR. ROMEO S. SANIEL, OMI</span><br>
        <span id="cst10-position">President</span><br>
        <span id="cst10-school">Notre Dame of Jolo College</span><br>
        <span id="cst10-address">Jolo, Sulu</span><br>
        <br>
        
        <span id=cst11-name>DR. HERMINIA D. TORRES</span><br>
        <span id="cst11-position">Board Member</span><br>
        <span id="cst11-school">La Salle University Ozamiz</span><br>
        <span id="cst11-address">Ozamiz City</span><br>
        <br>
          
        <span id=cst12-name>SR. MA. MARISSA R. VIRI, RVM</span><br>
        <span id="cst12-position">President</span><br>
        <span id="cst12-school">University of the Immaculate Conception</span><br>
        <span id="cst12-address">Davao City</span><br>
        <br>
        
          
        <span id=cst13-name>FR. JOHN CHRISTIAN U. YOUNG</span><br>
        <span id="cst13-position">President</span><br>
        <span id="cst13-school">Father Saturnino Urios University</span><br>
        <span id="cst13-address">Butuan City</span><br>
        <br>
          
          
        <span id=cst14-name>MS. CONCEPCION V. PIJANO</span><br>
        <span id="cst14-position">Executive Director</span><br>
        <br>
          
         -->
        
        </center>
      
      
      </div> 
  </div>      
      
      
      
      </div></div>     
</div>
            
            
            
            
          
          
          </div>
                  
    <br><br><br>
          
                    
      <jsp:include page="footer.jsp" />

          
     
</body>



      
      
      <script type="text/javascript">
      
if(screen.width>=1500){document.write("<style>body{zoom:80%;}</style>");}
if(screen.width>=2000){document.write("<style>body{zoom:100%;}</style>");}
if(screen.width>=2500){document.write("<style>body{zoom:120%;}</style>");}
      </script>    
      
<script>

$('.ui.dropdown')
  .dropdown()
;    
    
      
</script>
      
      



</html>


