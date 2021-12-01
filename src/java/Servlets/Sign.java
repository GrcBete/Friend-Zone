/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author GSSB
 */
public class Sign extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String firstname = request.getParameter("first_name");
        String surname = request.getParameter("surname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String date = request.getParameter("date_of_birth");
        String fullname = firstname+" "+surname;
        String database = "jdbc:mysql://localhost:3306/Social?allowPublicKeyRetrieval=true&useSSL=false";
        String user = "root";
        String pass = "Silvabeth12";
        
            try {
                boolean very = Ver(email);
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(database, user, pass);
                if (very==false){
            PreparedStatement pst = con.prepareStatement("insert into Reg_Table (First_Name, Surname, Email, DateOfBirth, Password, Full_Name) values(?,?,?,STR_TO_DATE(?, '%Y-%m-%d'),?,?)");
            pst.setString(1,firstname);
            pst.setString(2,surname);
            pst.setString(3,email);
            pst.setString(4,date);
            pst.setString(5,password);
            pst.setString(6,fullname);
            pst.executeUpdate();
            con.close();
            response.sendRedirect("Login-Page.jsp");
                }
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(Sign.class.getName()).log(Level.SEVERE, null, ex);
                out.println("Nigga");
            }
                
        
    }


    public boolean Ver(String name) throws ClassNotFoundException, SQLException{
        String database = "jdbc:mysql://localhost:3306/Social";
        String user = "root";
        String password = "Silvabeth12";
        
        String mysql = "Select * from Reg_Table where Email = '"+name+"'";
        Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(database, user, password);
            Statement stm = con.createStatement();
            ResultSet result = stm.executeQuery(mysql);
        return result.next();
    }

}
