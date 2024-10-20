<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="m"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<m:adminmaster title="Login">
    <jsp:attribute name="head">
    <style>
       .form-container {
        margin: 120px auto;
        padding: 5px;
        background-color: #F0F8FF;
        border-radius: 5px;
        box-shadow: 0 2px 4px #1E4969;
        display: table;
        width: auto; /* Set width to auto for adjustable container */
    }
      .td-heading {
                font-size: 20px;
                color:#1E4969;
                font-family:'Times New Roman', Times, serif;
            }

    table {
        width: 100%;
    }

    td {
        padding: 10px;
    }
    
    .td-heading {
        font-size: 20px;
        color: #1E4969;
        font-family: 'Times New Roman', Times, serif;
    }

    .error-td {
        padding: 10px;
        white-space: nowrap;
        color: red;
    }

    input[type="submit"] {
        background-color: #1E4969;
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 3px;
        cursor: pointer;
    }
    .submit-div{
    
    	text-align: center;
    	 vertical-align: middle;
    	}
       .success-msg{
            	text-align: center; 
            	margin-top: 5px; 
            	font-weight: bold;
            	 color: red;
            	 padding:5px;
            	 font-size:25px;
            }
	.row-container {
                display: flex;
                align-items: center;
                
            } 
            .img1{
            	height:300px;
            	width:300px;
            	margin-top:50px;
            	margin-left:150px;
            	margin-right:-70px;
            	
            }
            .autocomplete-items{
            	background-color: #1E4969;
            	color:#F0F8FF;
            	
            	border-radius:3px;
            
            }
            
    /* Add your media queries for responsiveness here */
    @media (max-width: 768px) {
        .form-container {
            padding: 10px;
        }

        td {
            padding: 5px;
        }
    }
        </style>
        <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
           <script>
    function myFunc(){
    	var from=document.getElementById("fromLocation").value;
    	var to=document.getElementById("toLocation").value;
    	
    	if(from===to){
    		alert("From Location and To Location should not be same");
    		return false;
    	}
    	return true;
    }
    </script>
    <script>
    function searchSuggestions() {
        const input = document.getElementById("fromLocation");
        const inputValue = input.value.trim();
        const suggestionDropdown = document.getElementById("suggestionDropdown");
        // Clear previous suggestions
        suggestionDropdown.innerHTML = "";
        // Fetch suggestions from your database or predefined list
        const suggestions = getSuggestionsFromDatabase(inputValue);
        // Display suggestions in the dropdown
        suggestions.forEach(suggestion => {
            const suggestionItem = document.createElement("div");
            suggestionItem.textContent = suggestion;
            suggestionItem.addEventListener("click", () => {
                input.value = suggestion;
                suggestionDropdown.innerHTML = ""; // Clear suggestions after selection
            });
            suggestionDropdown.appendChild(suggestionItem);
        });
        // Show or hide the dropdown based on suggestions
        if (suggestions.length > 0) {
            suggestionDropdown.style.display = "block";
        } else {
            suggestionDropdown.style.display = "none";
        }
    }
    // Replace this function with actual fetching of suggestions from your database
    function getSuggestionsFromDatabase(flocation) {
        // Simulated suggestions for demonstration
        const mockSuggestions = [
            // ... more suggestions
        ];
        $.ajax({
            type : 'GET',
            url : "http://localhost:9999/LocationStart/"+flocation,
            dataType : "JSON",
            contentType : "application/json;charset=utf-8",
            async : false,
            success : function(data) {
                
                 for (var i = 0; i < data.length; i++) {
                	 
                     const from_location = data[i].place;
                     //alert( data[i].place);
                    mockSuggestions.push(from_location);
                } 
            },
            error : function(x, err) {
            }
        });//endofajax
        return mockSuggestions.filter(suggestion =>
            suggestion.toLowerCase().includes(flocation.toLowerCase())
        );
    }

    function searchSuggestions1() {
        const input = document.getElementById("toLocation");
        const inputValue = input.value.trim();
        const suggestionDropdown1 = document.getElementById("suggestionDropdown1");
        // Clear previous suggestions
        suggestionDropdown1.innerHTML = "";
        // Fetch suggestions from your database or predefined list
        const suggestions = getSuggestionsFromDatabase(inputValue);
        // Display suggestions in the dropdown
        suggestions.forEach(suggestion => {
            const suggestionItem = document.createElement("div");
            suggestionItem.textContent = suggestion;
            suggestionItem.addEventListener("click", () => {
                input.value = suggestion;
                suggestionDropdown1.innerHTML = ""; // Clear suggestions after selection
            });
            suggestionDropdown1.appendChild(suggestionItem);
        });
        // Show or hide the dropdown based on suggestions
        if (suggestions.length > 0) {
        	suggestionDropdown1.style.display = "block";
        } else {
            suggestionDropdown1.style.display = "none";
        }
    }
    </script>
    </jsp:attribute>
    <jsp:attribute name="content">
    	<div class="row-container">
    	<img src="/images/route.png" class="img1">
    
        <div class="form-container">
            <f:form action="addNewRoute" modelAttribute="R">
                <table>
                    <tr>
                        <td class="td-heading">Enter RouteId</td>
                        <td><f:input path="routeId" value="${routeId }" readonly="true"/></td>
                        <td class="error-td"><f:errors path="routeId" /></td>
                    </tr>
                    <tr>
                        <td class="td-heading" >Enter FromLocation</td>
                        <td><f:input path="fromLocation" onkeyup="searchSuggestions()"/>
                        <div id="suggestionDropdown" class="autocomplete-items"  ></div>
                        </td>
                        <td class="error-td"><f:errors path="fromLocation" /></td>
                    </tr>
                    <tr>
                        <td class="td-heading">Enter ToLocation</td>
                        <td><f:input path="toLocation" onkeyup="searchSuggestions1()"/>
                        <div id="suggestionDropdown1" class="autocomplete-items"></div>
                        </td>
                        <td class="error-td"><f:errors path="toLocation" /></td>
                    </tr>
                    <tr>
				    <td colspan="3" class="submit-div">
				        <input type="submit" value="ADD ROUTE" onclick="return myFunc();">
				    </td>
				</tr>	
                </table>
                <div class="success-msg">
    <a:out value="${str}" />
    <a:out value="${str1}" />
    <a:choose>
        <a:when test="${str == 'Route added successfully'}">
            <style>
                .success-msg {
                    color: green;
                }
            </style>
        </a:when>
        <a:otherwise>
            <style>
                .success-msg {
                    color: red;
                }
            </style>
        </a:otherwise>
    </a:choose>
</div>
            </f:form>
        </div>
        	</div>
    </jsp:attribute>
</m:adminmaster>
