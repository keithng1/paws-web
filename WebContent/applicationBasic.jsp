<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Application for Basic Education</title>


  <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	    <script type="text/javascript" src="js/semantic.min.js"></script>

	  	<script type="text/javascript" src="js/jspdf.min.js"></script>
     	<script type="text/javascript" src="js/html2canvas.min.js"></script>



 <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        
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
			function genPDF()
			{
				var doc = new jsPDF();
				var institution = $('#institution').val();
				var address = $('#address').val();
				var totalEnrollment = $('#totalenrollment').val();
				var nFaculty = $('#nFaculty').val();
				var prefDate1 = $('#prefDate1').val();
				var prefDate2 = $('#prefDate2').val();
				var adminName = $('#adminName').val();
				var designation = $('#designation').val();
				
				var preliminary = $('#preliminary').val();
				var consultancy = $('#consultancy').val();
				var formal = $('#formal').val();
				var interim = $('#interim').val();
				var survey = $('#survey').val();
				
				doc.setFontSize(12);
				doc.setFontType("bold");
				doc.text(50, 20, "PHILIPPINE ACCREDITING ASSOCIATION OF SCHOOLS,");
				doc.text(75, 30, "COLLEGES AND UNIVERSITIES");
				doc.setFontType("normal");
				doc.text(70, 35, "Unit 107 The Tower at Emerald Square");
				doc.text(60, 40, "J.P. Rizal cor. P. Tuazon Sts., Project 4, Quezon City");
				doc.setFontType("bold");
				doc.text(70, 60, "APPLICATION FOR A SURVEY VISIT");
				doc.text(68, 70, "BASIC EDUCATION DEPARTMENT");
				
				doc.setFontType("normal");
				
				doc.text(30, 85, "INSTITUTION: ");
				doc.text(60, 85, institution);
				
				doc.text(30, 95, "ADDRESS: ");
				doc.text(60, 95, address);
				
				doc.text(30, 110, "Total Enrollment: ");
				doc.text(80, 110, totalEnrollment);
				
				doc.text(30, 125, "Number of Faculty Members: ");
				doc.text(100, 125, nFaculty);
				
				doc.text(30, 140, "Preferred Dates: ");
				doc.text(40, 150, prefDate1);
				doc.text(145, 150, prefDate2);
				
				doc.text(30, 170, "Type of Visit Expected: ");
				
				
				doc.text(80, 170, $('input[name=radioVisit]:checked', '#visitExpected').val());
				
				
				doc.text(40, 210, adminName);
				doc.text(125, 210, designation);
				
				
				doc.line(30, 215, 90, 215);
				doc.line(115, 215, 175, 215);
				
				doc.text(40, 220, "Administrator");
				doc.text(125, 220, "Designation");
				
				
				
				 var filename = "GradeSchoolApplication-" + institution + ".pdf";
		            doc.save(filename);
			}
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
    Downloads
  </p>
  <span class="item">
      <b>Application for Survey Visit</b>
  </span>
   <a class="item" style="padding-left: 20%;" href="applicationGradeSchool.jsp" >
   Grade School
  </a>
   <a class="item" style="padding-left: 20%;" href="applicationHighSchool.jsp">
   High School
  </a>
        
           
    <a class="item active" style="padding-left: 20%;" href="applicationBasic.jsp">
   Basic Education
  </a>
            
        
  <a class="item" style="padding-left: 20%;" href="applicationCollege.jsp">
   College
  </a>
        
    <a class="item" style="padding-left: 20%;" href="applicationMed.jsp">
   Medical Education
  </a>

 
   <span class="item">
      <b>Checklist of Materials</b>
  </span>
   <a class="item" style="padding-left: 20%;"  >
   Grade School
  </a>
   <a class="item" style="padding-left: 20%;" >
   High School
  </a>
        
           
    <a class="item" style="padding-left: 20%;" >
   Basic Education
  </a>
            
        
  <a class="item" style="padding-left: 20%;" >
   College
  </a>
        
    <a class="item" style="padding-left: 20%;" >
   Medical Education
  </a>

 
   <span class="item">
      <b>Materials in Headquarters</b>
  </span>
   <a class="item" style="padding-left: 20%;" >
   Grade School
  </a>
   <a class="item" style="padding-left: 20%;" >
   High School
  </a>
      
  <a class="item" style="padding-left: 20%;" >
   College
  </a>
        
 
 
        
