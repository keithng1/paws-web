<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Us</title>





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
        	function submitMessage()
        	{	
        		if($.trim($('#name').val()) == '' || $.trim($('#email').val()) == '' || $.trim($('#message').val()) == '')
        		{
        		   alert('Required fields cannot be left blank.');
        		}     
        		      
        		else
       			{
        		    
        			var ip = "";
       		    	$.getJSON('//freegeoip.net/json/?callback=?', function(data) {
       		    	  	while(ip == "")
            			{
            				ip = data.ip;
               			}	
            			
       		    	})
       		    	.success(function() {submit(ip); alert("Message successfully sent!"); })
       		    	.error(function() { submit("No IP provided"); alert("Message successfully sent!");})
       		    	.complete(function() { submit("No IP provided");});
       		    	
       		   }
        		
        		
        	}
        	
        	function submit(ip)
        	{
        		  $.ajax({
        			url: 'Contact?' + $('#contactForm').serialize() + "&ip=" + ip,
        			type: 'POST',
        			async: false,
        			dataType: 'json',
        			success: function(result){
	        		}
        		 }); 
				
        		
  		      setTimeout(window.location.href = "ContactUs", 5000); 
        	}
        
        </script>



    </head>

    <body>


        <jsp:include page="menubar.jsp" />


        <div class="main-body-container">

            <div class="ui grid">
                

				<div class="eight wide column body-text-about">




                    <h1 style="color: #45484c;">Contact Us</h1>
                    <hr>
                    <br>



                    <p>Philippine Accrediting Association of Schools, Colleges and Universities</p>
                    <br>

                    <span>Unit 107 The Tower at Emerald Square</span>
                    <br>
                    <span>J.P. Rizal corner P. Tuazon Sts., 1109 Quezon City</span>
                    <br>
                    <span>Tel. Nos: 02-911-2845, 02-913-1998, 02-439-0934, 02-421-6227</span>
                    <br>
                    <span>Fax: 02–911-0807</span>
                    <br>
                    <span>E-mail: info@paascu.org.ph</span>
                    <br>
                    <span>www.paascu.org.ph</span>
                    <br>
                    <br>
                    <br>
                    <br>
              </div>
              <div class="eight wide column body-text-about">
              
                    <h2 style="color: #45484c;">Leave Us a Message</h2>
                    <hr>
                    <br>


					<form id="contactForm">
	                    

                    <div class="row">
                            <span style="color: red;"><b>*All fields are required.</b></span>
					    	
					    	<div class="ui two column grid">
	                            <div class="column">
	                                <div style="padding-bottom: 1%;">
	                                    <span style="color:red;">*</span><span style="color: black;"><b>Name</b></span>
	                                    <br></div>
	                                <div class="ui input" style="width: 100%;">
	                                    <input style="width:100%;" type="text" name="name" id="name">
	                                </div>
	
	
	                            </div>
	
	
	                            <div class="column">
	                                <div style="padding-bottom: 1%;">
	                                    <span style="color:red;">*</span><span style="color: black;"><b>Email</b></span>
	                                    <br> </div>
	                                <div class="ui input" style="width: 100%;">
	                                    <input style="width:100%;" type="email" id="email" name="email">
	                                </div>
	
	
	                            </div>
	
	                        </div>
						



                        <br>

                        <div class="row">

                            <div class="column">
                                <div style="padding-bottom: 1%;">
                                    <span style="color:red;">*</span><span style="color: black;"><b>Message</b></span>
                                    <br> </div>
                                <div class="field" style="width: 100%;">

                                    <textarea style="width: 100%; height: 25%; max-width: 100%;" id="message" name="message"></textarea>
                                </div>

                            </div>
                        </div>
                    </div>
                    	
                      </form>
                    <br>
                    <br>
                    <div class="ui green button" onclick="submitMessage();">Submit</div>
					
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