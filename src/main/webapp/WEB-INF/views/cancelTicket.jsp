<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="m"%>
<m:customermaster title="cancelTicket">
	<jsp:attribute name="head">
<style>
.error-message {
	padding: 10px;
	color: red;
	font-size: 18px;
	font-weight: bold;
}

.center-content {
	align-items: center;
	text-align: center;
	margin-top: 50px;
}
 .cancel-img
{
	background-image: url('/images/busimage1.jpg');
    background-size: cover;
    background-position: center;
    position: absolute;
    width: 100%;
    min-height: 78%; 
 
} 
.form1 {
	max-width: 400px;
	margin-left: 12%;
	margin-top: 5%;
	padding-top: 30px;
	padding-bottom: 15px;
	background-color: #F0F8FF;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.form2 {
	background-color: #F0F8FF;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	max-width: 700px;
	margin-left: 5%;
	padding-left: 30px;
	padding-right: 30px;
	margin-top: 5%;
	padding-top: 20px;
}

.text {
	margin-right: 10px;
	font-size: 20px;
	color: #1E4969;
	font-family: 'Times New Roman', Times, serif;
	margin-top: 50px;
}

.text1 {
	margin-right: 36px;
	margin-left: -70px;
	font-size: 20px;
	color: #1E4969;
	font-family: 'Times New Roman', Times, serif;
}

#input2 {
	margin-right: -70px;
}

.passenger-table {
	border-collapse: collapse;
	width: 100%;
	max-width: 800px;
	border: 1px solid #ccc;
}

.passenger-table th, .passenger-table td {
	border: 1px solid #ccc;
	padding: 10px;
	font-size: 20px;
	color: #1E4969;
	font-family: 'Times New Roman', Times, serif;
}

.input-box {
	height: 30px;
	width: 200px;
	margin-bottom: 10px;
	/*margin-right: 30px;
    margin-left : 30px; */
	border-radius: 3px;
	border: 1px solid #1E4969;
}

.submit-button {
	height: 40px;
	width: 100px;
	margin-left: 30px;
	margin-top: 10px;
	border-radius: 3px;
	border: 2px solid #1E4969;
	background-color: #1E4969;
	color: #F0F8FF;
}

/* Responsive design */
@media ( max-width : 768px) {
	.passenger-table {
		font-size: 14px;
	}
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


.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 10px;
	border: 1px solid #888;
	border-radius: 10px;
	width: 20%;
	height: auto;
	position: relative;
}

/* Close Button */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.ok-button {
	display: inline-block;
	padding: 5px 10px;
	margin-bottom:10px;
	background-color: #1E4969;
	color: white;
	text-decoration: none;
	border-radius: 4px;
	cursor: pointer;
	margin-top:20px;
	margin-left: 200px;
}

.modal-buttons{

	font-size:20px;
}

.my-errors {
	margin-left: 3px;
	color: red;
	font-size:20px;
}

.inputval {
	width: 100px;
}

/* Add styling for the formatted message */
#modalMessage {
	font-size: 20px;
	line-height: 1.0;
}

#modalMessage strong {
	font-weight: bold;
}
</style>
<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js">
</script>
<script>

$(document).ready(function() {
	
	const checkboxes = document.querySelectorAll('input[type="checkbox"]');
	const passengerArray = [];
	checkboxes.forEach(checkbox => {
		checkbox.addEventListener('change', function() {
            const value = this.value;
            const passengerInfo = value.split(':');
            const transactionId = passengerInfo[0];
           	const passengerId = passengerInfo[1];
            const passengerName = passengerInfo[2];
            const age = passengerInfo[3];
            const gender = passengerInfo[4];
            if (this.checked) {
                // Add the value to the list
                
                passengerArray.push({
                	transactionId:transactionId,
                	passengerId:passengerId,
                    passengerName: passengerName,
                    age: age,
                    gender: gender
                });
            } else {
                // Remove the value from the list
               
               const index = passengerArray.findIndex(passenger => passenger.passengerId === passengerId);
               if (index > -1) {
                   passengerArray.splice(index, 1);
               }
            }  //End of else
            	
	 });
		
	});
	$("#collect").click(function(){
		
	const passengerArrayJSON = JSON.stringify(passengerArray);
	
	    console.log("JSON before setting input:", passengerArrayJSON); // Debugging statement
	    document.getElementById('passengerArrayInput').value = passengerArrayJSON;
	
	
}); 
	var amount="${amount}";
	if(amount){
	var modal = $("#myModal");
    var modalMessage = $("#modalMessage");
    var okButton = $("#okButton");
    modalMessage.html("Ticket Cancelled successfully");
    modalMessage.css("font-weight","bold");
    modalMessage.css("white-space", "pre-line");
    modal.css("display", "block");
    okButton.click(function() {
        modal.css("display", "none");
    });
	}
});

  </script>

</jsp:attribute>
	<jsp:attribute name="content">
<div class="marquee-div">
			<div class="marque-text">&#128652;Welcome to TravelEase</div>
			<div class="marque-text">&#128652;Welcome to TravelEase</div>
			<div class="marque-text">&#128652;Welcome to TravelEase</div>

		</div>
	<div class="cancel-img">
 <div class="center-content">
	<form action="cancelTicket" class='form1'>
				<span class="text">CustomerId</span>
				<input name="customerId" value="${sessionScope.customerId}"
						class="input-box" id="input1" readonly style="padding-left: 10px;"/><br>
			<span class="text1">TicketId</span>
				<input name="ticketId" class="input-box" id="input2" required="required" style="padding-left: 10px;"/><br>
			<input type="submit" class="submit-button" />
			<a:if test="${passengerList==null }">
	<div class="error-message">
		<a:out value="${msg1}"></a:out>
		<a:out value="${msg}"></a:out>
		<a:out value="${msg2}"></a:out>
						</div>
	</a:if>
	</form>
	
	<a:if test="${passengerList!=null}">
		<a:choose>
			<a:when test="${passengerList.size()!=0 }">
				<form action="CancelTicket" class='form2'>
				
					 <table class="passenger-table">
						<tr>
							<th>TransactionId</th>
							<th>PassengerId</th>
							<th>PassengerName</th>
							<th>Age</th>
							<th>Gender</th>
							<th>Cancel ticket</th>
						</tr>
						<a:forEach items="${passengerList }" var="p">
							<tr>
								<td>${p.passengerKey.transactionId.transactionId}</td>
								<td>${p.passengerKey.passengerId }</td>
								<td>${p.passengerName }</td>
								<td>${p.age }</td>
								<td>${p.gender }</td>
								<td><input type="checkbox" name="selectedPassengers"
												value="${p.passengerKey.transactionId.transactionId}:${p.passengerKey.passengerId}:${p.passengerName }:${p.age}:${p.gender}"></td>
							</tr>
						</a:forEach>
					</table>
					<!-- Hidden input field to store JSON of selected passenger array -->
					<input type="hidden" id="passengerArrayInput"
									name="passengerArrayInput" />

					<!-- Submit button -->
					<input type="submit" value="Cancel" id="collect"
									class="submit-button" />
				</form>
			</a:when>
		</a:choose>
	</a:if>
	<div id="myModal" class="modal">
        <div class="modal-content">
            <p id="modalMessage"></p>
            <div class="modal-buttons">
            	<a:out value="Refund amount : ${amount}"></a:out>
                <a href="/checkticket" class="ok-button">Ok</a>
            </div>
        </div>
    </div>
	</div>
	</div>
	</jsp:attribute>
</m:customermaster>