</div>
        
         </div>    
        
        </div>
        
        
        
         <div class="thirteen wide column body-text-about">




                    <h1 style="color: #45484c;">Application for Survey Visit - Basic Education</h1>
                    <hr>
                    <br>
                    <br>
                    <br>



                    <div class="ui one column grid">
                        <div class="row">
                            <div class="column">
                                <div style="padding-bottom: 1%;">
                                    <span style="color: black;"><b>Institution</b></span>
                                    <br> </div>
                                <div class="ui input" style="width: 100%;">
                                    <input style="width:100%;" type="text" id="institution">
                                </div>


                            </div>

                        </div>


                        <div class="row">
                            <div class="column">
                                <div style="padding-bottom: 1%;">
                                    <span style="color: black;"><b>Address</b></span>
                                    <br> </div>
                                <div class="ui input" style="width: 100%;">
                                    <input type="text" id="address">
                                </div>


                            </div>

                        </div>



                        <div class="ui two column grid">
                            <div class="row">
                                <div class="column">


                                    <div class="ui two column grid">
                                        <div class="row">
                                            <div class="column">

                                                <div style="padding-bottom: 1%;">
                                                    <span style="color: black;"><b>Total Enrollment</b></span>
                                                    <br> </div>
                                                <div class="ui input" style="width: 100%;">
                                                    <input type="text" id="totalenrollment">
                                                </div>


                                            </div>


                                            <div class="column">

                                                <div style="padding-bottom: 1%;">
                                                    <span style="color: black;"><b>Number of Faculty Members</b></span>
                                                    <br> </div>
                                                <div class="ui input" style="width: 100%;">
                                                    <input type="text" id="nFaculty">
                                                </div>


                                            </div>


                                        </div>





                                        <div class="row">
                                            <div class="column">

                                                <div style="padding-bottom: 1%;">
                                                    <span style="color: black;"><b>Preferred Date 1</b></span>
                                                    <br> </div>
                                                <div class="ui input" style="width: 100%;">
                                                    <input type="text" id="prefDate1">
                                                </div>


                                            </div>


                                            <div class="column">

                                                <div style="padding-bottom: 1%;">
                                                    <span style="color: black;"><b>Preferred Date 2</b></span>
                                                    <br> </div>
                                                <div class="ui input" style="width: 100%;">
                                                    <input type="text"  id="prefDate2">
                                                </div>


                                            </div>


                                        </div>





                                    </div>


                                </div>



                                <div class="column">
                                    <div style="border-left: 2px solid">
                                        <div style="padding-left: 5%;">

                                            <div style="padding-bottom: 1%;">
                                                <span style="color: black;"><b>Type of Visit Expected</b></span>
                                                <br> 
                                            </div>
                                            <br>
                                            <form id="visitExpected">
                                            <div class="ui three column grid">
                                                <div class="row">
                                                    <div class="column">

                                                        <div class="ui radio checkbox">
                                                            <input type="radio" name="radioVisit" value="Preliminary">
                                                            <label>Preliminary</label>
                                                        </div>

                                                    </div>
                                                    <div class="column">


                                                        <div class="ui radio checkbox">
                                                            <input type="radio" name="radioVisit" value="Consultancy">
                                                            <label>Consultancy</label>
                                                        </div>

                                                    </div>


                                                </div>



                                                <div class="row">
                                                    <div class="column">

                                                        <div class="ui radio checkbox">
                                                            <input type="radio" name="radioVisit" value="Formal">
                                                            <label>Formal</label>
                                                        </div>

                                                    </div>
                                                    <div class="column">


                                                        <div class="ui radio checkbox">
                                                            <input type="radio" name="radioVisit" value="Interim">
                                                            <label>Interim</label>
                                                        </div>

                                                    </div>


                                                </div>




                                                <div class="row">
                                                    <div class="column">

                                                        <div class="ui radio checkbox">
                                                            <input type="radio" name="radio" value="Resurvey">
                                                            <label>Resurvey</label>
                                                        </div>

                                                    </div>
                                                    <div class="column">

                                                        &nbsp;
                                                    </div>


                                                </div>


                                            </div>
											</form>
                                            
                                        </div>
                                    </div>
                                </div>




                            </div>





                        </div>





                        <div class="ui two column grid">
                            <div class="row">
                                <div class="column">
                                    <div style="padding-bottom: 1%;">
                                        <span style="color: black;"><b>Administrator Name</b></span>
                                        <br> </div>
                                    <div class="ui input" style="width: 100%;">
                                        <input type="text" id="adminName">
                                    </div>
                                </div>
                                <div class="column">
                                    <div style="padding-bottom: 1%;">
                                        <span style="color: black;"><b>Designation</b></span>
                                        <br> </div>
                                    <div class="ui input" style="width: 100%;">
                                        <input type="text" id="designation">
                                    </div>


                                </div>





                            </div>

                            <br>



                        </div>

						<button onclick="genPDF();">Generate PDF</button>
                        <br>
                        <br>
                        <br>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <br>
        <br>
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