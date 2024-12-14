/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author Chithma Dilmin
 */
@WebServlet("/LoginServlet")
public class loginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Replace with actual authentication logic (e.g., check against a database)
        if ("admin".equals(email) && "admin123".equals(password)) {
            // Redirect to the admin home page
            response.sendRedirect("admin_home.jsp");
        } else {
            // Redirect back to login page with an error message
            response.sendRedirect("login.html?error=Invalid credentials");
        }
        
    }
}
