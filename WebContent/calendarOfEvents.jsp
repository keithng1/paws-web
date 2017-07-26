<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Calendar of Events</title>  <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        
      <!--Import sementic.css components-->
      <link type="text/css" rel="stylesheet" href="css/semantic.css"/> 
      
        <link type="text/css" rel="stylesheet" href="components/icon.css"/> 
      
         <link type="text/css" rel="stylesheet" href="css/style.css"/> 

        <link type="text/css" rel="stylesheet" href="css/style.css"/>
      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<meta charset='utf-8' />
<link href='css/fullcalendar.min.css' rel='stylesheet' />
<link href='css/fullcalendar.print.min.css' rel='stylesheet' media='print' />
 <meta charset="UTF-8">
<style>

	body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		max-width: 900px;
		margin: 0 auto;
	}

    @viewport { width: auto; }


</style>
</head>
<body>
    
          
          
    <div class="ui nav" style="padding: 3%;">

     <div class="ui secondary menu navmenu">
    
    
    
             <div style="padding-right:5%;"><a href="index.jsp"><img src="img/logo.png"style=" width:200px; height: auto;">     </a>
         </div>     

      

  <div class="ui dropdown item">
  
   ABOUT  <i class="dropdown icon"></i>
    <div class="menu">
      <a class="item" href="aboutPaascu.jsp">About PAASCU</a>
      <a class="item"  href="aboutBoardMembers.jsp">Board Members</a>
      <a class="item"href="aboutCommissionMembers.jsp">Commission Members</a>
        <a class="item" href="aboutInternationalAffiliations.jsp">International Affiliation</a>
    </div>
  </div>
 
  <a class="item" href="newsList.jsp">
     NEWS
  </a>
  <a class="item"  href="accreditation.jsp">
     ACCREDITATION
  </a>
         
    <a class="item" href="members.jsp">
   OUR MEMBERS
  </a>     
         
    <a class="item" href="downloads.jsp">
   DOWNLOADS
  </a>
         
    <a class="item" href="contactUs.jsp">
    CONTACT
  </a>
  <div class="right menu">
    <div class="item">
      <div class="ui icon input">
        <input type="text" placeholder="Search...">
        <i class="search link icon"></i>
      </div>
    </div>
    
  </div>
</div>
    
 </div>
      
        
      
        <div class="main-body-container">
        
    <div class="ui grid">
  <div class="three wide column">
        
        
        

      
      
             
<div class="ui secondary vertical menu">
    <div class="sidebar-about">
  <p class="item" style="background-color: #45484c; color: white;">
   News
  </p>
  <a class="item" href="newsList.jsp">
    News
  </a>
   <a class="item active" href="calendarOfEvents.jsp">
       Calendar of Events
  </a>
   <a class="item" href="annualReports.jsp">
   Annual Reports
  </a>
  
 
 
</div>
        
         </div>    
        
        </div>
        
     
        
  <div class="thirteen wide column">
        
<h1 style="color: #45484c;">Calendar of Events</h1>        
      <hr><br><br>
       
