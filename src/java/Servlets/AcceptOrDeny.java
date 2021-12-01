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
public class AcceptOrDeny extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AcceptOrDeny</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AcceptOrDeny at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session;
        session=request.getSession();
        String pid=(String)session.getAttribute("PersonId");
        String friend_id = (String)session.getAttribute("PersonId_AorD");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String answer = request.getParameter("answer");
        
        String database = "jdbc:mysql://localhost:3306/Social?allowPublicKeyRetrieval=true&useSSL=false";
        String user = "root";
        String pass = "Silvabeth12";
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection(database, user, pass)) {
                if ("Yes".equals(answer)){
                PreparedStatement pst = con.prepareStatement("update Friend_Table set request = ? where Person_Id = ? and Friend_Id = ?");
                
                pst.setString(1,answer);
                pst.setString(2,pid);
                pst.setString(3,friend_id);
                pst.executeUpdate();
                response.sendRedirect("Notification-Page.jsp");
                }
                else {
                PreparedStatement pst = con.prepareStatement("delete from Friend_Table where Person_Id = ? and Friend_Id = ?");
                pst.setString(1,pid);
                pst.setString(2,friend_id);
                pst.executeUpdate();
                response.sendRedirect("Notification-Page.jsp");
                }
            } catch (SQLException ex) {
                Logger.getLogger(AcceptOrDeny.class.getName()).log(Level.SEVERE, null, ex);
                out.println("Nigga");
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AcceptOrDeny.class.getName()).log(Level.SEVERE, null, ex);
            out.println("Nigga");
        }
    }

    
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
