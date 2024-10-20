<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags/" prefix="m"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<m:adminmaster title="Login">
    <jsp:attribute name="head">
       <style>
    /* Container for cards */
    .card-container {
        display: flex;
        justify-content: space-evenly; /* Align cards with equal space between */
        flex-wrap: wrap;
        gap: 20px; /* Gap between cards */
        padding-top: 100px;
    }

    /* Card styles */
    .card {
        background-color: #F0F8FF;
        border-radius: 5px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        padding: 20px;
        width: calc(25.33% - 20px); /* Each card occupies about a third of the container minus gap */
        text-align: center;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .card:hover {
	transform: translateY(-5px);
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}
.card1:hover {
	transform: translateY(-5px);
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

    .card img {
        width: 300px;
        height: 180px;
        border-radius: 5px;
    }
    .card1 {
        background-color: #F0F8FF;
        border-radius: 5px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        padding: 20px;
        width: calc(25.33% - 20px); /* Each card occupies about a third of the container minus gap */
        text-align: center;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .card1 img {
        width: 300px;
        height: 180px;
        border-radius: 5px;
    }

    a {
        text-decoration: none;
        color: #1E4969;
        font-weight: bold;
        padding-top:10px;
    }

    /* Responsive styles */
    @media (max-width: 768px) {
        .card {
            width: 100%;
        }
    }

</style>

    </jsp:attribute>
    <jsp:attribute name="content">
        <div class="card-container">
            <div class="card">
                <img src="/images/addbuses.jpeg" alt="Bus Image">
                <a href="http://localhost:8888/addnewbus" >ADD NEW BUS</a>
            </div>
            <div class="card1">
                <img src="/images/routes.jpg" alt="Route Image">
                <a href="http://localhost:8888/addnewroute">ADD NEW ROUTE</a>
            </div>
            <div class="card1">
                <img src="/images/busschedules.jpeg" alt="Schedule Image">
                <a href="http://localhost:8888/addnewschedule">ADD NEW SCHEDULE</a>
            </div>
        </div>
    </jsp:attribute>
</m:adminmaster>
