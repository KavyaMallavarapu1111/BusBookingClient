<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="m"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>

<m:masterafterlogin title="Login">
    <jsp:attribute name="head">
        <style>
	.cards-container {
	display: flex;
	justify-content: space-between;
	margin-top:50px;
}

.card {
	flex: 1;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	padding: 20px;
	text-align: center;
	transition: transform 0.3s;
	margin: 20px;
	max-width: calc(25% - 40px); /* 4 cards, 40px margin on each side */
	background-color:#F0F8FF;
}

.card1 {
	flex: 1;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	padding: 20px;
	text-align: center;
	transition: transform 0.3s;
	margin: 20px;
	max-width: calc(25% - 40px); /* 4 cards, 40px margin on each side */
	background-color:#F0F8FF;
}

.card img {
	width: 100%;
	max-height: 200px; /* Set a maximum height for the images */
	margin-bottom: 15px;
	border-radius:5px;
}

.card1 img {
	width: 100%;
	height: 200px;
	margin-bottom: 15px;
	border-radius:5px;
}

.card:hover {
	transform: translateY(-5px);
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

.card1:hover {
	transform: translateY(-5px);
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}
       a{
            	text-decoration:none;
            	color:#1E4969;
            	font-weight:bold;
            	font-size:24px;
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
        </style>
    </jsp:attribute>
    <jsp:attribute name="content">
        <div class="marquee-div">
            <div class="marque-text">&#128652;Welcome to TravelEase</div>
            <div class="marque-text">&#128652;Welcome to TravelEase</div>
            <div class="marque-text">&#128652;Welcome to TravelEase</div>
        </div>
        <div style="display:flex;flex-direction:row">
        <form>
        <div class="cards-container">
                    <div class="card">
                        <img src="/images/bookticket1.png"
					alt="Comfortable Journeys">
                        <a href="http://localhost:8888/checkticket">BookTicket</a>
                    </div>
                
                    <div class="card1">
                        <img src="/images/history.jpg"
					alt="Hassle-Free Booking" class="hassle-free-img">
                        <a href="http://localhost:8888/viewhistory">View History</a>
                    </div>
                
                    <div class="card1">
                        <img src="/images/update1.jpg" alt="Extensive Routes">
                       <a href="http://localhost:8888/updateprofile">Update profile</a>
                    </div>
                
                    <div class="card">
                        <img src="/images/cancelbgg.png"
					alt="Modern Amenities">
                        <a href="http://localhost:8888/cancelticket">Cancel ticket</a>
                    </div>
                </div>
                </form>
                </div>
    </jsp:attribute>
</m:masterafterlogin>
