<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.sql.*"%>
<% Class.forName("org.postgresql.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Skills Exchange</title>
    </head>
    <body>
        <form name="Submit" action="ExistingUserInfo">
        <h1>Welcome to Skills Exchange</h1>
        <%!
        public class User{
            
        String URL = "jdbc:postgresql://localhost:5432/midterm";
        String USERNAME = "postgres";
        String PASSWORD = "<password>";
        Connection con = null;
        PreparedStatement checkUser = null;
        ResultSet rs = null;



            public User(){
                try{
                    con = DriverManager.getConnection(URL,USERNAME,PASSWORD);
                    checkUser = con.prepareStatement("SELECT username, password FROM flyingcars.user WHERE username = ? AND password = ?");

                }catch(SQLException e){
                    e.printStackTrace();
                }
            }
           public ResultSet getUser(String username, String password){
            try{
                checkUser.setString(1, username);
                checkUser.setString(2, password);
                rs = checkUser.executeQuery();

                }catch(SQLException e){
                    e.printStackTrace();
                }
                return rs;
          }  
        }
        %>
        <%
            String username = new String(); 
            String password = new String();
            
            if(request.getParameter("username") != null){
                username = request.getParameter("username");    
            }
            if(request.getParameter("password") != null){
                password = request.getParameter("password");    
            }
            
            User user = new User();
            ResultSet users = user.getUser(username, password);
            
        
        %>  
        <% boolean status = true;%>
        <%  if(users.next()){ %>      
            <h1>successfully logged in as : <%= users.getString("username")%></h1>
           
            <% session.setAttribute("username", users.getString("username"));%>
            
            <%= session.getAttribute("username")%>
            <% status = false;%>
            
         
            
        <% } %>
            
        <% if(status) { %>
            <h1>Username or password is not valid </h1> 
            <a href="index.jsp"> Go Back </a> 
              <% } %>
              <input type="submit" value="Submit" name="submit" />
            </form>
    </body>
</html>
