<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="m"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<m:registrationmaster title="Login">
	<jsp:attribute name="head">
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#state").append("<option value=-1>select</option>");
						$("#country").append(
								"<option value='-1''>select</option>");
						$.ajax({
							type : 'GET',
							url : "http://localhost:9999/getcountries",
							//data:JSON.stringify(V),
							dataType : "JSON",
							contentType : "application/json;charset=utf-8",
							async : false,
							success : function(data) {
								//alert(data.length);
								$("#country").empty();
								$("#country").append("<option value='' disabled selected required>select</option>");
								for (var i = 0; i < data.length; i++) {
									$("#country").append("<option value='" + data[i].countryName + "'>"+ data[i].countryName+ "</option>");
								}
							},
							error : function(x, err) {
								alert("readyState -" + x.readyState);
								alert("responseText -" + x.responseText);
							}

						});//endofajax

						$("#country")
								.change(
										function() {
											var countryName = $("#country")
													.val();
											$
													.ajax({
														type : "GET",
														url : "http://localhost:9999/countryID/"
																+ countryName,
														//data: "{'CiD':'" + $("#country").val() + "'}",
														dataType : "json",
														contentType : "application/json;charset=utf-8",
														async : false,
														success : function(data) {
															$("#state").empty();
															$("#state")
																	.append(
																			"<option value='' disabled selected required>select</option>");
															for (var i = 0; i < data.length; i++) {
																$("#state")
																		.append(
																				"<option value='" + data[i] + "'>"
																						+ data[i]
																						+ "</option>");
															}
														},
														error : function(x, err) {
															alert("readyState "
																	+ x.readyState);
															alert("responseText "
																	+ x.responseText);
														}
													});
										});//endofajax
						$("#submitbtn").click(function(event) {
							let v1 = $("#customerPassword").val();
							let v2 = $("#confirmpassword").val();
							if (v1 != v2) {
								alert("Enter Same Password");
								event.preventDefault();
							}
						});
					});//endofjquery
</script>
<style>
label {
	font-size: 18px;
	color: #1E4969;
	font-family: 'Times New Roman', Times, serif;
}

.registration-form {
	max-width: 800px;
	margin-top:30px;
	margin-left:250px;
	/*  margin: 0 auto; */
	
	padding-top:400px;
	padding: 20px;
	background-color: #F0F8FF; 
	border: 1px solid #ccc;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
}

.form-columns {
	display: flex;
	
	
	flex-wrap: wrap;
	/* margin-top:200px; */
}

.form-column {
	flex: 1;
	padding: 0 20px 20px 0;
	box-sizing: border-box;
	max-width: 50%;
}

.registration-form input[type="text"], .registration-form input[type="password"],
	.registration-form select, .registration-form textarea,
	.registration-form input[type="date"] {
	width: 90%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
	font-size: 14px;
	margin-bottom: 10px;
}

.registration-form select {
	width: 95%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
	font-size: 14px;
	margin-bottom: 10px;
}

.registration-form input[type="submit"] {
	background-color: #1E4969;
	color: #fff;
	border: none;
	padding: 10px 20px;
	border-radius: 3px;
	cursor: pointer;
	margin-left: 275px;
	margin-top: 10px;
}

.registration-form input[type="submit"]:hover {
	background-color: #16415B;
}

.error-message {
	color: red;
	font-size: 14px;
	margin-top: 2px;
	display: block;
}

@media ( max-width : 768px) {
	.form-columns {
		flex-direction: column;
	}
	.form-column {
		max-width: 100%;
		padding: 0;
	}
}
.bg-image{
	
	z-index:-2;
    background-image: url("/images/busimage1.jpg");
    background-size: cover;
    background-repeat: no-repeat; /* Add this line */
    position:absolute;
    padding-top:30px;
    height:85vh;
    width:100vw;
}
.overlay{
position:absolute;
	background-color:rgba(0,0,0,0.3);
	height:90vh;
	width:100vw;
	z-index:-1;
} 

</style>

	</jsp:attribute>
	<jsp:attribute name="content">
			<div class="bg-image"></div>
		<div class="overlay"></div>
         <f:form method="POST" modelAttribute="c" action="customer"
			class="registration-form">
            <div class="form-columns"   >
		    <div class="form-column">
		        <!-- First column fields -->
		        <label for="customerName">Enter Customer Name</label>
		        <f:input type="text" id="customerName" path="customerName"
								placeholder="Enter your name" required="required" />
		        <f:errors path="customerName" class="error-message" />
							<br>
		
		        <label for="address">Enter Address</label>
		        <f:input type="text" id="address" path="address"
								placeholder="Enter your address" required="required" />
		        <f:errors path="address" class="error-message" />
							<br>
		
		        <label for="country">Enter country</label>
		        <f:select id="country" path="country"
								placeholder="Choose your country" required="required" ></f:select>
		        <f:errors path="country" class="error-message" />
							<br>
		
		        <label for="state">Enter state  </label>
		        <f:select id="state" path="state"
								placeholder="Choose your state" required="required" ></f:select>
		        <f:errors path="state" class="error-message" />
							<br>
		
		        <label for="pincode">Enter pincode</label>
		        <f:input type="text" id="pincode" path="pincode"
								placeholder="Enter your pincode" required="required" />
		        <f:errors path="pincode" class="error-message" />
							<br>
		
		        <label for="city">Enter city</label>
		        <f:input type="text" id="city" path="city"
								placeholder="Enter your city name" required="required" />
		        <f:errors path="city" class="error-message" />
							<br>
		        <!-- Second column fields -->
		        
		    	</div>
		    	<div class="form-column">
		        
				<div class="form-group">
				<label for="email">Enter Email</label>
		        <f:input type="text" id="email" path="email"
								placeholder="abc@gmail.com" required="required" />
		        <f:errors path="email" class="error-message" />
							<br>
				    <label for="gender">Select Gender</label>
				    <f:select id="gender" path="gender" class="input-field"
											required="required">
				        <option value="" disabled selected>Select gender</option>
				        <option value="Female">Female</option>
				        <option value="Male">Male</option>
				        <option value="Trans">Prefer not to say</option>
				    </f:select>
				    <f:errors path="gender" class="error-message" />
				</div>

			        <label for="contactNo">Enter contact No</label>
			        <f:input type="text" id="contactNo" path="contactNo"
									placeholder="Enter your contact No" required="required" />
			        <f:errors path="contactNo" class="error-message" />
								<br>
			
			        <label for="dob">Enter Dob</label>
			        <f:input type="date" id="dob" path="dob"
									placeholder="Enter your date of Birth" required="required" />
			        <f:errors path="dob" class="error-message" />
								<br>
			
			        <label for="customerPassword">Enter Password</label>
			        <f:input type="password" id="customerPassword"
									path="customerPassword" placeholder="Enter any password"
									required="required" />
			        <f:errors path="customerPassword" class="error-message" />
								<br>
			
			        <label for="confirmpassword" required="required">Confirm Password</label>
			        <input type="password" id="confirmpassword"
									placeholder="Confirm your password" />
			
			        <input type="submit" id="submitbtn" value="Register" />
			    </div>
			</div>
			

           </f:form>
	</jsp:attribute>
</m:registrationmaster>