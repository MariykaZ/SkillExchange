<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Please select from the following:</title>
        
    </head>
    <body>
        <%!
            
        public class UserInfo { 
        String URL = "jdbc:postgresql://localhost:5432/midterm";
        String USERNAME = "postgres";
        String PASSWORD = "<password>";
        Connection con = null;
        PreparedStatement selectSkill = null;
        PreparedStatement insertInfo = null;
        ResultSet rs = null;
        
                public ResultSet selectSkills(){
                try{
                    con = DriverManager.getConnection(URL,USERNAME,PASSWORD);  
                    selectSkill = con.prepareStatement( "SELECT * FROM flyingcars.skills ");
                    rs =  selectSkill.executeQuery();
             
                }catch(SQLException e){
                    e.printStackTrace();
                }
              return rs;
            }  
        }
        
        %>
    </body>
</html>
