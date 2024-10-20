
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="m"%>

<m:mastermain title="Main">
	<jsp:attribute name="head">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	  
		<style>

.content-total{
	background-color:#F0F8FF;
	
	}
.bus-div {	
	width:100%;
}
.main-bus-img{
	height:550px;
	width:100%;
	margin-top:90px;
}

.about-us-div {
	width: 60%;
	background-color:#F0F8FF;
}

.aboutus-text {
	font-size: 30px;
	font-weight: bold;
	margin-bottom: -10px;
	color: #1E4969;
	background-color:#F0F8FF;
	text-align: center;
	font-family: 'Times New Roman', Times, serif;
}

.aboutus-content {
	font-family: 'Times New Roman', Times, serif;
	font-size: 20px;
	color: #1E4969;
	line-height: 30px;
	margin-left: 40px;
	margin-right: 40px;
	text-align: justify;
	/* Align text to left and right in a balanced manner */
}

.div2 {
	display: flex;
	background-color:#F0F8FF;
	margin-top:-10px;
}

h1 {
	font-size: 30px;
	font-weight: bold;
	margin-bottom: -10px;
	color: #1E4969;
	text-align: center;
	font-family: 'Times New Roman', Times, serif;
	margin-top: -20px;
	margin-bottom: 5px;
}

.andriod-bus-img {
	margin-left: 60px;
	height: 400px;
	width: 300px;
	margin-top: 40px;
}

.cards-container {
	display: flex;
	justify-content: space-between;
}

.card {
	flex: 1;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	background-color:#F0F8FF;
	padding: 20px;
	text-align: center;
	transition: transform 0.3s;
	margin: 20px;
	max-width: calc(25% - 40px); /* 4 cards, 40px margin on each side */
}

.card1 {
	flex: 1;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	padding: 20px;
	background-color:#F0F8FF;
	text-align: center;
	transition: transform 0.3s;
	margin: 20px;
	max-width: calc(25% - 40px); /* 4 cards, 40px margin on each side */
}

.card img {
	width: 100%;
	max-height: 200px; /* Set a maximum height for the images */
	margin-bottom: 15px;
}

.card1 img {
	width: 100%;
	height: 175px;
	margin-bottom: 15px;
}

.card h3 {
	font-size: 24px;
	margin: 10px 0;
	color: #1E4969;
}

.card p {
	font-size: 16px;
	color: #1E4969;
	line-height: 1.5;
	text-align: justify;
	margin-left: 10px;
	margin-right: 10px;
}

