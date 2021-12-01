package Servlets;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import Servlets.Post;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
public class Follow extends HttpServlet {
        
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session;
        session=request.getSession();
        String pid=(String)session.getAttribute("PersonId");
        String person_id = (String)session.getAttribute("PersonId_Search");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String follow = "Maybe";
        
        String database = "jdbc:mysql://localhost:3306/Social?allowPublicKeyRetrieval=true&useSSL=false";
        String user = "root";
        String pass = "Silvabeth12";
        try {
            boolean very = Ver(person_id,pid);
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection(database, user, pass)) {
                if (very == false){
                PreparedStatement pst = con.prepareStatement("insert into Friend_Table (Person_Id, Friend_Id, request) values(?,?,?)");
                
                pst.setString(1,person_id);
                pst.setString(2,pid);
                pst.setString(3,follow);
                pst.executeUpdate();
                response.sendRedirect("Profile-Page-Search.jsp");
                }
                else {
                response.sendRedirect("Profile-Page-Search.jsp");
                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Post.class.getName()).log(Level.SEVERE, null, ex);
            out.println("Nigga");
        }
    }
    
    public boolean Ver(String person_id, String pid) throws ClassNotFoundException, SQLException{
        String database = "jdbc:mysql://localhost:3306/Social";
        String user = "root";
        String password = "Silvabeth12";
        
        String mysql = "Select * from Friend_Table where Person_Id = "+person_id+" and Friend_Id = "+pid+"";
        Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(database, user, password);
            Statement stm = con.createStatement();
            ResultSet result = stm.executeQuery(mysql);
        return result.next();
    }

}
