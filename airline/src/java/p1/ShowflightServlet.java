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

/**
 *
 * @author ajmat khan
 */
@WebServlet(name = "ShowflightServlet", urlPatterns = {"/ShowflightServlet"})
public class ShowflightServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        
        String ufrom = (String) session.getAttribute("from");
        String uto = (String) session.getAttribute("to");
        String udate = (String) session.getAttribute("date");
        RequestDispatcher rd = request.getRequestDispatcher("showflight.html");
                        rd.include(request, response);
        
    }


}
