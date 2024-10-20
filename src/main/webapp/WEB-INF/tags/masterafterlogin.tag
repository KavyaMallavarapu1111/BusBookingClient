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
	margin-left:70px;
	margin-right:-20px;
}

.nav-bar-item1 {
	font-size: 20px;
	margin-top: 35px;
	margin-left: 100px;
	text-decoration: none;
	color: #1E4969;
	font-family: 'Lora';
	font-weight: bold;
}
.nav-bar-item1:hover{
font-size:24px;

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
	margin-left: 70px;
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
.div8 {
	height: 30px;
	background-color: #1E4969;
	color: #F0F8FF;
}


}


</style>
</head>
<body>
	<div class="total-div">
		<div class="navbar">
			<img src="/images/TravelEaseLogo.jpg" alt="logopic" class="logopic">
			<div class="nav-items">
				<a href="#" class="nav-bar-item1">Home</a> 
				<a href="#" class="nav-bar-item1">Services</a>
				<a href="#" class="nav-bar-item1">Destinations</a> 
				<a href="#" class="nav-bar-item1">Contact</a>
				<a href="/main" ><button class="btn success">Logout</button></a>
			</div>
		</div>
		<jsp:invoke fragment="head"></jsp:invoke>
		<jsp:invoke fragment="content"></jsp:invoke>
	</div>
</body>
</html>
