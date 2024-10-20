<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
.total-div {
	width: 100%;

	/*  background-color: #F0F8FF;  */
}

.logopic {
	height: 80%;
	width: 300px;
}

.nav-bar-div {
	display: flex;
	flex-direction: row;
	background-color: #F0F8FF;
}

.heading-one {
	font-family: 'Times New Roman', Times, serif;
	color: #1E4969;
	display: flex;
	flex-type: row;
	font-size: 28px;
}

.nav-bar-info {
	margin-top: -13px;
	margin-left: 30px;
}

.from-to-info {
	margin-top: -27px;
	margin-left: 30px;
	font-size: 20px;
	color: #1E4969;
	display: flex;
	flex-type: row;
}

.contentt {
	font-size: 20px;
	font-family: 'Times New Roman', Times, serif;
	color: #1E4969;
	font-weight: 5px;
}

.table {
	font-family: 'Times New Roman', Times, serif;
	color: #1E4969;
}

.icon-td {
	width: 10px;
}
i{
color:red;}
</style>
<script>
	// Wrap the code in a DOMContentLoaded event listener
	document
			.addEventListener(
					"DOMContentLoaded",
					function() {
						document
								.getElementById("printButton")
								.addEventListener(
										"click",
										function() {
											// Hide the print button before printing
											document
													.getElementById("printButton").style.display = "none";
											// Print the form
											window.print();

											// Show the print button again after printing
											document
													.getElementById("printButton").style.display = "block";
										});
					});
</script>
</head>
<body>
	<div class="total-div">
		<div class=nav-bar-div>
			<img src="/images/TravelEaseLogo.jpg" alt="logopic" class="logopic">
			<div class="nav-bar-info">
				<h3 class="heading-one">TravelEase Ticket Information</h3>
				<h4 class="from-to-info">${s.routeId.fromLocation}-${s.routeId.toLocation}
					on ${s.dateOfJourney}</h4>
			</div>
		</div>
		<hr style="font-weight: bold;">
		<div class="contentt">
			<p>
				Hey<span style="font-weight: bold"> ${customerName} </span>, <br>
				Thank you for booking your bus ticket with <span
					style="font-weight: bold">TravelEase</span>.Here are the ticket
				details for your upcoming trip from <span style="font-weight: bold">
					${s.routeId.fromLocation} </span>to <span style="font-weight: bold">
					${s.routeId.toLocation} </span> on <span style="font-weight: bold">
					${s.dateOfJourney} </span>.
			</p>
		</div>
		<div class="table">
			<table>

				<td><i class="fas fa-barcode" ></i></td>
				<td>
					<h3>TransactionID:</h3>
				</td>
				<td><a:out value="${transactionId}"></a:out></td>
				</tr>
				<tr>
					<td class="icon-td"><i class="fas fa-ticket-alt" "></i></td>
					<td><h3>TicketID:</h3></td>
					<td><a:out value="${ticketId}"></a:out></td>
				</tr>
				<tr>
					<td><i class="far fa-clock" ></i></td>
					<td>
						<h3>Journey Date and Time:</h3>
					</td>
					<td><a:out value="${s.dateOfJourney} ----${s.scheduleTime}"></a:out></td>
				</tr>
				<tr>
					<td><i class="fas fa-bus"></i></td>
					<td>
						<h3>Travels:</h3>
					</td>
					<td><a:out value="${s.busId.busName}"></a:out></td>
				</tr>
				<tr>
					<td><i class="fas fa-bus"></i></td>
					<td>
						<h3>Bus Type:</h3>
					</td>
					<td>${s.busId.type}</td>
				</tr>
				<tr>
					<td><i class="fas fa-map-marker-alt"></i></td>
					<td>
						<h3>BoardingPoint:</h3>
					</td>
					<td>${s.routeId.fromLocation}</td>
				</tr>
				<tr>
					<td><i class="fas fa-map-marker-alt"></i></td>
					<td><h3>DroppingPoint</h3></td>
					<td>${s.routeId.toLocation}</td>
				</tr>
				<tr>
				<tr>
					<td><i class="fas fa-users"></i></td>
					<td><h3>PassengerDetails</h3></td>
					<td>
						<table>
							<tr>
								<th>PassengerID</th>
								<th>PassengerName</th>
								<th>Age</th>
								<th>Gender</th>
							</tr>
							<a:forEach items="${passengerList }" var="p">
								<tr>
									<td>${p.passengerKey.passengerId }</td>
									<td>${p.passengerName}</td>
									<td>${p.age }</td>
									<td>${p.gender }</td>
								</tr>
							</a:forEach>
						</table>
					</td>
				</tr>
				<tr>
					<td><i class="fas fa-money-bill"></i></td>
					<td><h3>TotalFare:</h3></td>
					<td>${totalFare}</td>
				</tr>
			</table>
			<div style="margin-left:30px;"><h1 >HAPPY JOURNEY &#129321;</h1></div>
		</div>
	</div>
	<div class="d-flex justify-content-center" style="margin-left: 250px;">
		<button id="printButton"
			style="background-color:#008CBA;; color: white; border-radius: 5px; height:30px;">Download Ticket</button>
	</div>
</body>
</html>