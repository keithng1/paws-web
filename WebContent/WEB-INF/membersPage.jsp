<html>

<head>
    <!--Import Google Icon Font-->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!--Import sementic.css components-->
    <link type="text/css" rel="stylesheet" href="css/semantic.css" />

    <link type="text/css" rel="stylesheet" href="components/icon.css" />




    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="http://cdn.jsdelivr.net/jquery.glide/1.0.6/jquery.glide.min.js"></script>

    <script type="text/javascript" src="js/semantic.min.js"></script>
    <link type="text/css" rel="stylesheet" href="css/style.css" />


    <meta charset="UTF-8">

	<title>${instName}</title>
    


    <link type="text/css" rel="stylesheet" href="css/style.css" />
    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <style>
        /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
        
        #map {
            height: 50%;
            width: auto;
        }
    </style>
</head>

<script>
    function initMap() {


        var infoWin = new google.maps.InfoWindow();
    	var myLatLng = {lat: ${lat}, lng: ${lng}};

        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 15,
          center: myLatLng
        });

        var marker = new google.maps.Marker({
          position: myLatLng,
          map: map,
          title: "${instName}"
          
        });
        google.maps.event.addListener(marker, 'click', function(evt) {
        	infoWin.setContent("${locationInfo}");
            infoWin.open(map, marker);
          });
       
    }


    // Create an array of alphabetical characters used to label the markers.

    // Add some markers to the map.
    // Note: The code uses the JavaScript Array.prototype.map() method to
    // create an array of markers based on a given "locations" array.
    // The map() method here has nothing to do with the Google Maps API.
</script>
<script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js">
</script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD-9tSrke72PouQMnMX-a7eZSW0jkFMBWY&callback=initMap">
</script>

<script>
    $(document).ready(function() {

        document.getElementById("institutionName").innerHTML = "${instName}";
        
        $.getJSON("InstitutionLoader?institutionID=" + "${instID}", function(data) {
        	if(data.length > 0)
       		{
       			$.each(data, function(key, value) {
                 	
       				if(value.institutionName!=null)
       				{
       					if(value.acronym!=null)
		       				document.getElementById("institutionName").innerHTML = value.institutionName + " (" + value.acronym + ")";
       					else
       						document.getElementById("institutionName").innerHTML = value.institutionName;
   					}
       				
       				if(value.system!=null)
	       				document.getElementById("system").innerHTML = value.system;
       				else
       					document.getElementById("system").innerHTML = "-";
       				
       				if(value.head!=null)
	       				document.getElementById("head").innerHTML = value.head;
       				else
       					document.getElementById("head").innerHTML = "-";
       				
       				if(value.hPosition!=null)
	       				document.getElementById("position").innerHTML = value.hPosition;
       				else
       					document.getElementById("position").innerHTML = "-";
       				
       				if(value.contactNumber!=null)
	       				document.getElementById("contactNumber").innerHTML = value.contactNumber;
       				else
       					document.getElementById("contactNumber").innerHTML = "-";
       				
       				if(value.contactEmail!=null)
	       				document.getElementById("contactEmail").innerHTML = value.contactEmail;
       				
       				else
       					document.getElementById("contactEmail").innerHTML = "-";
       				
       				if(value.website!=null)
       				{
       					var a = document.createElement("a");
       					a.setAttribute("href", value.website);
       					a.setAttribute("target", "_blank");
       					a.innerHTML = value.website;
       					document.getElementById("website").appendChild(a);
           				
       				}
       				else
       					document.getElementById("website").innerHTML = "-";
       				
       				if(value.address!=null)
	       				document.getElementById("address").innerHTML = value.address;
       				else
       					document.getElementById("address").innerHTML = "-";
       				
       			
     					$.getJSON("ProgramsLoader?institutionID=" + "${instID}", function(data) {
      						if(data.length > 0)
      			       		{
      							$.each(data, function(key, value) {
      								var divRow = document.createElement("div");
      			           			divRow.setAttribute("class", "row");
      			           			
      			           			var div1 = document.createElement("div");
      			           			div1.setAttribute("class", "four wide column");
  			           			
      			           			var b1 = document.createElement("p");
  			           				b1.innerHTML = value.degreeName;
  			           				
	   			           			var div2 = document.createElement("div");
	   			           			div2.setAttribute("class", "four wide column");
				           			
	   			           			var b2 = document.createElement("p");
			           				b2.innerHTML = value.educLevel;
				           				
			           				var div3 = document.createElement("div");
      			           			div3.setAttribute("class", "four wide column");
  			           			
      			           			var b3 = document.createElement("p");
  			           				b3.innerHTML = value.accLevel;
  			           				
	   			           			var div4 = document.createElement("div");
	   			           			div4.setAttribute("class", "four wide column");
				           			
	   			           			var b4 = document.createElement("p");
				           			b4.innerHTML = value.validUntil;
			           				
				           			div1.appendChild(b1);
				           			div2.appendChild(b2);
				           			div3.appendChild(b3);
				           			div4.appendChild(b4);
				           			
				           			divRow.appendChild(div1);
				           			divRow.appendChild(div2);
				           			divRow.appendChild(div3);
				           			divRow.appendChild(div4);
				           			
				           			document.getElementById("tableCell").appendChild(divRow);
	      			           			
   			       				});
      			       		}
      						else
      							$('#programsTable').remove();
       					});
      					
       			});
       		}

       		else
    		{
       			    
     		}
       		

          
      });
    });
</script>





<style>
    @viewport {
        width: auto;
    }
</style>





</head>

<body>




    <jsp:include page="menubar.jsp" />


    <div class="main-body-container">
		<h1 style="color: #45484c;" id="institutionName"></h1>
	    <hr>
	    <br>
	    <br>
		
		<div class="ui stackable grid">
		       
               <div class="eight wide column">
					<div class="ui grid">
						<div class="six wide column">
							<p><b>School System</b></p>
							<br><br>
							<p><b>Head</b></p>
							<p><b>Position</b></p>
							<p><b>Contact E-mail</b></p>
							<p><b>Contact Number</b></p>
							<p><b>Website</b></p>
							<p><b>Address</b></p>
							
						</div>
						    	
				    	<div class="ten wide column">   
				    		<p id="system">System</p>
							<br><br>
							<p id="head">Head</p>
							<p id="position">Position</p>
							<p id="contactEmail"></p>
							<p id="contactNumber">Contact Number</p>
							<p id="website"></p>
							<p id="address">Address</p>
						</div>
					</div>		
					
		    	</div>	  
		   
		      	<div class="eight wide column">   
	                <div id="map"></div>
						
				</div>
					
		</div>
			
		<br>
		<div id="programsTable">
			<h3 style="color: #45484c;">Programs in ${instName}</h3>        
			<hr><br>  
	
	
	        <br>
	              
	           <div class="ui celled grid" id="tableCell">
	
	               <div class="row">
	
	
	                   <div class="four wide column">
	                       <b>Programs</b>
	
	                   </div>
	
	
	                   <div class="four wide column">
	                       <b>Education Level</b>
	
	                   </div>
	
	                   <div class="four wide column">
	                       <b>Accreditation Level</b>
	
	                   </div>
	
	
	                   <div class="four wide column">
	
	                       <b>Valid Until</b>
	                   </div>
	
	
	               </div>
	               
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


    $('.slider').glide({
        autoplay: 2000,
        arrowsWrapperClass: 'slider-arrows',
        arrowRightText: '',
        arrowLeftText: '',

    });
</script>





</html>