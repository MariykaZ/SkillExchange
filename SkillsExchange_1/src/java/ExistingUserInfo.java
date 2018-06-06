/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mariazots
 */
public class ExistingUserInfo extends HttpServlet {

   
 
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String URL = "jdbc:postgresql://localhost:5432/midterm";
        String USERNAME = "postgres";
        String PASSWORD = "<password>";
        Connection con = null;
        PreparedStatement existingUser = null;
        ResultSet rs = null;
        PrintWriter out = response.getWriter();
        
        
        String name = request.getParameter("username");
        
        
        out.println("name : " + name);
        
        try {
            existingUser = con.prepareStatement("SELECT * FROM flyingcars.fullinfo WHERE username = ?");
            
            
            //processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ExistingUserInfo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       // processRequest(request, response);
    }

    public String getServletInfo() {
        return "Short description";
    }

}
