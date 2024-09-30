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
                position: absolute; 
                left: 50%;  
                top: 50%;   
                transform: translate(-50%, -50%);
                max-width: 600px;
                margin: 0 auto;
                background-color: #fff;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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
            .btn {
                display: inline-block;
                padding: 10px 20px;
                font-size: 16px;
                color: #fff;
                background-color: #007bff;
                border: none;
                border-radius: 5px;
                text-align: center;
                text-decoration: none;
                cursor: pointer;
                transition: background-color 0.3s ease;
                margin-top: 20px;
            }
            .btn:hover {
                background-color: #0056b3;
            }
            .btn-secondary {
                background-color: #6c757d;
            }
            .btn-secondary:hover {
                background-color: #5a6268;
            }

            /* Hide the print button and other content during print */
            @media print {
                body * {
                    visibility:visible;
                }
                #print-section, #print-section * {
                    visibility: visible;
                }
                #print-section {
                    position: absolute;
                    left: 0;
                    top: 0;
                    width: 100%;
                }
                /* Hide the print button */
                .btn {
                    display: none;
                }
            }
        </style>
    </head>
    <body>
        <div class="ticket-container">
            <h1>Your Flight Ticket</h1>
            <div class="ticket-details">
                <p><strong>Passenger Name:</strong> <%= session.getAttribute("pname") %></p>
                <p><strong>Passport Number:</strong> <%= session.getAttribute("pnum") %></p>
                <p><strong>Age:</strong> <%= session.getAttribute("age") %></p>
                <p><strong>Class:</strong> <%= session.getAttribute("pclass") %></p>
                 <p><strong>Price:</strong>$ <%= session.getAttribute("price") %></p>
                <hr>
                <p><strong>From:</strong> <%= session.getAttribute("ufrom") %></p>
                <p><strong>To:</strong> <%= session.getAttribute("uto") %></p>
                <p><strong>Date of Journey:</strong> <%= session.getAttribute("udate") %></p>
            </div>
            <p style="text-align: center; margin-top: 20px;">Thank you for booking with us!</p>

            <!-- Create Button to Redirect to Dashboard -->
            <div style="text-align: center;">
                <a href="dashboard.html" class="btn">View Dashboard</a>
                <!-- Print Button -->
                <button class="btn btn-secondary" onclick="window.print();">Print Ticket</button>
            </div>
        </div>

        <!-- Hidden Print Section -->
        <div id="print-section" style="display:none;">
            <p><strong>Passenger Name:</strong> <%= session.getAttribute("pname") %></p>
            <p><strong>Passport Number:</strong> <%= session.getAttribute("pnum") %></p>
            <p><strong>Age:</strong> <%= session.getAttribute("age") %></p>
            <p><strong>Class:</strong> <%= session.getAttribute("pclass") %></p>
             <p><strong>Price:</strong> $<%= session.getAttribute("pclass") %></p>
            <p><strong>From:</strong> <%= session.getAttribute("ufrom") %></p>
            <p><strong>To:</strong> <%= session.getAttribute("uto") %></p>
            <p><strong>Date of Journey:</strong> <%= session.getAttribute("udate") %></p>
            
        </div>
    </body>
</html>
