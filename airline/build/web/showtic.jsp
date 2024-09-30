<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Bookings</title>
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            .ticket-container {
                width: 80%;
                margin: 20px auto;
                border: 1px solid #ddd;
                padding: 20px;
                background-color: #f9f9f9;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            }
            h1 {
                text-align: center;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            table, th, td {
                border: 1px solid #ddd;
            }
            th, td {
                padding: 10px;
                text-align: center;
            }
            th {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>
        <div class="ticket-container">
            <h1>Your Flight Bookings</h1>
            <table>
                <thead>
                    <tr>
                        <th>Passenger Name</th>
                        <th>Passenger Number</th>
                        <th>Age</th>
                        <th>Class</th>
                        <th>From</th>
                        <th>To</th>
                        <th>Date</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Get the user details from the session
                        String pname = (String) session.getAttribute("pname");
                        String pnum = (String) session.getAttribute("pnum");
                        String age = (String) session.getAttribute("age");
                        String pclass = (String) session.getAttribute("pclass");
                        String ufrom = (String) session.getAttribute("ufrom");
                        String uto = (String) session.getAttribute("uto");
                        String udate = (String) session.getAttribute("udate");
                    
                        // If session attributes are available, display the data
                        if (pname != null && pnum != null && age != null && pclass != null) {
                    %>
                    <tr>
                        <td><%= pname %></td>
                        <td><%= pnum %></td>
                        <td><%= age %></td>
                        <td><%= pclass %></td>
                        <td><%= ufrom %></td>
                        <td><%= uto %></td>
                        <td><%= udate %></td>
                    </tr>
                    <%
                        } else {
                            // If no session attributes found, display a message
                            out.println("<tr><td colspan='7'>No bookings found for this session.</td></tr>");
                        }
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>
