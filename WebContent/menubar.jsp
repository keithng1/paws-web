<script>
	function search(e)
	{
        if(e.keyCode === 13){
            e.preventDefault(); // Ensure it is only this code that rusn

    		var searchWord = document.getElementById("searchWord").value;
    		window.location = "Search?query=" + searchWord;
  		}
	
	}


</script>


<div class="ui nav" style="padding: 3%;">

     <div class="ui secondary menu navmenu">

         <div style="padding-right:5%; min-width: 100px; width: 240px;">
             <a href="index.jsp"><img src="img/logo.png" style=" width:200px; height: auto;"> </a>
         </div>



         <div class="ui dropdown item">

             ABOUT <i class="dropdown icon"></i>
             <div class="menu">
                 <a class="item" href="AboutPAASCU">About PAASCU</a>
                 <a class="item" href="BoardMembers">Board Members</a>
                 <a class="item" href="CommissionMembers">Commission Members</a>
                 <a class="item" href="InternationalAffiliations">International Affiliation</a>
             </div>
         </div>

         <a class="item" href="NewsList">NEWS</a>
         <a class="item" href="Accreditation">ACCREDITATION</a>
         <a class="item" href="Members">OUR MEMBERS</a>
         <a class="item" href="Downloads">DOWNLOADS</a>
         <a class="item" href="ContactUs">CONTACT</a>
         <div class="right menu">
             <div class="item">
                 <div class="ui icon input">
                     <input id="searchWord" type="text" placeholder="Search..." onkeypress="search(event);">
                     <i class="search link icon"></i>
                 </div>
             </div>

         </div>
     </div>

 </div>
