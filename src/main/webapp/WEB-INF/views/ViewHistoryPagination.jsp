<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="m"%>
<m:customermaster title="viewHistory">
    <jsp:attribute name="head">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.7.0.js"
            integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
        <script>
        $(document).ready(function () {
            $('.page-link').click(function () {
                console.log("Link clicked!");
                $('.page-link').removeClass('selected');
                $(this).addClass('selected');
            });

            var amount = "${str}";
            if (amount) {
                var modal = $("#myModal");
                var modalMessage = $("#modalMessage");
                var okButton = $("#okButton");
                modal.css("display", "block");
                okButton.click(function () {
                    modal.css("display", "none");
                });
            }

            var totalPages = ${totalPages}; // Total number of pages
            var pageIndex = ${pageIndex};   // Current page index

            // Update pagination visibility based on total pages
            if (totalPages <= 1) {
                $('.pagination').hide();
            } else {
                $('.pagination').show();

                // Handle previous and next page links
                $('.prev-link').attr("href", "?pageIndex=" + Math.max(1, pageIndex - 1));
                $('.next-link').attr("href", "?pageIndex=" + Math.min(totalPages, pageIndex + 1));

                // Disable previous arrow link before the first page
                if (pageIndex <= 1) {
                    $('.prev-link').addClass('disabled');
                }

                // Disable next arrow link after the last page
                if (pageIndex >= totalPages) {
                    $('.next-link').addClass('disabled');
                }
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
table {
  width: 100%;
  border-collapse: collapse;
  
 	font-size: 20px;
   
    font-family:'Times New Roman', Times, serif;
}
.titlecolor
{	
	background-color : #1E4969;
}
body
{
	background-color : #F0F8FF;
}
table, th, td {
  border: 7px ridge #D3D3D3;
  padding: 8px;
  text-align: left;
  color:#F0F8FF; 
}
table
{
	margin-top:30px;
}
th 
{
  background-color: #1E4969;
  color:#f2f2f2;
}
td
{
 background-color : #F0F8FF;
 color : #1E4969;
}

h1{
	margin-top : 0px;
	text-align:center;
	background-color:#1E4969;
    color:#F0F8FF;
    font-family:'Times New Roman', Times, serif;
    padding-top : 10px;
    padding-bottom : 10px;
}

/* Add responsiveness using media queries */
@media screen and (max-width: 600px) {
  table {
    font-size: 12px;
  }
}

.pagination
{
   	margin-left : 40%;
   	margin-top : 80px;
  
}
.pagination li.active a
{
	color : white;
    background-color: #1E4969;
}
.page-item
{
	list-style-type:none;
}
.page-link,.previous,.next 
{
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
    transition: background-color 0.3s;
    border: 1px solid #ddd;
    margin: 0 4px;
    cursor: pointer;
   /*  background-color: #1E4969; */
	background-color:#ddd;
}	

.page-link:hover 
{
	color : black;
    background-color: #ddd;
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
    margin-top:180px;
    margin-left:420px;
    padding: 10px;
    border: 1px solid #888;
    border-radius: 10px;
    width: 40%;
    height: auto;
    position: relative;
    font-size:20px;
    color: #1E4969;
	text-align: center;
	font-family: 'Times New Roman', Times, serif;
    
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
    background-color: #1E4969;
    color: white;
    text-decoration: none;
    border-radius: 4px;
    cursor: pointer;
    margin-left: 450px;
    margin-top:10px;
}

.my-errors {
    margin-left: 3px;
    color: red;
}
.inputval {
    width: 100px;
}
/* Add styling for the formatted message */
#modalMessage {
    font-size: 20px;
    line-height: 1.5;
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
    height:75vh;
    width:100vw;
}
.overlay{
position:absolute;
	background-color:rgba(0,0,0,0.3);
	height:80vh;
	width:100vw;
	z-index:-1;
} 

	</style>
    </jsp:attribute>
    <jsp:attribute name="content">
        <div class="marquee-div">
            <!-- ... rest of your marquee content ... -->
            <div class="marque-text">&#128652;Welcome to TravelEase</div>
            <div class="marque-text">&#128652;Welcome to TravelEase</div>
            <div class="marque-text">&#128652;Welcome to TravelEase</div>
        </div>
	<div class="bg-image"></div>
		<div class="overlay"></div>
        <div class="bodycolor">
            <a:if test="${list !=null}">
                <a:choose>
                    <a:when test="${list.size()!=0 }">
                        <!-- ... your existing table code ... -->
				<table><tr><th>TransactionId</th><th>CustomerId</th><th>TransactionDate</th><th>ScheduleId</th><th>NoOfTickets</th><th>TicketId</th><th>Status</th><th>TotalFare</th></tr>
					<a:forEach items="${list}" var="l">
						<tr>
							
							<td>${ l.transactionId}</td><td>${l.customerId.customerId}</td><td>${l.transctionDate }</td><td>${l.scheduleId.sId }</td>
							<td>${l.noOfTickets }</td><td>${l.ticketId }</td><td>${l.status }</td><td>${l.totalFare }</td>
						</tr>
    				</a:forEach>
				</table>

                        <div class="row justify-content-center ">
                            <div class="col-md-10">
                <!-- Pagination -->
                <ul class="pagination">
                    <li class="page-item">
                        <a class="page-link prev-link" href="#"> &lt; </a>
                    </li>
                    <li class="page-item active">
                        <a class="page-link" href="?pageIndex=${pageIndex >= 1 ? pageIndex : 1}">
                            ${pageIndex >= 1 ? pageIndex : 1}
                        </a>
                    </li>
                    <li class="page-item">
                        <a class="page-link next-link" href="#">></a>
                    </li>
                </ul>
            </div>
                        </div>
                    </a:when>
                    <a:otherwise>
                        <div id="myModal" class="modal">
                            <div class="modal-content">
                                <p id="modalMessage"></p>
                                <div class="modal-buttons">
                                    <a:out value="${str}"></a:out>
                                    <a href="/checkticket" class="ok-button">ok</a>
                                </div>
                            </div>
                        </div>
                    </a:otherwise>
                </a:choose>
            </a:if>
        </div>
    </jsp:attribute>
</m:customermaster>
