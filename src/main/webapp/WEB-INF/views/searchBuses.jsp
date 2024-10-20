<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib tagdir="/WEB-INF/tags/" prefix="m"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<m:mastersearch title="SearchBuses">
	<jsp:attribute name="head">
	<style>
	form {
	margin-left:150px;
	padding: 20px;
	background-color: #F0F8FF;
	border-radius: 5px;
	box-shadow: 0 2px 4px #1E4969;
	margin-top: 100px;
	align-item:center;
	display: table;
}
	.form1 {
	margin-left:150px;
	padding: 20px;
	background-color: #F0F8FF;
	border-radius: 5px;
	box-shadow: 0 2px 4px #1E4969;
	margin-top: 50px;
	align-item:center;
	display: table;
}

table {
	width: 100%;
}

tr {
	margin-bottom: 15px;
}

td {
	padding: 10px;
	white-space: nowrap;
}
.table1{
			 border-collapse: collapse; 
			}
			.table1 td, .table1 th {
    border: 1px solid black; /* Apply a 1px solid border to cells and headers */
    padding: 8px; /* Add padding for better spacing */
}

input[type="submit"] {
                background-color: #1E4969;
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 3px;
                cursor: pointer;               
  
            }	

.aaa{
background-color: #1E4969;
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 3px;
                cursor: pointer; 

}
      	.error-message {
        color: red;
        font-size: 20px;	
		margin-top: 2px;
        display: block;
        margin-left:30px;
    }
    .bg-image{
	
	z-index:-2;
    background-image: url("/images/busimage1.jpg");
    background-size: cover;
    background-repeat: no-repeat; /* Add this line */
    position:absolute;
    padding-top:30px;
    height:95vh;
    width:100vw;
}
.autocomplete-items{
            	background-color: #1E4969;
            	color:#F0F8FF;
            	
            	border-radius:3px;
            
            }
.overlay{
position:absolute;
	background-color:rgba(0,0,0,0.3);
	height:100vh;
	width:100vw;
	z-index:-1;
} 
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">


function updateMinDate() {
    var today = new Date();
    var minDate = today.toISOString().split('T')[0];
    document.getElementById('DOJ').setAttribute('min', minDate);
}

$(document).ready(function(){
	$("#submit-btn").click(function(event) {
		 let v1 = $("#fromLocation").val();
		let v2 = $("#toLocation").val();
		if (v1 == v2) {
			alert("From location and To location should not be same");
			event.preventDefault();
		} 
		
	});

    updateMinDate();
    // Call the function initially to set the min attribute based on the current date
});

function searchSuggestions() {
    const input = document.getElementById("fromLocation");
    const inputValue = input.value.trim();
    const suggestionDropdown = document.getElementById("suggestionDropdown");
    // Clear previous suggestions
    suggestionDropdown.innerHTML = "";
    // Fetch suggestions from your database or predefined list
    const suggestions = getSuggestionsFromDatabase(inputValue);
    // Display suggestions in the dropdown
    suggestions.forEach(suggestion => {
        const suggestionItem = document.createElement("div");
        suggestionItem.textContent = suggestion;
        suggestionItem.addEventListener("click", () => {
            input.value = suggestion;
            suggestionDropdown.innerHTML = ""; // Clear suggestions after selection
        });
        suggestionDropdown.appendChild(suggestionItem);
    });
    // Show or hide the dropdown based on suggestions
    if (suggestions.length > 0) {
        suggestionDropdown.style.display = "block";
    } else {
        suggestionDropdown.style.display = "none";
    }
}
// Replace this function with actual fetching of suggestions from your database
function getSuggestionsFromDatabase(flocation) {
    // Simulated suggestions for demonstration
    const mockSuggestions = [
        // ... more suggestions
    ];
    $.ajax({
        type : 'GET',
        url : "http://localhost:9999/LocationStart/"+flocation,
        dataType : "JSON",
        contentType : "application/json;charset=utf-8",
        async : false,
        success : function(data) {
            
             for (var i = 0; i < data.length; i++) {
            	 
                 const from_location = data[i].place;
                 //alert( data[i].place);
                mockSuggestions.push(from_location);
            } 
        },
        error : function(x, err) {
        }
    });//endofajax
    return mockSuggestions.filter(suggestion =>
        suggestion.toLowerCase().includes(flocation.toLowerCase())
    );
}