.card:hover {
	transform: translateY(-5px);
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

.card1 h3 {
	font-size: 24px;
	margin: 10px 0;
	color: #1E4969;
}

.card1 p {
	font-size: 16px;
	color: #1E4969;
	line-height: 1.5;
	text-align: justify;
	margin-left: 10px;
	margin-right: 10px;
}

.card1:hover {
	transform: translateY(-5px);
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

.div3 {
	display: flex;
}

.girl-app-div {
	width: 40%;
	margin-left: -40px;
}

.girl-app-img {
	height: 400px;
	width: 100%;
	border-radius: 30px;
}

.content-of-girl-app {
	width: 60%;
}

.girl-content-heading {
	font-size: 30px;
	font-weight: bold;
	color: #1E4969;
	text-align: center;
}

.small-paras {
	display: flex;
}

.vertical-line {
	border-left: 3.5px solid #1E4969;
	/* Adjust the width and color as needed */
	height: 90px; /* Adjust the height of the line */
	margin-left: 90px;
	margin-right: 50px;
	margin-top: 10px;
}

.small-paras-heading {
	margin-top: 0px;
	margin-left: 20px;
	color: #1E4969;
}

.small-para-content {
	margin-left: 20px;
	font-size: 20px;
	margin-top: -10px;
	line-height: 25px;
	color: #1E4969;
}

.vertical-line1 {
	border-left: 3.5px solid #1E4969;
	/* Adjust the width and color as needed */
	height: 90px; /* Adjust the height of the line */
	margin-left: 80px;
	margin-right: 50px;
	margin-top: 10px;
}

.small-paras1 {
	display: flex;
	margin-top: 40px;
}

.div4 {
	display: flex;
}

.tourist-card {
	flex: 1;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	padding: 20px;
	text-align: center;
	transition: transform 0.3s;
	margin: 20px;
	max-width: calc(25% - 40px); /* 4 cards, 40px margin on each side */
}

.tourist-card img {
	width: 100%;
	max-height: 200px; /* Set a maximum height for the images */
	margin-bottom: 15px;
}

.tourist-card h3 {
	font-size: 24px;
	margin: 10px 0;
	color: #1E4969;
}

.tourist-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

.max-heading {
	margin-left: 5%;
	color: #1E4969;
	font-family: 'Times New Roman', Times, serif;
}

.max-content {
	font-size: 20px;
	font-family: 'Times New Roman', Times, serif;
	color: #1E4969;
	margin-left: 5%;
}

.max-imgg {
	margin-left: 5%;
	width: 90%;
	border-radius: 10px;
	margin-top: 10px;
}

.max-heading1 {
	color: #1E4969;
	font-family: 'Times New Roman', Times, serif;
	text-align: center;
	font-size: 25px;
}

.max-content1 {
	font-size: 20px;
	font-family: 'Times New Roman', Times, serif;
	color: #1E4969;
	text-align: center;
	margin-left: 5%;
	margin-right: 5%;
	line-height: 25px;
}

.max-images-div {
	margin-left: 5%;
	display: flex;
	flex-direction: row;
}

.max-image-sub {
	width: 30%;
	margin-right: 5%;
}

.max-pic1 {
	height: 200px;
	width: 200px;
	padding-left: 20%;
	margin-top: 10px;
}

.max-pic2 {
	height: 200px;
	width: 200px;
	padding-left: 20%;
	margin-top: 5px;
}

.max-pic3 {
	height: 200px;
	width: 180px;
	padding-left: 20%;
	margin-top: 15px;
	margin-bottom: -10px;
}

.max-content2 {
	font-size: 20px;
	font-family: 'Times New Roman', Times, serif;
	color: #1E4969;
	text-align: justify;
	margin-left: 5%;
	margin-right: 5%;
	line-height: 25px;
}

.div6 {
	margin-top: -20px;
}

.max-content3 {
	font-size: 25px;
	font-family: 'Times New Roman', Times, serif;
	color: #1E4969;
	text-align: center;
	margin-left: 5%;
	margin-right: 5%;
	line-height: 25px;
}

.fa {
	padding: 20px 25px 20px 20px;
	font-size: 20px;
	width: 10px;
	text-align: center;
	text-decoration: none;
	margin: 5px;
	border-radius: 50%;
}

.fa:hover {
	opacity: 0.7;
}

.fa-facebook {
	background: #3B5998;
	color: white;
}

.fa-twitter {
	background: #55ACEE;
	color: white;
}

.fa-google {
	background: #dd4b39;
	color: white;
}

.fa-instagram {
	background: #125688;
	color: white;
}

.div7 {
	display: flex;
	margin-left: 5%;
	margin-right: 5%;
}

.div7-subdiv {
	width: 25%;
	margin-right: 10px;
}

.logopic1 {
	width: 90%;
	height: 100px;
	margin-top: -10px;
	margin-left: 5%;
}

.div7-subdiv1 {
	width: 25%;
	margin-left: 50px;
}

.max-content4 {
	color: #1E4969;
	font-size: 18px;
	line-height: 30px;
	margin-top: -7px;
	margin-left: 15px;
	text-align: justify;
}

.max-content5 {
	font-size: 18px;
	font-family: 'Times New Roman', Times, serif;
	color: #1E4969;
	margin-left: 40px;
	line-height: 29px;
	margin-top: -10px;
}

.max-content6 {
	font-size: 18px;
	font-family: 'Times New Roman', Times, serif;
	color: #1E4969;
	margin-left: 110px;
	line-height: 28px;
	margin-top: -10px;
}

.max-content7 {
	font-size: 18px;
	font-family: 'Times New Roman', Times, serif;
	color: #1E4969;
	margin-left: 90px;
	line-height: 30px;
	margin-top: -10px;
}

.div8 {
	min-height: 50px;
	background-color: #1E4969;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	color: #F0F8FF;
}

.copyrights-para {
	font-size: 18px;
	text-align: center;
	padding-top: 5px;
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
	  .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5); /* Semi-transparent black */
            z-index: 1000; /* Place the overlay above other content */
            display: none; /* Initially hidden */
        }
        
         .popup-container {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
           
            background-color: white;
            box-radius:10px;
            border: 1px solid #ccc;
            
            z-index: 1001; /* Place the popup above the overlay */
            display: none; /* Initially hidden */
        }
		.popup-container img
		{
			height:400px;
			width:900px;
			
		}
		
        .close-button {
            position: absolute;
            top: 1px;
            right: 10px;
            color:black;
            cursor: pointer;
            font-size:25px;
            font-weight:bold;
        }
  }
