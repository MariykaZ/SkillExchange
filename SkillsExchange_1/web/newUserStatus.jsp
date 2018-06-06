<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.sql.*"%>
<% Class.forName("org.postgresql.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
    </head>
    <body>
        <h1>New User</h1>
        
        <%!
        public class NewUser{
            
        String URL = "jdbc:postgresql://localhost:5432/midterm";
        String USERNAME = "postgres";
        String PASSWORD = "<password>";
        Connection con = null;
        PreparedStatement insertUser = null;
        ResultSet rs = null;

            public NewUser(){
                try{
                    con = DriverManager.getConnection(URL,USERNAME,PASSWORD);  
                    insertUser = con.prepareStatement( "INSERT INTO flyingcars.user (username, password) VALUES (?, ?)");
                }catch(SQLException e){
                    e.printStackTrace();
                }
            }
               public int setUser(String username, String password){
                    int result = 0;
                    try{ 
                        insertUser.setString(1, username);
                        insertUser.setString(2, password); 
                        result = insertUser.executeUpdate();
                        
                        }catch(SQLException e){
                        e.printStackTrace();
                       }         
                          return result;
                       }
            }             
        %>
        <%
            String username = new String();
            String password = new String();
              if (request.getParameter("submit") != null){
                  if(request.getParameter("username1") != null){
                    username = request.getParameter("username1");
                   session.setAttribute("username1", username);
                   }
                   if(request.getParameter("password") != null){
                   password = request.getParameter("password");
            }
            }     
            NewUser user = new NewUser();
            int result = user.setUser(username,password);
        %>  
        
           
        <%  if(result != 0){ %>      
            <h1>Successfully registered as : <%= session.getAttribute("username1") %><br> </h1>
            <a href="userInfo.jsp"><button>Continue to enter personal data</button></a>
           
            
           
           
        <% } %>
            
        <% if(result == 0) { %>
            <h1> Username already exists. </h1> 
             <a href="Register.jsp"> Go Back </a>
             
              <% }%>
    </body>
</html>
