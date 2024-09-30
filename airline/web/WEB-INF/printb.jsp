<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Flight Ticket</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-image: url("book.jpeg");
                background-repeat: no-repeat;
                background-size: 100%;
            }
            .ticket-container {
                width: 50%;
                margin: 0 auto;
                border: 1px solid #ddd;
                padding: 20px;
                background-color: #f9f9f9;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            }
            h1 {
                text-align: center;
            }
            .ticket-details {
                margin-top: 20px;
                font-size: 16px;
            }
            .ticket-details p {
                line-height: 1.5;
            }
        </style>
    </head>
    <body>
        <div class="ticket-container">
            <h1>Your Flight Ticket</h1>
            <div class="ticket-details">
                <p><strong>Passenger Name:</strong> <%= session.getAttribute("pname") %></p>
                <p><strong>passport Number:</strong> <%= session.getAttribute("pnum") %></p>
                <p><strong>Age:</strong> <%= session.getAttribute("age") %></p>
                <p><strong>Class:</strong> <%= session.getAttribute("pclass") %></p>
                <hr>
                <p><strong>From:</strong> <%= session.getAttribute("ufrom") %></p>
                <p><strong>To:</strong> <%= session.getAttribute("uto") %></p>
                <p><strong>Date of Journey:</strong> <%= session.getAttribute("udate") %></p>
            </div>
            <p style="text-align: center; margin-top: 20px;">Thank you for booking with us!</p>
        </div>
    </body>
</html>
