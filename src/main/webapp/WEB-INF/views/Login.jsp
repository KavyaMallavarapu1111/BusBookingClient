<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="m"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<m:master title="Login">
	<jsp:attribute name="head">
	<style>
.div1 {
	width: 100%;
	height:520px;
	background-image: url("/images/busimage1.jpg");
	 background-size: cover; 
	background-repeat: no-repeat;
	display: flex;
	flex-direction: row;
	
}

.login-form {
	margin-top: 110px;
	min-height: 250px; /* Set a minimum height */
	width: 350px;
	margin-left: 140px;
	background-color: #F0F8FF;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); 
	padding: 20px; 
}


.hello-text {
	margin-left: 150px;
	font-size: 25px;
	color: #1E4969;
}

.happy-text {
	margin-left: 40px;
	font-size: 20px;
	color: #1E4969;
}

.input-box {
	height: 30px;
	width: 270px;
	margin-left: 35px;
	margin-bottom: 10px;
	border-radius: 3px;
	border: 1px solid #1E4969;
}

.submit-button {
	height: 40px;
	width: 283px;
	margin-left: 35px;
	margin-bottom: 10px;
	border-radius: 3px;
	border: 2px solid #1E4969;
	background-color: #1E4969;
	color: #F0F8FF;
}

.account-text {
	margin-left: 35px;
	margin-top: -0px;
	font-size: 20px;
	color: #1E4969;
}

.register-text {
	margin-left: 13px;
	font-size: 20px;
	color: #1E4969;
}

::placeholder {
	font-family: 'Times New Roman', Times, serif;
	font-size: 14px;
	
}
.div2{
	height: 30px;
	background-color: #1E4969;
	color: #F0F8FF;
	margin-top:-2px
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
.error-msg{
            	text-align: center; 
            	margin-top: 0px; 
            	font-weight: bold;
            	 color: red;
            	 font-size:20px;
            	 font-family: 'Times New Roman', Times, serif;
            }
</style>
<script>


document.addEventListener('contextmenu', function (e) { e.preventDefault(); });
</script>
	</jsp:attribute>
	<jsp:attribute name="content">
<div class="marquee-div">
			<div class="marque-text">&#128652;Welcome to TravelEase</div>
			<div class="marque-text">&#128652;Welcome to TravelEase</div>
			<div class="marque-text">&#128652;Welcome to TravelEase</div>

		</div>
		 <div class="div1" style="margin-top:90px;">
			<f:form action="loginAdmin" modelAttribute="l" autocomplete="off" >
				    
                <div class="login-form">              

                <h2 class="happy-text">We are happy to have you here</h2>

                <f:input type="text" placeholder="Username"
						path="userId" class="input-box" required="required"  style="padding-left: 10px;" />

                <f:input type="password" placeholder="Password"
						path="password" class="input-box" required="required" style="padding-left: 10px;" />  

                <input type="submit" class="submit-button" value="Login" >

                <div style="display: flex; margin-top: 10px;">

                <p class="account-text">Don't have an account?</p>

                <a href="/customerRegistration" class="register-text">Register</a>
					
                   </div> 
                  <div class="error-msg">
            <a:out value="${str}"></a:out>
            </div>
            </div>     
		
			
				
		</f:form>
	 </div>
	 
	</jsp:attribute>
</m:master>