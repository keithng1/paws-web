<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Map of Member Institutions</title>
 <!--Import Google Icon Font-->
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        
      <!--Import sementic.css components-->
      <link type="text/css" rel="stylesheet" href="css/semantic.css"/> 
      
        <link type="text/css" rel="stylesheet" href="components/icon.css"/> 
      
        
         <link type="text/css" rel="stylesheet" href="css/style.css"/> 
      
        
         <meta charset="UTF-8">
        
        

        
        <link type="text/css" rel="stylesheet" href="css/style.css"/>
      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    
        
        

        
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script>
    google.charts.load('current', { 'packages': ['map'] });
    google.charts.setOnLoadCallback(drawMap);

    function drawMap() {
     var data = google.visualization.arrayToDataTable([
    ['Lat', 'Long', 'Name'],
    [14.5642946,120.9910141, 'De La Salle University'],
         [14.6040632,121.0375133, 'Xavier School'],
     [14.654562,121.0625378, 'University of The Philippines Diliman'],
    [14.6394557,121.0759028, 'Ateneo de Manila University']
  ]);
        
        
      

    var options = {
      showTooltip: true,
      showInfoWindow: true
    };

    var map = new google.visualization.Map(document.getElementById('chart_div'));

    map.draw(data, options);
  };
  </script>
        
        
        
        
        
        
        
        
        
        <style>
    @viewport { width: auto; }
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
    Our Members
  </p>
  <a class="item" href="members.jsp">
    A to Z
  </a>
   <a class="item"  href="membersElem.jsp">
   Elementary Education
  </a>
   <a class="item" href="membersSecondary.jsp">
   Secondary Education
  </a>
  <a class="item" href="membersBasic.jsp">
   Integrated Basic Education
  </a>
        
    <a class="item" href="membersTertiary.jsp">
   Tertiary Education
  </a>
        
    <a class="item" href="membersGrad.jsp">
   Graduate Education
  </a>
        
<a class="item" href="membersMed.jsp">
   Medical Education
  </a>
        
<a class="item" href="membersEng.jsp">
   Engineering, Computer Science & Technology Education
  </a>
        
        
<a class="item active" href="membersMap.jsp">
   Map View
  </a>
 
 
 
</div>
        
         </div> 
        
        </div>
        
        
        
        
  <div class="thirteen wide column body-text-about">
      
      
      
        
<h1 style="color: #45484c;">Members Map</h1>        
      <hr><br>
    
      
      
      
      
      
      
      
      
      
      
      <div id="chart_div"></div>
      
      
      <br>
    
      
         
<h2 style="color: #45484c;">Filters</h2>        
      <br>
      
      <div class="ui two column grid">
  <div class="row">
    <div class="column">
      
      
      
            
          
        
<h3 style="color: #45484c;">Region</h3>        
      <hr><br>  
      
      
        
        
<a class="institution-list">REGION I (Ilocos Region) in Luzon</a><br><br>
<a class="institution-list">REGION II (Cagayan Valley) in Luzon</a><br><br>
<a class="institution-list">REGION III (Central Luzon)</a><br><br>
<a class="institution-list">REGION IV-A (CALABARZON) Luzon</a><br><br>
<a class="institution-list">REGION IV-B(MIMAROPA) 17th region Visayas</a><br><br>
<a class="institution-list">REGION V(Bicol Region) Luzon</a><br><br>
<a class="institution-list">REGION VI (Western Visayas)</a><br><br>
<a class="institution-list">REGION VII (Central Visayas)</a><br><br>
<a class="institution-list">REGION VIII (Eastern Visayas)</a><br><br>
<a class="institution-list">REGION IX (Zamboanga Peninsula)</a><br><br>
<a class="institution-list">REGION X (Northern Mindanao)</a><br><br>
<a class="institution-list">REGION XI (Davao Region)</a><br><br>
<a class="institution-list">REGION XII (Soccsksargen)</a><br><br>
<a class="institution-list">(NCR) National Capital Region in Luzon</a><br><br>
<a class="institution-list">REGION XIV Cordillera Administrative Region (CAR) in Luzon</a><br><br>
<a class="institution-list">REGION XV - Autonomous Region in Muslim Mindanao (ARMM)</a><br><br>
<a class="institution-list">REGION XIII (CARAGA)</a><br><br>
<a class="institution-list">Region XVIII - NIR - Negros Island Region    </a><br><br>
        
        
      
      
      </div>
      
      
      
      
    <div class="column">
      
          
        
<h3 style="color: #45484c;">Education Level</h3>        
      <hr><br>  
      
     <a class="institution-list">  Elementary Education</a><br><br>
<a class="institution-list">Secondary Education</a><br><br>
<a class="institution-list">Tertiary Education</a><br><br>
<a class="institution-list">Graduate Education</a><br><br>
<a class="institution-list">Medical Education</a><br><br>
<a class="institution-list">Engineering, Computer Science & Technology Education</a><br><br>
      
      </div>
  
  </div>
  <div class="column">
          
          
      
          
        
<h3 style="color: #45484c;">City</h3>        
      <hr><br>  
                
 <a class="institution-list">Manila City</a><br><br>
<a class="institution-list">Quezon City</a><br><br>
<a class="institution-list">Makati City</a><br><br>
<a class="institution-list">Taguig City</a><br><br>
<a class="institution-list">Mandaluyong City</a><br><br>
<a class="institution-list">San Juan City</a><br><br>

</div>
  <div class="column"></div>
</div>
      
      
      
      
      
</div>

            
          
        
        
        
        
        
</div>
            
            
            
            
          
          
          </div>
          
    <br><br><br>
          
                          <jsp:include page="footer.jsp" />
          
          
      </body>
      
      
      

      
      <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      
      <script type="text/javascript" src="js/semantic.min.js"></script>
     
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