/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class PostFPF extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session;
        session=request.getSession();
        String pid=(String)session.getAttribute("PersonId");
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String post = request.getParameter("post");
        
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("uuuu-MM-dd");
        LocalDate localDate = LocalDate.now();
        String mys = dtf.format(localDate);
        
        String database = "jdbc:mysql://localhost:3306/Social?allowPublicKeyRetrieval=true&useSSL=false";
        String user = "root";
        String pass = "Silvabeth12";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection(database, user, pass)) {
                PreparedStatement pst = con.prepareStatement("insert into Post_Table (Post, Date, Person_Id) values(?,?,?)");
                
                pst.setString(1,post);
                pst.setString(2,mys);
                pst.setString(3,pid);
                pst.executeUpdate();
                response.sendRedirect("Profile-Page.jsp");
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Post.class.getName()).log(Level.SEVERE, null, ex);
            out.println("Nigga");
        }
    }

}
