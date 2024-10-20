<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.techwave.busbookingclient.Models.Pojo.Passenger"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="m"%>
<m:customermaster title="Login">
    <jsp:attribute name="head">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
   form {
                margin-top: 30px;
                background-color: #F0F8FF;
                align-item: center;
                width: 620px;
                margin-left: 350px;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }
              fieldset {
                border: 2px solid #ddd;
                padding: 10px;
                margin-bottom: 10px;
                border-radius: 5px;
               
            }
                 legend {
                font-weight: bold;
                font-size: 14px;
                
            }
             label {
                display: block;
                margin-bottom: 5px;
                
            }

          input[type="text"], input[type="number"] {
                width: 75%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 5px;
                margin-bottom:5px;
                margin-right:15px;
            } 
            select{
            width: 100%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 5px;
                margin-bottom:5px;
               	margin-right:20px;
            }
            input[type="submit"] {
                background-color:  #1E4969;
                color: white;
                border: none;
                padding: 10px 20px;
                margin-left:510px;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s, transform 0.3s;
            }
            input[type="submit"]:hover {
                background-color: #1E4969;
                 transform: scale(1.1);
            }
          
    .field-label {
        display: block;
              
    }
   .marquee-div {
	display: flex;
	overflow: hidden;
	background-color: #1E4969;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	width: 100%;
	height: 35px;
}

.marque-text {
	font-size: 20px;
	color: #F0F8FF;
	margin-right: 180px;
	margin-top: 3px;
	animation: marquee 4s linear infinite;
}

  @keyframes marquee {
    0% { transform: translateX(100%); }
    100% { transform: translateX(-100%); }
  } 

	.bg-image{
	
	z-index:-2;
    background-image: url("/images/busimage1.jpg");
    background-size: cover;
    background-repeat: no-repeat; /* Add this line */
    position:absolute;
    padding-top:30px;
    height:100vh;
    width:100vw;
}
.overlay{
position:absolute;
	background-color:rgba(0,0,0,0.3);
	height:100vh;
	width:100vw;
	z-index:-1;
}

	
}
</style>
<script>
	function generatePassengerFields() {
		var noOfTickets = document.getElementById("noOfTickets").value;
		var passengerFields = document.getElementById("passengerFields");
		passengerFields.innerHTML = ""; // Clear previous fields
		for (var i = 1; i <= noOfTickets; i++) {
		    var fieldset = document.createElement("fieldset");
		    
		    var table = document.createElement("table");
		    table.classList.add("fieldset-row"); // Add the class to the table
		    
		    var row = table.insertRow();
		    
		    var passengerIdCell = row.insertCell();
		    passengerIdCell.innerHTML = "<label class='field-label'>PassengerId:</label>"
		            + "<input type='text' value='Passenger "+ i +"' name='passengerList["
		            + (i - 1) + "].passengerKey.passengerId' required readonly>";
		    
		    var nameCell = row.insertCell();
		    nameCell.innerHTML = "<label class='field-label'>Name:</label>"
		            + "<input type='text' name='passengerList[" + (i - 1) + "].passengerName' required>";
		    
		    var ageCell = row.insertCell();
		    ageCell.innerHTML = "<label class='field-label'>Age:</label>"
		            + "<input type='text' name='passengerList[" + (i - 1) + "].age' required>";
		    
		    var genderCell = row.insertCell();
		    genderCell.innerHTML = "<label class='field-label'>Gender:</label>"
		            + "<select name='passengerList[" + (i - 1) + "].gender' required>"
		            + "<option value='Select' disabled selected>Select</option>"
		            + "<option value='Male'>Male</option>"
		            + "<option value='Female'>Female</option>"
		            + "<option value='Trans'>Prefer not to say</option>"
		            + "</select>";
		    
		    fieldset.appendChild(table);
		    passengerFields.appendChild(fieldset);
		}

		//window.location.href="http://localhost:8888/bookTicket/"+passengerFields;
	}
	
	$(document).ready(function(){
		generatePassengerFields();
	});
	
	
</script>
</jsp:attribute>
<jsp:attribute name="content">
<div class="marquee-div">
			<div class="marque-text">&#128652;Welcome to TravelEase</div>
			<div class="marque-text">&#128652;Welcome to TravelEase</div>
			<div class="marque-text">&#128652;Welcome to TravelEase</div>

		</div>
		<div class="bg-image"></div>
		<div class="overlay"></div>
		
        <form:form action="/bookTicket" method="post" modelAttribute="s">
            No. of Tickets:<input type="number" id="noOfTickets"
                value="${noti}" name="noOfTickets" readonly="readonly"  max="${noti}">
            <br>
            <div id="passengerFields" class="passengerFields"></div>
            <input type="submit" value="Submit" id="submit-btn">
        </form:form>
        
    </jsp:attribute>
</m:customermaster>