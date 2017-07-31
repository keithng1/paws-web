<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>

<c:out value="${news.getTitle()}"/>
</title>
    <meta charset="UTF-8">
    <!--Import Google Icon Font-->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <!--Import sementic.css components-->
      <link type="text/css" rel="stylesheet" href="css/semantic.css"/> 
      
        <link type="text/css" rel="stylesheet" href="components/icon.css"/> 
      
        
         <link type="text/css" rel="stylesheet" href="css/style.css"/> 
      
        
         <meta charset="UTF-8">


    <!--<link type="text/css" rel="stylesheet" href="css/style.css" />
    --><!--Let browser know website is optimized for mobile-->
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
  <a class="item active" href="newsList.jsp">
    News
  </a>
   <a class="item" href="calendarOfEvents.jsp">
       Calendar of Events
  </a>
   <a class="item" href="annualReports.jsp">
   Annual Reports
  </a>
  
 
 
</div>
        
         </div>    
        
        </div>
        

        
        
  <div class="thirteen wide column">
        
<h1 style="color: #45484c;"><c:out value="${news.getTitle()}"/></h1>        
      <hr>
           <div id="datePosted">Posted at <c:out value="${news.getDate()}"/></div>
      <br><br>
  
 
      
      
      <div id="image">
      
     <center> <img src="http://paascu.org.ph/wp-content/uploads/2015/09/asean-qa-700x350.jpg" style="width:100%; height:40%;"></center>
      
      </div>
      <br><br>
      
      <div id="newsContent" align="justify">
      		${news.getContent()} 
      </div>
      
      
      
      
      
      
      
          
        </div>
            
    </div>
                  
    <br><br><br>
            </div>
          <jsp:include page="footer.jsp" />
          
          
          
      </body>
      
      

      
      <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="http://cdn.jsdelivr.net/jquery.glide/1.0.6/jquery.glide.min.js"></script>
      
      <script type="text/javascript" src="js/semantic.min.js"></script>
     
      
<script>

$('.ui.dropdown')
  .dropdown()
;    
    
    
$('.slider').glide({
  autoplay: 2000,
  arrowsWrapperClass: 'slider-arrows',
  arrowRightText: '',
  arrowLeftText: '',

});
      
</script>
      
      
      
      
      
      
 
      
</html>