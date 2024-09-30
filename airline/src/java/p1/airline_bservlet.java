/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package p1;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 *
 * @author ajmat khan
 */
@WebServlet(name = "airline_bservlet", urlPatterns = {"/airline_bservlet"})
public class airline_bservlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String pname = request.getParameter("pname");
        String pnum = request.getParameter("pno");
        String age = request.getParameter("age");
        String pclass = request.getParameter("class");
        double price = 0;
        switch (pclass) {

            case "economy":
                price = 700.00;
                break;
            case "business":
                price = 900.00;
                break;
            case "first":
                price = 800.00;
                break;

        }

        String sql = "insert into journey (pname,pnum,age,pclass,price)values(?,?,?,?,?)";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/flight1", "root", "root");
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, pname);
            ps.setString(2, pnum);
            ps.setString(3, age);
            ps.setString(4, pclass);
            ps.setDouble(5, price);

            int rowaffected = ps.executeUpdate();
            if (rowaffected > 0) {
                request.getSession().setAttribute("pname", pname);
                request.getSession().setAttribute("pnum", pnum);
                request.getSession().setAttribute("age", age);
                request.getSession().setAttribute("pclass", pclass);
                request.getSession().setAttribute("price", price);
                response.sendRedirect("print.jsp");
            } else {
                out.println("<center>try again</center>");
            }
            ps.close();
            con.close();
        } catch (Exception e) {

            out.println("database connection errot" + e);
        }

    }

}