function searchSuggestions1() {
    const input = document.getElementById("toLocation");
    const inputValue = input.value.trim();
    const suggestionDropdown1 = document.getElementById("suggestionDropdown1");
    // Clear previous suggestions
    suggestionDropdown1.innerHTML = "";
    // Fetch suggestions from your database or predefined list
    const suggestions = getSuggestionsFromDatabase(inputValue);
    // Display suggestions in the dropdown
    suggestions.forEach(suggestion => {
        const suggestionItem = document.createElement("div");
        suggestionItem.textContent = suggestion;
        suggestionItem.addEventListener("click", () => {
            input.value = suggestion;
            suggestionDropdown1.innerHTML = ""; // Clear suggestions after selection
        });
        suggestionDropdown1.appendChild(suggestionItem);
    });
    // Show or hide the dropdown based on suggestions
    if (suggestions.length > 0) {
    	suggestionDropdown1.style.display = "block";
    } else {
        suggestionDropdown1.style.display = "none";
    }
}
</script>
 <script>
    function myFunc(){
    	var from=document.getElementById("fromLocation").value;
    	var to=document.getElementById("toLocation").value;
    	
    	if(from===to){
    		alert("From Location and To Location should not be same");
    		return false;
    	}
    	return true;
    }
    </script>
	</jsp:attribute>
	<jsp:attribute name="content">
		<div class="bg-image"></div>
		<div class="overlay"></div>
		<f:form modelAttribute="s" action="Buses">
		<table>
			<tr><td>FromLocation</td><td><f:input path="fromLocation" onkeyup="searchSuggestions()" required="required"/>
			<div id="suggestionDropdown" class="autocomplete-items"  ></div></td></tr>
			<tr><td>ToLocation</td><td><f:input path="toLocation" onkeyup="searchSuggestions1()" required="required"/>
			<div id="suggestionDropdown1" class="autocomplete-items"></div>
			</td></tr>
			<tr><td>Date Of Journey</td><td><f:input path="DOJ" required="required" type="date" min=""
						onchange="updateMinDate();"/>
			<tr><td>NoOfTickets</td><td>
				<select name="noOfTickets">
					<option value="" Selected disabled>Select</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
				</select>
				</td></tr>
			<tr><td ><input type="submit" value="Search Buses" onclick="return myFunc();"></td><td colspan="2" style="text-align: right;"><a href="http://localhost:8888/main"
									style="text-decoration: none" class="aaa">Back</a></td></tr>
		</table>
		<a:if test="${ empty buses}">
				<a:choose>
				<a:when test="${buses.size()==0 }">
					 <div class="error-message" style="">
            		<a:out value="${str}"></a:out>
           		 </div>
				</a:when>
				</a:choose>
		</a:if>
		</f:form>
		
		<a:if test="${not empty buses}">
		<f:form class="form1">
			<a:choose>
				<a:when test="${buses.size()!=0}">
					    <table class="table1" style="border:1px solid black;border-collapse:none;">
						<tr style="border:1px solid black;border-collapse:none;">
							<th>ScheduleId</th>
							<th>ScheduleTime</th>
							<th>RouteId</th>
							<th>DateOfJourney</th>
							<th>Cost</th>
							<th>AvailableSeats</th>
							<th>BusId</th>
							<th>BusName</th>
							<th>BookTicket</th>
						</tr>
						<a:forEach items="${buses}" var="l">
							<tr>
								<td>${l.sId}</td>
								<td>${l.scheduleTime}</td>
								<td>${l.routeId.routeId}</td>
								<td>${ l.dateOfJourney}</td>
								<td>${ l.cost}</td>
								<td>${ l.availableSeats}</td>
								<td>${ l.busId.busId}</td>
								<td>${l.busId.busName }</td>
								<td><a href="http://localhost:8888/loginn"
									style="text-decoration: none">Book Here</a></td>
						
							</tr>
						</a:forEach>
					</table>
				</a:when>
				</a:choose>
				
				</f:form>
				</a:if>
				
	
</jsp:attribute>
</m:mastersearch>