</style>
		<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
    <script>
    function showPopup() {
        document.getElementById("overlay").style.display = "block";
        document.getElementById("popupContainer").style.display = "block";
        document.body.style.overflow = "hidden"; // Prevent scrolling of background content
    }

    // Function to close the popup
    function closePopup() {
        document.getElementById("overlay").style.display = "none";
        document.getElementById("popupContainer").style.display = "none";
        document.body.style.overflow = "auto"; // Re-enable scrolling of background content
    }

    // Show the popup when the page loads
    window.onload = showPopup;
    </script>
	</jsp:attribute>
	<jsp:attribute name="content">
	
	<div class="overlay" id="overlay"></div>

    <!-- Popup container -->
    <div class="popup-container" id="popupContainer">
        <span class="close-button" onclick="closePopup()">&times;</span>
        <img src="/images/max-image.jpg" alt="Offer Image">
    </div>
   <div class="content-total">
		<div class="bus-div">
                    <img src="/images/mainbusimage.jpeg" class="main-bus-img">
                
                </div>
                <div class="div2" id="about-us-div">
 
                    <div class="about-us-div">
                         <p class="aboutus-text">About Us</p> 

                     <p class="aboutus-content">
                            TravelEase is India's largest online bus ticketing platform that has transformed bus travel in the country by bringing ease and convenience to millions of Indians who travel using buses. Founded in 2020, TravelEase is part of India's leading online travel company MakeMyTrip Limited (MMYT). By providing widest choice, superior customer service, lowest prices, and unmatched benefits, TravelEase has served over 18 million customers. Our fleet of modern buses is designed to make your journey as smooth and enjoyable as possible, whether you're commuting, sight seeing, or embarking on a cross-country adventure.Stay connected with complimentary Wi-Fi, charge your devices on the go.Our user-friendly website has answers for all of your queries. 
                        </p>                         
                    </div>
                    <div class="andriod-pic-div">
                        <img src="/images/andriodbus.png"
					class="andriod-bus-img">
                        
                    </div>

                </div>
                <h1>Why TravelEase?</h1>
                <div class="cards-container">

                    <div class="card">
                        <img src="/images/comfortable-seat1.jpg"
					alt="Comfortable Journeys">
                        <h3>Comfortable Journey</h3>
                        <p>Experience unparalleled comfort in our modern fleet of buses. With spacious seating, ample legroom, and a relaxing ambiance, your journey with TravelEase is as enjoyable as the destination itself.</p>
                    </div>
                
                    <div class="card1">
                        <img src="/images/hassle-free.jpg"
					alt="Hassle-Free Booking" class="hassle-free-img">
                        <h3>Easy Booking</h3>
                        <p>Booking your bus ticket is a breeze with TravelEase. Our user-friendly platform allows you to search for routes, choose travel dates. Say goodbye to long queues and hello to convenience.</p>
                    </div>
                
                    <div class="card">
                        <img src="/images/routes.jpg" alt="Extensive Routes">
                        <h3>Extensive Routes</h3>
                        <p>Our extensive network covers a wide range of routes, connecting you to both bustling cities and serene various destinations with various experiences. Wherever you wish to go, TravelEase has you covered.</p>
                    </div>
                
                    <div class="card">
                        <img src="/images/comfortable-seat2.jpg"
					alt="Modern Amenities">
                        <h3>Modern Amenities</h3>
                        <p>Experience a journey like never before with our modern amenities. Stay connected with complimentary Wi-Fi, charge your devices on the go, and enjoy entertainment that makes every moment memorable.</p>
                    </div>
                </div>
                <div class="div3">
               <div class="girl-app-div">
                    <img src="/images/girl-app-removebg-preview.png"
					class="girl-app-img">
               </div> 
               <div class="content-of-girl-app">
                    <p class="girl-content-heading">Choose TravelEase & Make Travel lot of fun &#129321;</p>
                    <div class="small-paras">
                        <div class="vertical-line">
                            <h2 class="small-paras-heading">Get Notified</h2>
                            <p class="small-para-content">When the bus starts and <br>about to reach you</p>
                        </div>
                        <div class="vertical-line">
                            <h2 class="small-paras-heading">Lightening Fast</h2>
                            <p class="small-para-content">Book in 30 seconds <br>Even in low network</p>
                        </div>

                    </div>
                    <div class="small-paras1">
                        <div class="vertical-line">
                            <h2 class="small-paras-heading">Trusted by Millions</h2>
                            <p class="small-para-content">Over 1,00,000 reviews  <br>from our customers</p>
                        </div>
                        <div class="vertical-line1">
                            <h2 class="small-paras-heading">Enjoy other stuffs</h2>
                            <p class="small-para-content">Games,entertainment,offers,<br>free rides and a lot more</p>
                        </div>

                        
                    </div>
                   </div>
            </div>
            <h1 style="margin-top:20px" >Some famous places we travel</h1>
       
            <div class="div4">
            
            <div class="tourist-card">
                <img src="/images/hyderabad.jpg" alt="Hyderabad">
                <h3>Hyderabad</h3>
                
            </div>
                        
            <div class="tourist-card">
                <img src="/images/Kurnool.jpg" alt="Kurnool">
                <h3>Kurnool</h3>
            </div>
            <div class="tourist-card">
                <img src="/images/Nagarjunasagar.jpg" alt="Nagarjun sagar"
					class="hassle-free-img">
                <h3>Nagarjuna Sagar</h3>
            </div>
            <div class="tourist-card">
                <img src="/images/tirupathi.JPG" alt="Tirupathi">
                <h3>Tirupathi</h3>
            </div>

            </div>
          

 
            <div class="div5" id="services-div">
                <h3 class="max-heading1">24/7 Customer Assistance</h3>
                <p class="max-content1">You can reach TravelEase customer support for any kind of queries related to bus ticket offers, ticket booking online. TravelEase customer support team is available for 24/7. You can reach out to us on ph.no. 040-61656543 on any related to ticket bookings on TravelEase.</p>
                <div class="max-images-div">
                    <div class="max-image-sub">
                        <img src="/images/max1.jpg" class="max-pic1">
                        <h3 class="max-heading1">More Savings</h3>
                        <p class="max-content2">Book bus tickets at the lowest ticket fare on TravelEase and avail discounts, coupons codes offers on bus ticket booking, cashback and more savings on ticket booking online.</p>
                    </div>
                    <div class="max-image-sub">
                        <img src="/images/max2.jpg" class="max-pic2">
                        <h3 class="max-heading1">100% Secure Payments</h3>
                        <p class="max-content2">Customer security is important to TravelEase. We have ensured that customers' personal information is safeguarded at all times with industry standard data encryption.</p>
                    </div>
                    <div class="max-image-sub">
                        <img src="/images/max3.jpg" class="max-pic3">
                        <h3 class="max-heading1">Surprise Gifts</h3>
                        <p class="max-content2">TravelEase offers plenty of occasions to give surprise gifts to the customers when they book bus tickets. Book your ticket now and avail a special gift today!</p>
                    </div>

                </div>
            </div>
            <div id="contact-division">
            <div class="div6">
                <p class="max-content3">We're social! Connect with us on 
                <a href="#" class="fa fa-facebook"></a>
                <a href="#" class="fa fa-twitter"></a>
                <a href="#" class="fa fa-google"></a>
                <a href="#" class="fa fa-instagram"></a>
            </p>
            </div>
            <div class="div7">
                <div class="div7-subdiv">
                    <img src="/images/logo.jpg" class="logopic1">
                    <p class="max-content4">TravelEase is the world's largest online bus ticket booking service trusted by over 25 million happy customers globally. TravelEase offers bus ticket booking through its website for all major routes.</p>
                </div>

                <div class="div7-subdiv1">
                    <h3 class="max-heading1">About TravelEase</h3>
                    <p class="max-content5">About Us<br>Investor Relations<br>Contact Us<br>Offers<br>Sitemap<br>carrers<br>values</p>
                </div>
                <div class="div7-subdiv2">
                    <h3 class="max-heading1">Info</h3>
                    <p class="max-content6">T&C<br>Privacy policy<br>FAQ<br>Blog<br>Bus Operator Regostration<br>Insurance partner<br>User agent </p>
                </div>
                <div class="div7-subdiv">
                    <h3 class="max-heading1">Our Partners</h3>
                    <p class="max-content7">Josh Travels<br>Vki Travels<br>Tech Bus<br>Kavya Travels<br>Vara Travels<br>Srikar Travels<br>MakeMyTrip Hotels</p>
                </div>
            </div>
            <div class="div8">
                <p class="copyrights-para">Contact: +91 8734561234 <br>C @2020 TravelEase India Pvt Ltd. All rights reserved.</p>
            </div>
            </div>
</div>
	 
	</jsp:attribute>
</m:mastermain>