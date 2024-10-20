<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="m"%>
<m:adminmaster title="Login">
	<jsp:attribute name="head">
    <script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script>
					function busNameChecking() {
						var busName = document.getElementById("busName").value;

						if (/^[a-zA-Z\s]+$/.test(busName)) {

						} else {
							// Input contains non-letter characters (invalid)
							document.getElementById("invalid-bus-name").innerText = "Bus name should be alphabets";

						}
					}
</script>
					<script>
					$(document).ready(function() {
						$("#my-form").submit(function(event) {
							var errmessage1 = $("#invalid-bus-name").text();

							if (errmessage1.trim() !== "") {
								event.preventDefault();
								alert("Check Busname");
							}
						});

						/*  var success = $("#my-message");

						 if (success.val() === "Bus Added Successfully") {
						     
						     success.css("color", "green");
						 } 
						 else {
						     
						     success.css("color", "red");
						 } */
					});
					
			
			
					  
					  
				</script>
				<script>
				function preventBack() { window.history.forward(); }
		        setTimeout("preventBack()", 0);

		 

		        window.onunload = function () { null };
				</script>
 
   	 
        <style>
.row-container {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

form {
	margin: 0 auto;
	padding: 20px;
	background-color: #F0F8FF;
	border-radius: 5px;
	box-shadow: 0 2px 4px #1E4969;
	margin-top: 40px;
	margin-left: -10px;
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

.error-td {
	padding: 10px;
	white-space: nowrap;
	color: red;
}

.td-heading {
	font-size: 20px;
	color: #1E4969;
	font-family: 'Times New Roman', Times, serif;
}

.select-field {
	width: 100%;
}

/* Input styles */
f\\:input {
	width: 100%;
	padding: 12px; /* Increase padding for more height */
	border: 1px solid #ccc;
	font-family: 'Times New Roman', Times, serif;
	border-radius: 3px;
	background-color: #fff;
	height: auto; /* Let the height adjust automatically */
	box-sizing: border-box; /* Include padding and border in the height */
}

/* Button styles */
input[type="submit"] {
	background-color: #1E4969;
	color: #fff;
	border: none;
	padding: 10px 20px;
	border-radius: 3px;
	cursor: pointer;
}

.success-msg {
	text-align: center;
	margin-top: 20px;
	font-weight: bold;
	
	font-size: 25px;
}

/* Responsive styles */
@media ( max-width : 768px) {
	form {
		padding: 10px;
	}
	tr {
		display: block;
		margin-bottom: 20px;
	}
	td {
		padding: 5px;
	}
}

#invalid-bus-name {
	color: red;
}
</style>
    </jsp:attribute>
	<jsp:attribute name="content">
    <div class="row-container">
    <img src="/images/busimage.jpg">     
        <f:form action="addNewBus" modelAttribute="B" id="my-form">
            <table>
                <tr>
                    <td class="td-heading">Enter BusId</td>
                    <td><f:input path="busId" value="${busId}" readonly="true"></f:input></td>
                    <td class="error-td"><f:errors path="busId"></f:errors></td>
                </tr>
                <tr>
                    <td class="td-heading">Enter BusName</td>
                    <td><f:input path="busName"
								onblur="busNameChecking();"></f:input>
							<div id="invalid-bus-name"></div></td>
                    
                    <td class="error-td"><f:errors path="busName"></f:errors></td>
                </tr>
                <tr>
    <td class="td-heading">Enter Type</td>
    <td>
        <f:select path="type" class="select-field">
        	<option value="" Selected disabled>Select</option>
            <option value="AC_Sleeper">A/C Sleeper</option>
            <option value="Non_AC_Sleeper">Non A/C Sleeper</option>
            <option value="AC_Semi_Sleeper">A/C Semi Sleeper</option>
            <option value="Non_AC_Semi_Sleeper">Non A/C Semi Sleeper</option>
             <option value="AC Seater">A/C Seater</option>
            <option value="Non_AC_Seater">Non A/C Seater</option>
        </f:select>
    </td>
    <td class="error-td"><f:errors path="type"></f:errors></td>
</tr>

                <tr>
                    <td class="td-heading">Enter Capacity</td>
                    <td><f:input path="capacity" type="number"></f:input></td>
                    <td class="error-td"><f:errors path="capacity"></f:errors></td>
                </tr>
   
				<tr>
				    <td colspan="3"
							style="text-align: center; vertical-align: middle;">
				        <input type="submit" value="ADD BUS">
				    </td>
				</tr>


            </table>
<div class="success-msg">
    <a:out value="${str}" />
    <a:choose>
        <a:when test="${str == 'Bus Added Successfully'}">
            <style>
                .success-msg {
                    color: green;
                }
            </style>
        </a:when>
        <a:otherwise>
            <style>
                .success-msg {
                    color: red;
                }
            </style>
        </a:otherwise>
    </a:choose>
</div>




        </f:form>
      </div>
    </jsp:attribute>
</m:adminmaster>
