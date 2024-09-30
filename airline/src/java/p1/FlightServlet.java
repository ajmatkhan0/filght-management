/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package p1;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 *
 * @author ajmat khan
 * from and to database
 */
@WebServlet(name = "FlightServlet", urlPatterns = {"/FlightServlet"})
public class FlightServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String ufrom = request.getParameter("from");
        String uto = request.getParameter("to");
        String udate = request.getParameter("date");
        String sql = "INSERT INTO pass_detail (ufrom, uto, udate) VALUES (?, ?, ?)";
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/flight1", "root", "root");
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, ufrom);
            ps.setString(2, uto);
            ps.setString(3, udate);
            int rowAffected = ps.executeUpdate();
            
            if (rowAffected > 0) {
                // Store the 'from' and 'to' values in the session
                request.getSession().setAttribute("ufrom", ufrom);
                request.getSession().setAttribute("uto", uto);
                request.getSession().setAttribute("udate", udate);
                response.sendRedirect("ShowFlight.jsp");  // Redirect to JSP page
            } else {
                out.println("<center>Try again</center>");
            }
            ps.close();
            con.close();
        } catch (Exception e) {
            out.println("Database connection error: " + e);
        }
    }
}