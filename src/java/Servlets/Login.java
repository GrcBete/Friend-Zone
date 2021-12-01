package Servlets;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author GSSB
 */
public class Login extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String name = request.getParameter("user_name");
        String pass = request.getParameter("password");
        String check = null;
        if ((isValidE(name)) && (isValid(pass))){
        String database = "jdbc:mysql://localhost:3306/Social?allowPublicKeyRetrieval=true&useSSL=false";
        String user = "root";
        String password = "Silvabeth12";
        String mysql = "Select Person_Id from Reg_Table where Email = '"+name+"' and Password = '"+pass+"'";
        try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(database, user, password);
        Statement stm = con.createStatement();
        ResultSet result = stm.executeQuery(mysql);
        
        if (result.next()){
            String pId = result.getString(1);
            HttpSession session=request.getSession(); 
            session.setAttribute("PersonId", pId);
        response.sendRedirect("Home-Page.jsp");
        }
        else{
        check="True";
        HttpSession session=request.getSession();  
        session.setAttribute("error", "Either User Name or Password are incorrect.");
        session.setAttribute("check", check);
        response.sendRedirect("Login-Page.jsp");
        }
        }   catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
                out.println("Nigga");
            }
        }else{
        out.println("Nigga");
        }
    }
    //You can use this later for validation
public boolean isValid(String input){
    return input.matches("[A-Za-z]*");
}
public boolean isValidE(String input){
        Pattern pattern = Pattern.compile("^(.+)@(.+)$");
        Matcher matcher = pattern.matcher(input); 
    return matcher.matches();
}

}
