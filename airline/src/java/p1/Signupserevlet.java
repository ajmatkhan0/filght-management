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
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author vishw
 * signup database
 */
@WebServlet(name = "Signupserevlet", urlPatterns = {"/Signupserevlet"})
public class Signupserevlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String uname = request.getParameter("username");
        String upass = request.getParameter("password");
        String fname = request.getParameter("firstname");
        String lname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String contact = request.getParameter("phone");
        String gender = request.getParameter("gender");

        String sql = "insert into signup (firstname,lastname,username,pass,email,contact,gender)values(?,?,?,?,?,?,?)";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/flight1", "root", "root");
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, fname);
            ps.setString(2, lname);
            ps.setString(3, uname);
            ps.setString(4, upass);
            ps.setString(5, email);
            ps.setString(6, contact);
            ps.setString(7, gender);
            int rowaffected=ps.executeUpdate();
            if(rowaffected>0){
            response.sendRedirect("index.html");
            }
            else{
            out.println("<center>try again</center>");}
            ps.close();
            con.close();
        } catch (Exception e) {
            
            out.println("database connection errot"+e);
        }

    }

}
