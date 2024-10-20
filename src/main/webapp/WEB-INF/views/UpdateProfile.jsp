<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib tagdir="/WEB-INF/tags/" prefix="m"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<m:customermaster title="Login">
	<jsp:attribute name="head">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    $(document).ready(function() {

            var customerId="${sessionScope.customerId}";
     
            $.ajax({
                type: "Get",
                url: "http://localhost:9999/getCustomerById/"+customerId,
                datatype:"json",
                async:false,
                contentType:"application/json;charset=utf-8",
                success: function(data) {
                    //$("#profileFields").removeClass("hidden");
                    $("#customerId").val(data.customerId);
                    
                    $("#customerName").val(data.customerName);
                    $("#address").val(data.address);
                    $("#city").val(data.city);
                    $("#pincode").val(data.pincode);
                    $("#email").val(data.email);
                    $("#dob").val(data.dob);
                    $("#contactNo").val(data.contactNo);
                    $("#gender").val(data.gender);
                    $("#gender").attr("readonly", "readonly");
                    /* $("#customerId").attr("readonly", "readonly"); */
                    $("#dob").attr("readonly", "readonly");
                    $("#state").append("<option value='Select'>"+data.state+"</option>");
					$("#country").append(
							"<option value='Select'>"+data.country+"</option>");
					$.ajax({
						type : 'GET',
						url : "http://localhost:9999/getcountries",
						//data:JSON.stringify(V),
						dataType : "JSON",
						contentType : "application/json;charset=utf-8",
						async : false,
						success : function(data) {
							//alert(data.length);

							for (var i = 0; i < data.length; i++) {
								$("#country").append(
										"<option value='" + data[i].countryName + "'>"+ data[i].countryName+ "</option>");
							}
						},
						error : function(x, err) {
							alert("readyState -" + x.readyState);
							alert("responseText -" + x.responseText);
						}

					});//endofajax

					$("#country").change(function() {
										var countryName = $("#country").val();
										$.ajax({type : "GET",
										url : "http://localhost:9999/countryID/"+ countryName,
										//data: "{'CiD':'" + $("#country").val() + "'}",
										dataType : "json",
										contentType : "application/json;charset=utf-8",
										async : false,
										success : function(data) {
										$("#state").empty();
										$("#state").append("<option value=-1>select</option>");
								for (var i = 0; i < data.length; i++) {
									$("#state").append("<option value='" + data[i] + "'>"+ data[i]+ "</option>");
									}
									},
									error : function(x, err) {
									alert("readyState "+ x.readyState);
									alert("responseText "+ x.responseText);
								}
						});
					});//endofajax
                    
                },
            error:function(x,error){
                alert("readyState"+x.readyState);
                alert("response"+x.responseText);
            }
            });
            
            var amount="${str}";
        	if(amount){
        	var modal = $("#myModal");
            var modalMessage = $("#modalMessage");
            var okButton = $("#okButton");
            //modalMessage.html("Ticket Cancelled successfully"); // Use .html() to render HTML content
            //modalMessage.css("white-space", "pre-line");
            modal.css("display", "block");
            okButton.click(function() {
                modal.css("display", "none");
            });
        	}
    });
        

</script>

