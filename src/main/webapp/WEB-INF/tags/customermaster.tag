<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ attribute name="title" rtexprvalue="true" required="true"%>
<%@ attribute name="head" fragment="true"%>
<%@ attribute name="content" fragment="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="m"%>
<!DOCTYPE html>
<html>
<head>

<style>
/* .total-div {
	background-color: #F0F8FF;
} */

.navbar {
	width: 100%;
	height: 100px;
	background-color: #F0F8FF;
	margin-top: -10px;
/* 	 position: fixed;    
    z-index: 1000;  */
	
}

.logopic {
	height: 100%;
	width: 350px;
}

.navbar {
	display: flex;
}

.nav-items {
	display: flex;
	margin-left:100px;
}

.nav-bar-item1 {
	font-size: 20px;
	margin-top: 35px;
	margin-left: 50px;
	text-decoration: none;
	color: #1E4969;
	font-family: 'Lora';
	font-weight: bold;
}
.nav-bar-item1:hover {
    font-size: 22px; /* Increasing font size on hover */
}

.signupbutton {
	margin-left: 100px;
	border: 2px solid #1E4969;
	border-radius: 40%;
	background-color: #F0F8FF;
	font-family: 'Times New Roman', Times, serif;
	font-size: 20px;
	color: #1E4969;
}

.btn {
	border-radius: 10px;
	background-color: #F0F8FF;
	margin-top: 30px;
	margin-left: 60px;
	height: 35px;
	font-family: 'Times New Roman', Times, serif;
	font-size: 19px;
	cursor: pointer;
	font-weight: bold;
}

/* Green */
.success {
	border-color: #1E4969;
	color: #1E4969;
}

.success:hover {
	background-color: #1E4969;
	color: #F0F8FF;
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


/*   @keyframes marquee {
    0% { transform: translateX(100%); }
    100% { transform: translateX(-100%); }
  } */
  
  @keyframes marquee {
    0% { transform: translateX(100%); }
    100% { transform: translateX(-100%); }
  }
.nav-items a.active {
    border-radius: 10px;
    background-color: #F0F8FF;
    cursor: pointer;
    font-family: 'Times New Roman', Times, serif;
    font-size: 20px;
    text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3); /* Adding drop shadow to active link */
}
</style>
</head>
<body>
	<div class="total-div">
		<div class="navbar">
			<img src="/images/TravelEaseLogo.jpg" alt="logopic" class="logopic">
			<div class="nav-items">
				<a href="/checkticket" class="nav-bar-item1">Book Ticket</a> <a href="/viewhistory"
					class="nav-bar-item1">View History</a> <a href="/updateprofile"
					class="nav-bar-item1">Update Profile</a> <a href="/cancelticket"
					class="nav-bar-item1">Cancel Ticket</a>
				<a href="/main"><button class="btn success">Logout</button></a>
			</div>
		</div>
<script>
	document.addEventListener("DOMContentLoaded", function () {
		  const currentPath = window.location.pathname;

		  // Get all navigation links
		  const navLinks = document.querySelectorAll('.nav-items a');

		  // Loop through the links and check if the link's href matches the current path
		  navLinks.forEach(link => {
		    if (link.getAttribute('href') === currentPath || link.getAttribute('href') === currentPath + '#') {
		      link.classList.add('active');
		    }
		  });
		});

</script>

		<jsp:invoke fragment="head"></jsp:invoke>
		<jsp:invoke fragment="content"></jsp:invoke>
	</div>
</body>
</html>