<br><br>
	<div id='calendar'></div>
        </div></div></div>

    
    
    
    <br><br>
    
       <br><br><br>
        
      
  <div class="ui inverted vertical footer segment footerbg">
             <br><br><br>
            
            
    <div class="ui center aligned main-body-container">
      <div class="ui stackable inverted divided grid">
        <div class="four wide column" style="padding-right:10%;">
   
          <div class="ui inverted link list">
              <img class="item" width="250px" height="auto;" src="img/footer-logo.png">
            <a href="http://semantic-ui.com/examples/fixed.html#" class="item footer-text">History of PAASCU</a><br>
            <a href="http://semantic-ui.com/examples/fixed.html#" class="item footer-text">Objectives</a><br>
            <a href="http://semantic-ui.com/examples/fixed.html#" class="item footer-text">Board Memberss</a><br>
            <a href="http://semantic-ui.com/examples/fixed.html#" class="item footer-text">Commission Members</a><br>
          </div>
        </div>
        <div class="three wide column">
          <h4 class="ui inverted header green">Our Members</h4>
           
          <div class="ui inverted link list">
            <a href="http://semantic-ui.com/examples/fixed.html#" class="item footer-text">Elementary</a><br>
            <a href="http://semantic-ui.com/examples/fixed.html#" class="item footer-text">Highschool</a><br>
            <a href="http://semantic-ui.com/examples/fixed.html#" class="item footer-text">Basic Education</a><br>
            <a href="http://semantic-ui.com/examples/fixed.html#" class="item footer-text">Tertiary</a><br>
              <a href="http://semantic-ui.com/examples/fixed.html#" class="item footer-text">Graduate School</a><br>
              <a href="http://semantic-ui.com/examples/fixed.html#" class="item footer-text">Medical School</a><br>
          </div>
        </div>
          
        <div class="four wide column">
          <h4 class="ui inverted header green">Contact Us</h4>
          <div class="ui inverted link list">
              <span class="item footer-text"><i class="mail outline icon"></i>&nbsp;info@paascu.org.ph</span><br>
              <span class="item footer-text"><i class="marker icon"> </i>Unit 107 The Tower at Emerald Square
J.P. Rizal corner P. Tuazon Sts.,
1109 Quezon City </span><br>
                <span class="item footer-text"><i class="text telephone icon"> </i>(63 2) 911 2845, (63 2) 913 1998 <br>
(63 2) 439 0934, (63 2) 421 6227</span> <br>
                <span class="item footer-text"><i class="print icon"></i>&nbsp;(63 2) 911 0807</span><br>
          </div>
        </div>
        <div class="five wide column">
          <h4 class="ui inverted header green">Be Updated</h4>
          <p class=" footer-text">Signup for our newsletter!
            </p>
            
        <div class="ui input">
  <input type="text" placeholder="Name">
</div>
            
            <br><br>
            
            <div class="ui input">
  <input type="text" placeholder="Email">
</div>
            
            <br><br>
               <button class="ui green button">SIGN UP</button>
        </div>
      </div>
   
      <br>
      </div>
  </div>
          
         
    
    
    
    
    
    </body>
    
    
    
<script src='js/moment.min.js'></script>
<script src='js/jquery.min.js'></script>
<script src='js/fullcalendar.min.js'></script>

    
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
    
    
$('.slider').glide({
  autoplay: 2000,
  arrowsWrapperClass: 'slider-arrows',
  arrowRightText: '',
  arrowLeftText: '',

});
      
</script>
      
    
   <script> 
    

	$(document).ready(function() {
		
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,basicWeek,basicDay'
			},
			defaultDate: '2017-05-12',
			navLinks: true, // can click day/week names to navigate views
			editable: false,
			eventLimit: true, // allow "more" link when too many events
			events: [
				{
					title: 'All Day Event',
					start: '2017-05-01'
				},
				{
					title: 'Long Event',
					start: '2017-05-07',
					end: '2017-05-10'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2017-05-09T16:00:00'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2017-05-16T16:00:00'
				},
				{
					title: 'Conference',
					start: '2017-05-11',
					end: '2017-05-13'
				},
				{
					title: 'Meeting',
					start: '2017-05-12T10:30:00',
					end: '2017-05-12T12:30:00'
				},
				{
					title: 'Lunch',
					start: '2017-05-12T12:00:00'
				},
				{
					title: 'Meeting',
					start: '2017-05-12T14:30:00'
				},
				{
					title: 'Happy Hour',
					start: '2017-05-12T17:30:00'
				},
				{
					title: 'Dinner',
					start: '2017-05-12T20:00:00'
				},
				{
					title: 'Birthday Party',
					start: '2017-05-13T07:00:00'
				},
				{
					title: 'Click for Google',
					url: 'http://google.com/',
					start: '2017-05-28'
				}
			]
		});
		
	});

</script>
    
    
</html>