<style>
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


    form {
  
         background-color: #F0F8FF; 
        border-radius: 5px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        padding: 20px;
        margin-top: 20px;
        max-width:800px;
		margin-left:17%;
		
		font-size: 20px;
    color:#1E4969;
    font-family:'Times New Roman', Times, serif;
   }    
	#cId
	{	
		margin-left:30px;
		padding : 8px;
	}
    table {
        width: 100%;
        border-collapse: collapse;
    }

    table td {
        padding: 10px;
    }

    /* Hidden class for hiding elements */
    .hidden {
        display: none;
    }

    /* Form Columns */
    .form-columns {
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
       
       
    }

    .form-column {
        width: 48%; /* Adjust as needed */
        margin-bottom: 20px;
       
    }
	
    /* Input Styles */
    input[type="text"],select.input-field
    {
    	margin-top : 10px;
    	margin-bottom : 10px;
    }
    .input-field {
        width: 100%;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 3px;
        box-sizing: border-box;
    }

    
    /* Submit Button Styles */
    .submit-button {
        background-color: #1E4969;
        color: #F0F8FF;
        border: none;
        margin-top:10px;
       margin-left:100px;
        padding : 12px;
        border-radius: 3px;
        cursor: pointer;
        transition: background-color 0.3s, color 0.3s;
    }

    input[type="submit"]:hover {
        transform: scale(1.1);
    } 
	#submit-profile
	{
		margin-left:38%;
	}
    /* Responsive Styles */
    @media (max-width: 768px) {
        .form-columns {
            flex-direction: column;
        }

        .form-column {
            width: 100%;
        }
    }
	.error-message {
        color: red;
        font-size: 14px;	
		margin-top: 2px;
        display: block;
    }
    .success-message {
        color: green;
        font-size: 30px;	
		margin-top: 2px;
        font-weight:bold;
        margin-left:150px;
        margin-bottom:5px;
    }

	.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	padding-top:30px;
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
	width: 23%;
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
	maargin-bottom:10px;
	background-color: #1E4969;
	color: white;
	text-decoration: none;
	border-radius: 4px;
	cursor: pointer;
	margin-top:20px;
	margin-left: 240px;
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
.bg-image{
	
	z-index:-2;
    background-image: url("/images/busimage1.jpg");
    background-size: cover;
    background-repeat: no-repeat; /* Add this line */
    position:absolute;
    padding-top:30px;
    min-height:100vh;
    width:100vw;
}
.overlay{
position:absolute;
	background-color:rgba(0,0,0,0.3);
	min-height:105vh;
	width:100vw;
	z-index:-1;
} 

</style>
</jsp:attribute>
<jsp:attribute name="content">
<div class="marquee-div">
			<div class="marque-text">&#128652;Welcome to TravelEase</div>
			<div class="marque-text">&#128652;Welcome to TravelEase</div>
			<div class="marque-text">&#128652;Welcome to TravelEase</div>
		</div>
<div class="bg-image"></div>
		<div class="overlay"></div>
<f:form action="updateProfile" method="post" id="profileFields" modelAttribute="c">
		<div id="myModal" class="modal">
        <div class="modal-content">
            <p id="modalMessage"></p>
            <div class="modal-buttons">
				<a:out value="${str }"></a:out>
                <a href="/checkticket" class="ok-button">ok</a>
            </div>
        </div>
    </div>
    <div class="form-columns">
        <div class="form-column">
            <label for="customerID">CustomerId:</label>
            <f:input type="text" path="customerId" readonly="true" class="input-field" />
            <f:errors path="customerId"  class="error-message" /><br>
            
            <label for="customerName">CustomerName:</label>
            <f:input type="text" path="customerName" class="input-field" required="required"/>
            <f:errors path="customerName"  class="error-message" /><br>
            
            <label for="country">Country:</label><f:select type="text" path="country" class="input-field" /><f:errors path="country"  class="error-message" /><br>
            
            <label for="state">State:</label><f:select type="text" path="state" class="input-field" /><f:errors path="state"  class="error-message" /><br>
            
            <label for="address">Address:</label><f:input type="text" path="address" class="input-field" required="required"/><f:errors path="address"  class="error-message" /><br>
            
            <label for="city">City:</label><f:input type="text" path="city" class="input-field" required="required"/><f:errors path="city"  class="error-message" /><br>
        </div>
        <div class="form-column">
            <label for="pincode">Pincode:</label><f:input type="text" path="pincode" class="input-field" required="required"/><f:errors path="pincode"  class="error-message" /><br>
            
            <label for="email">Email:</label><f:input type="text" path="email" class="input-field" required="required"/><f:errors path="email"  class="error-message" /><br>
    
            <label for="gender">Select Gender:</label>
            <f:input type="text" path="gender" class="input-field"/><f:errors path="gender"  class="error-message" /><br>
              	
            <label for="dob">DOB:</label><f:input type="text" path="dob" class="input-field" /><f:errors path="dob"  class="error-message" /><br>
            
            <label for="contactNo">ContactNo:</label><f:input type="text" path="contactNo" class="input-field" required="required"/><f:errors path="contactNo"  class="error-message" /><br>
            
            <input type="submit" value="Update Profile" class="submit-button" id="submit-profile">
        </div>
    </div>
</f:form>
  
</jsp:attribute>
</m:customermaster>