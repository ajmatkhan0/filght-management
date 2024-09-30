<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight Listing</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- CSS for styling -->
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url("airline.jpg");
                background-repeat: no-repeat;
                background-size: 100%;
        }

        header {
            background-color: #1a73e8;
            color: white;
            padding: 20px;
            text-align: center;
        }

        #flight-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
        }

        .flight-card {
            width: 100%;
            max-width: 500px;
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .flight-card h2 {
            margin: 0 0 10px 0;
            color: #333;
        }

        .flight-card p {
            margin: 5px 0;
            color: #555;
        }

        .airline-link {
            color: #1a73e8;
            text-decoration: none;
            font-weight: bold;
        }

        .airline-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <!-- Header of the webpage -->
    <header>
       
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
        <h1>Available Flights</h1>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="dashboard.html">Dashboard</a>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link" href="showtic.jsp">Bookings</a>
                </li>
                
            </ul>
        </div>
    </div>
</nav>
    </header>


    <div id="flight-container">
        <%
            // Fetch 'from' and 'to' data from session
            String ufrom = (String) session.getAttribute("ufrom");
            String uto = (String) session.getAttribute("uto");
            String udate = (String) session.getAttribute("udate");
            if (ufrom != null && uto != null) {
        %>
                <div class="flight-card">
                    <h2><a href="airline-a.html">AirLine A</a></h2>
                    <p>From: <%= ufrom %></p>
                    <p>To: <%= uto %></p>
                    <p>date:<%=udate%></p>
                    <p>Time: <%= "10:00 AM" %></p>
                    <p>Price: <%= "$500" %></p>
                    
                </div>
                 <div class="flight-card">
                     <h2><a href="airline-b.html">AirLine B</a></h2>
                    <p>From: <%= ufrom %></p>
                    <p>To: <%= uto %></p>
                    <p>date:<%=udate%></p>
                    <p>Time: <%= "11:30 AM" %></p>
                    <p>Price: <%= "$600" %></p>
                </div>
                 <div class="flight-card">
                     <h2><a href="airline-c.html">AirLine C</a></h2>
                    <p>From: <%= ufrom %></p>
                    <p>To: <%= uto %></p>
                    <p>date:<%=udate%></p>
                    <p>Time: <%= "2:15 PM" %></p>
                    <p>Price: <%= "$700" %></p>
                </div>
        <%
            } else {
        %>
                <p>No flight data available. Please try again.</p>
        <%
            }
        %>
    </div>
</body>
</html>