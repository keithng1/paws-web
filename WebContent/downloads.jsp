<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Application</title>


        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="js/semantic.min.js"></script>

        <script type="text/javascript" src="js/jspdf.min.js"></script>
        <script type="text/javascript" src="js/html2canvas.min.js"></script>



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
	    	var x = 0;
	    	var department = "";
	
	        $(document).ready(function() {
	        	
	        	 $('input[name=chooseOption]').on('input',function() {
	        		    var selectedOption = $('option[value="'+$(this).val()+'"]');
	        			var id = selectedOption.attr('id');
	        		    
	        		    if(id!=null)
	        		    {
	        				$.getJSON("AddressLoader?instID=" + selectedOption.attr('id') , function(data) {
			       				
			       				if(data.length > 0)
			               		{
			       					$.each(data, function(key, value) {
			                         	
				               			document.getElementById("address").value = value.address;
			               			});
			               		}
			       				
			       			});
	        		    }
	        	 });
	        	 
	       			$.getJSON("InstitutionsLoader", function(data) {
	       				
	       				if(data.length > 0)
	               		{
	               			$.each(data, function(key, value) {
	                         	
		               			var aInst = document.createElement("option");
		               			aInst.setAttribute("value", value.institutionName);
		  					    aInst.setAttribute("id", value.institutionID);
		  					    
		    					document.getElementById("institutionList").appendChild(aInst);
	               			});
	               		}
	       				
	       			});
	       	
	               $("#schoolLevel").html("Application for Survey Visit - Grade School");
	               x=70;
	               department = "GRADE SCHOOL DEPARTMENT";
	           
	               
	               $('#gradeSchool').click(function() {
	                   $("#schoolLevel").html("Application for Survey Visit - Grade School");
	                   x=70;
	                   department = "GRADE SCHOOL DEPARTMENT";
	                   return false;
	               });
	
	               $('#highSchool').click(function() {
	                   $("#schoolLevel").html("Application for Survey Visit - High School");
	                   x=72;
	                   department = "HIGH SCHOOL DEPARTMENT";
	                   return false;
	               });
	
	               $('#basic').click(function() {
	                   $("#schoolLevel").html("Application for Survey Visit - Basic Education");
	                   x=67;
	                   department = "BASIC EDUCATION DEPARTMENT";
	                   return false;
	               });
	
	               $('#med').click(function() {
	                   $("#schoolLevel").html("Application for Survey Visit - MEDICAL EDUCATION");
	                   x=77;
	                   department = "MEDICAL DEPARTMENT";
	                   return false;
	               });
	
	               $('#college').click(function() {
	                   $("#schoolLevel").html("Application for Survey Visit - COLLEGE DEPARTMENT");
	                   x=76;
	                   department = "COLLEGE DEPARTMENT";
	                   return false;
	               });
	
	
	               $('.sidebar-about a').click(function(e) {
	                   e.preventDefault();
	                   $('a').removeClass('active');
	                   $(this).addClass('active');
	               });
	
	       });

        	
            function genPDF() {
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
                doc.text(45, 25, "PHILIPPINE ACCREDITING ASSOCIATION OF SCHOOLS,");
                doc.text(70, 30, "COLLEGES AND UNIVERSITIES");
                doc.setFontType("normal");
                doc.text(65, 35, "Unit 107 The Tower at Emerald Square");
                doc.text(53, 40, "J.P. Rizal cor. P. Tuazon Sts., Project 4, Quezon City");
                doc.setFontType("bold");
                doc.text(65, 60, "APPLICATION FOR A SURVEY VISIT");
                doc.text(x, 70, department);
               
                
                doc.setFontType("normal");

                doc.text(30, 85, "INSTITUTION: ");
                doc.text(65, 85, institution);
                doc.text(60, 85, "__________________________________________________");
                
                
                doc.text(30, 95, "ADDRESS: ");
                doc.text(60, 95, address);
                doc.text(55, 95, "____________________________________________________");

                doc.text(30, 110, "Total Enrollment: ");
                doc.text(70, 110, totalEnrollment);
                doc.text(65, 110, "________________________________________________");

                doc.text(30, 125, "Number of Faculty Members: ");
                doc.text(92, 125, nFaculty);
                doc.text(87, 125, "_______________________________________");

                doc.text(30, 140, "Preferred Dates: ");
                doc.text(40, 150, prefDate1);
                doc.text(125, 150, prefDate2);
				doc.text(30, 150, "___________________________");
				doc.text(115, 150, "___________________________");

                doc.text(30, 170, "Type of Visit Expected: ");
                doc.text(77, 170, "___________________________________________");

				var type = $('input[name=radioVisit]:checked', '#visitExpected').val();
				if(type==null)
					type = "";
                doc.text(80, 170, type);


                doc.text(40, 210, adminName);
                doc.text(125, 210, designation);
				doc.text(30, 210, "___________________________");
				doc.text(115, 210, "___________________________");

                doc.text(46, 220, "Administrator");
                doc.text(134, 220, "Designation");



                var filename = "Application-" + institution + ".pdf";
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
                            <a class="item active" style="padding-left: 20%;" id="gradeSchool">
   Grade School
  </a>
                            <a class="item" style="padding-left: 20%;" id="highSchool">
   High School
  </a>


                            <a class="item" style="padding-left: 20%;" id="basic">
   Basic Education
  </a>


                            <a class="item" style="padding-left: 20%;" id="college">
   College
  </a>

                            <a class="item" style="padding-left: 20%;" id="med">
   Medical Education
  </a>


                            <span class="item">
      <b>Checklist of Materials</b>
  </span>
                            <a class="item" style="padding-left: 20%;">
   Grade School
  </a>
                            <a class="item" style="padding-left: 20%;">
   High School
  </a>


                            <a class="item" style="padding-left: 20%;">
   Basic Education
  </a>


                            <a class="item" style="padding-left: 20%;">
   College
  </a>

                            <a class="item" style="padding-left: 20%;">
   Medical Education
  </a>


                            <span class="item">
      <b>Materials in Headquarters</b>
  </span>
                            <a class="item" style="padding-left: 20%;">
   Grade School
  </a>
                            <a class="item" style="padding-left: 20%;">
   High School
  </a>

                            <a class="item" style="padding-left: 20%;">
   College
  </a>




                        </div>

                    </div>

                </div>



                <div class="thirteen wide column body-text-about">
                    <h1 id="schoolLevel" style="color: #45484c;"></h1>
                    <hr>
                    <br>
                  


                    <div class="ui one column grid">
                        <div class="row">
                            <div class="column">
                                <div style="padding-bottom: 1%;">
                                    <span style="color: black;"><b>Institution</b></span>
                                    <br> </div>
                                <div class="ui input" style="width: 100%;">
                                    <input style="width:100%;" type="text" name="chooseOption" id="institution" list="institutionList">
                                    <datalist id="institutionList">
									    
									</datalist>
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
                                                    <input type="text" id="prefDate2">
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
                                                                <input type="radio" name="radioVisit" value="Resurvey">
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

                        <button class="ui green button" onclick="genPDF();">Generate PDF</button>
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