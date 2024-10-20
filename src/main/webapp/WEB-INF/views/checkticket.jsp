<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="m"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<m:customermaster title="Login">
	<jsp:attribute name="head">
	
<style>
 .total-body{
 padding-top:20px; 
	
	background-image: url("/images/busimage1.jpg");
	 background-size: cover; 
	background-repeat: no-repeat;
	min-height:500px;
	width:100%;
} 



	.my-div{
		 
		 margin-left:130px;
                padding: 10px;
          background-color: #F0F8FF; 
               
               
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
               margin-top:90px;
               	
                display: table;
		
		}
		.error-td {
                padding: 10px;
                white-space: nowrap;
                color: red;
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
	   .td-heading {
                font-size: 20px;
                color:#1E4969;
                font-family:'Times New Roman', Times, serif;
            }
          .autocomplete-items{
            	background-color: #1E4969;
            	color:#F0F8FF;
            	
            	border-radius:3px;
            
            }
                   .success-msg{
            	text-align: center; 
            	
            	margin-left:-5px;
            	font-weight: bold;
            	 color: red;
            	 font-size:23px;
            }
               input[type="submit"] {
                background-color: #1E4969;
                color: #fff;
                border: none;
                padding: 5px 10px;
                border-radius: 3px;
                cursor: pointer;
                
            }
			.table-div{
				margin: 0 auto;
                padding: 20px;              
                background-color: #F0F8FF;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                margin-top: 40px;
               align-item:center;
                display: table;
			
			}
			.table1{
			 border-collapse: collapse; 
			}
			.table1 td, .table1 th {
    border: 1px solid black; /* Apply a 1px solid border to cells and headers */
    padding: 8px; /* Add padding for better spacing */
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">


function updateMinDate() {
    var today = new Date();
    var minDate = today.toISOString().split('T')[0];
    document.getElementById('journeyDate').setAttribute('min', minDate);
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
</jsp:attribute>
<jsp:attribute name="content">
<div class="marquee-div">
			<div class="marque-text">&#128652;Welcome to TravelEase</div>
			<div class="marque-text">&#128652;Welcome to TravelEase</div>
			<div class="marque-text">&#128652;Welcome to TravelEase</div>

		</div>
<div class="total-body">
	<f:form modelAttribute="c" action="CheckTicket" method="GET" class="my-form">
		<div class="my-div">
		<table>
		<tr>
			<td class="td-heading">Customer Id</td>
			<td><f:input path="customerId"
						value="${sessionScope.customerId}" readonly="true"></f:input></td>
				<td class="error-td"><f:errors path="customerId" /></td>
			</tr>
			<tr>
			<td class="td-heading">
				From Location</td>
				<td><f:input path="fromLocation" onkeyup="searchSuggestions()"></f:input>
					<div id="suggestionDropdown" class="autocomplete-items"  ></div>
					</td>
					<td class="error-td">
				<f:errors path="fromLocation" />
				</td>
				</tr>
				<tr>
			<td class="td-heading">
			To Location</td>
			<td><f:input path="toLocation" onkeyup="searchSuggestions1()"></f:input>
				<div id="suggestionDropdown1" class="autocomplete-items"></div>
				</td>
				<td class="error-td">
				<f:errors path="toLocation" /></td>
				</tr>
				<tr>
	<td class="td-heading">
		Journey Date</td>
		<td>
				<f:input path="journeyDate" type="date" min=""
						onchange="updateMinDate();"></f:input></td>
						<td class="error-td">
				<f:errors path="journeyDate" /></td>
				</tr>
			<tr>
			<td class="td-heading">
				No Of Tickets</td>
				<td>
				<select name="noOfTickets">
					<option value="" Selected disabled>Select</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
				</select>
				</td>
				<td class="error-td">
				<f:errors path="noOfTickets" />
			</td>
			</tr>
			<tr>
				    <td colspan="3" style="text-align: center; vertical-align: middle;">
				        <input type="submit" value="Book Ticket" id="submit-btn">
				    </td>
				</tr>
			</table>
			</div>
			
		<a:if test="${buses!=null }">
		<div class="table-div">
			<a:choose>
				<a:when test="${buses.size()!=0}">
					    <table class="table1">
						<tr>
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
								<td><a href="http://localhost:8888/bookticket/${l.sId}"
									style="text-decoration: none">Book Here</a></td>
							</tr>
						</a:forEach>
					</table>
				</a:when>
				<a:when test="${buses.size()==0 }">
					 <div class="success-msg" style="background-color:none;">
            		<a:out value="${str}"></a:out>
           		 </div>
				</a:when>
			</a:choose>
				</div>
		</a:if>
		</div>
	</f:form>

</jsp:attribute>
</m:customermaster>