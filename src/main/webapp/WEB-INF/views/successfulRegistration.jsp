<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="m"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<m:registrationmaster title="Login">
	<jsp:attribute name="head">
	<style>
	.main-div{
	width: 100%;
	height:520px;
	background-image: url("/images/busimage1.jpg");
	 background-size: cover; 
	background-repeat: no-repeat;
	
	}
.div1 {
	margin-top:100px;
	display: flex;
	flex-direction: row;
	margin-left:-30px;
}

.login-form {
	margin-top: 10px;
	min-height: 170px; /* Set a minimum height */
	width: 300px;
	margin-left: 160px;
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
margin-top:-5px;
	margin-left: 20px;
	font-size: 20px;
	color: #1E4969;
}

.input-box {
	height: 30px;
	width: 270px;
	margin-left: 10px;
	margin-bottom: 10px;
	border-radius: 3px;
	border: 1px solid #1E4969;
}

.submit-button {
	height: 40px;
	width: 283px;
	margin-left: 10px;
	margin-bottom: 10px;
	border-radius: 3px;
	border: 2px solid #1E4969;
	background-color: #1E4969;
	color: #F0F8FF;
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

.customer-msg{
            	text-align: center; 
            	padding:10px;
            	margin-left:300px;
            	width:45%;
            	border-radius:10px;
            	font-weight: bold;
            	background-color:#ACE1AF;
            	 color: #006400;
            	 font-size:25px;
            	 font-family: 'Times New Roman', Times, serif;
            }
</style>
<script>


document.addEventListener('contextmenu', function (e) { e.preventDefault(); });
</script>
	</jsp:attribute>
	<jsp:attribute name="content">

		<div class="main-div" >
		     <div class="customer-msg">
            <a:out value="${str}"></a:out>
            </div>
		 <div class="div1">
			<f:form action="loginAdmin" modelAttribute="l" autocomplete="off" >
				    
                <div class="login-form">              

                <h2 class="happy-text">We are happy to have you here</h2>

                <f:input type="text" placeholder="Username"
						path="userId" class="input-box" required="required"  style="padding-left: 10px;" />

                <f:input type="password" placeholder="Password"
						path="password" class="input-box" required="required" style="padding-left: 10px;" />  

                <input type="submit" class="submit-button" value="Login" >

   
            </div>     
		
			
				
		</f:form>
	 </div>
	 </div>
	</jsp:attribute>
</m:registrationmaster>