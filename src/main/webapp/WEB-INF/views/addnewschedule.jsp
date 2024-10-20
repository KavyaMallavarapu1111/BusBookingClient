<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="m"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>

<m:adminmaster title="Login">
	<jsp:attribute name="head">
		<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script>
		function updateMinDate() {
			var today = new Date();
			console.log(today);
			var minDate = today.toISOString().split('T')[0];
			console.log(today.toISOString().split('T')[1]);
			console.log(minDate);
			var minTime = today.toLocaleTimeString().split(' ')[0];
			console.log(minTime);
			document.getElementById('dateOfJourney').setAttribute('min',
					minDate);
		}
	</script>
<script>
	$(document).ready(function() {
						updateMinDate();
						$("#scheduleTime").blur(function() {
											var today = new Date();
											var currentDate = today.toISOString().split('T')[0];
											var hours = today.getHours();
											var minutes = today.getMinutes();
											var currentTimeInMinutes = hours* 60 + minutes;
											var dateOfJourney = document.getElementById('dateOfJourney').value;
											var scheduleTime = document.getElementById('scheduleTime').value;
											var scheduleTimeComponents = scheduleTime.split(':');
											var scheduleTimeInMinutes = parseInt(scheduleTimeComponents[0])* 60+ parseInt(scheduleTimeComponents[1]);
											if (dateOfJourney === '') {
												$("#dateError").html("please enter dateOfJourney");
											}
											else if (currentDate === dateOfJourney) {
												$('#dateError').html('');
												if (currentTimeInMinutes > scheduleTimeInMinutes) {
													$("#timeError")
															.html(
																	"scheduleTime should be greater than current time");
												} else {
													$("#timeError").html(""); // Clear the error message if valid
												}
											} else {
												$("#timeError").html(""); // Clear the error message if dates are not equal
											}
										});

						// Call the function initially to set the min attribute based on the current date
						$("#myform").submit(function(event)
								{
								
								var errmessage1=$("#dateError").text();
								var errmessage2=$("#timeError").text();
								if(errmessage1.trim()!=="" || errmessage2.trim()!=="")
									{
										event.preventDefault();
										alert("check date and time");
									}
							
								});
						$("select[name='busno']").append("<option value=-1>select</option>");
						$("select[name='routeno']").append(
								"<option value='-1''>select</option>");
						$.ajax({
						    type: 'GET',
						    url: "http://localhost:9999/getallbuses",
						    dataType: "JSON",
						    contentType: "application/json;charset=utf-8",
						    async: false,
						    success: function (data) {
						        $("select[name='busno']").empty();
						        $("select[name='busno']").append("<option value='' disabled selected required>select</option>");
						        for (var i = 0; i < data.length; i++) {
						            $("select[name='busno']").append("<option value='" + data[i].busId + "'>" + data[i].busId + "</option>");
						        }
						    },
						    error: function (x, err) {
						        alert("readyState - " + x.readyState);
						        alert("responseText - " + x.responseText);
						    }
						});

						
						$.ajax({
						    type: 'GET',
						    url: "http://localhost:9999/getallroutes",
						    dataType: "JSON",
						    contentType: "application/json;charset=utf-8",
						    async: false,
						    success: function (data) {
						        $("select[name='routeno']").empty();
						        $("select[name='routeno']").append("<option value='' disabled selected required>select</option>");
						        for (var i = 0; i < data.length; i++) {
						            $("select[name='routeno']").append("<option value='" + data[i].routeId + "'>" + data[i].routeId + "</option>");
						        }
						    },
						    error: function (x, err) {
						        alert("readyState - " + x.readyState);
						        alert("responseText - " + x.responseText);
						    }
						});

						$("select[name='routeno']").change(function() {
							var routeId=$("select[name='routeno']").val();
							
							$.ajax({
								type : 'GET',
								url : "http://localhost:9999/getbyid/"+routeId,
								dataType : "JSON",
						        contentType : "application/json;charset=utf-8",
						        async : false,
						        success : function(data) {
						        	$("input[name='fromLocation']").val(data.fromLocation); // Use .val() instead of .value
						            $("input[name='toLocation']").val(data.toLocation); 
						        },
						        error : function(x, err) {
						        	alert("readyState -" + x.readyState);
									alert("responseText -" + x.responseText);
						        }
							});
							$("input[name='fromLocation']").attr("readonly", "readonly");
		                    $("input[name='toLocation']").attr("readonly", "readonly");
						});
});
</script>
  	<style>
form {
	margin: 0 auto;
	padding: 10px;
	background-color: #F0F8FF;
	border-radius: 5px;
	/* box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); */
	box-shadow: 0 2px 4px #1E4969;
	margin-top: 40px;
	margin-left: 40px;
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
select{
	width: 100%;
	padding: 2px;
}
input[type="date"]
{
	width: 97%;
	

}
input[type="time"]
{
	width: 97%;
	

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
.error-field{
	color:red;
}
.success-msg {
	text-align: center;
	margin-top: 20px;
	font-weight: bold;
	color: red;
	font-size: 25px;
}
.row-container {
                display: flex;
                align-items: center;
                
            } 
            .img1{
            	height:400px;
            	width:400px;
            	margin-top:50px;
            	margin-left:150px;
            	margin-right:50px;
            	
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
</style>
  
  </jsp:attribute>

	<jsp:attribute name="content">
	<div class="row-container">
    	<img src="/images/schedule.png" class="img1">
 
	<f:form modelAttribute="S" action="addNewSchedule" id="myform">
		<table>
			<tr>
				<td class="td-heading">ScheduleId</td>
				<td><f:input path="sId" value="${scheduleId }"
							readonly="true"></f:input></td>
			</tr>
			<tr>
				<td class="td-heading">Available Seats</td>
				<td><f:input path="availableSeats" required="required"/></td>
				<td><f:errors path="availableSeats"></f:errors></td>
			</tr>
			<tr>
					<td class="td-heading">Cost</td>
					<td><f:input path="cost" required="required" /></td>
					<td><f:errors path="cost"></f:errors></td>
				</tr>
			<tr>

                <td class="td-heading">Date Of Journey</td>

                <td><f:input path="dateOfJourney" required="true" type="date" min="" onchange="updateMinDate();"></f:input>
				<div id="dateError"  class="error-field"></div></td>
			</tr>
			<tr>
                <td><f:errors path="dateOfJourney"></f:errors></td>
            </tr>
               <tr> <td class="td-heading">Schedule Time</td>
                <td><f:input path="scheduleTime" required="true"
							type="time" min="" />
                        <div id="timeError" class="error-field"></div></td>

                <td><f:errors path="scheduleTime"></f:errors></td>

            </tr>
			<tr>
					<td class="td-heading">BusId</td>
					<td><select name="busno" required="required" ></select></td>
				</tr>
			<tr>
					<td class="td-heading">RouteId</td>
					<td><select name="routeno" required="required"  ></select></td>
				</tr>
			<tr>
				<td class="td-heading">FromLocation</td>
				<td><input type="text" name="fromLocation" required="required" /></td>
			</tr>
			<tr>
				<td class="td-heading" >ToLocation</td>
				<td><input type="text" name="toLocation" required="required" /></td>
			</tr>
			<tr>
					<td  colspan="3" style="text-align: center;"><input type="submit" value="ADD SCHEDULE"></td>
				</tr>
		</table>
		<div class="success-msg">
    <a:out value="${str}" />
    <a:choose>
        <a:when test="${str == 'Schedule done successfully'}">
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


