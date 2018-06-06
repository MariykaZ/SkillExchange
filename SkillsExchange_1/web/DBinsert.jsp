<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.sql.*"%>
<% Class.forName("org.postgresql.Driver"); %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Info</title>
    </head>
    <body>
        
<% 
           String name = request.getParameter("username");
            session.setAttribute( "username", name );
     %>  
        <%!
        public class UserInfo { 
          
        String URL = "jdbc:postgresql://localhost:5432/midterm";
        String USERNAME = "postgres";
        String PASSWORD = "<password>";
        Connection con = null;
        PreparedStatement selectSkill = null;
        PreparedStatement insertInfo = null;
        ResultSet rs = null;
            
       

        public int insertInfo(String username,String skillsowned, String skillswanted, int zip,String email){
                  int result =0;
            try{   
                    con = DriverManager.getConnection(URL,USERNAME,PASSWORD);  
               
                insertInfo = con.prepareStatement("INSERT INTO flyingcars.fullinfo ( username,skillsowned,skillswanted,zip,email) VALUES (?,?,?,?,?)");

                    insertInfo.setString(1,username);
                    insertInfo.setString(2,skillsowned);
                    insertInfo.setString(3,skillswanted);
                    insertInfo.setInt(4,zip);
                    insertInfo.setString(5,email);
                    result = insertInfo.executeUpdate();
                    
         } catch (SQLException e){
                    e.printStackTrace();
     }
return result;
   }
 }%>
 <%   if(request.getParameter("submitinfo")!= null) {
        UserInfo newUser = new UserInfo();
       
     newUser.insertInfo(session.getAttribute("username1").toString(), request.getParameter("ownedSkill1"), request.getParameter("wantedSkill1"), Integer.parseInt(request.getParameter("zip")), request.getParameter("email"));
     newUser.insertInfo(session.getAttribute("username1").toString(), request.getParameter("ownedSkill2"), request.getParameter("wantedSkill2"), Integer.parseInt(request.getParameter("zip")), request.getParameter("email"));
     newUser.insertInfo(session.getAttribute("username1").toString(), request.getParameter("ownedSkill3"), request.getParameter("wantedSkill3"), Integer.parseInt(request.getParameter("zip")), request.getParameter("email"));
     newUser.insertInfo(session.getAttribute("username1").toString(), request.getParameter("ownedSkill4"), request.getParameter("wantedSkill4"), Integer.parseInt(request.getParameter("zip")), request.getParameter("email"));
     newUser.insertInfo(session.getAttribute("username1").toString(), request.getParameter("ownedSkill5"), request.getParameter("wantedSkill5"), Integer.parseInt(request.getParameter("zip")), request.getParameter("email"));
                    }
                    
%>

 </body>
 </html>