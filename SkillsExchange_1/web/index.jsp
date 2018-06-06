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
        <h1>Welcome to Skills Exchange</h1>
        <h2>Sign-in :</h2> 
        <form name="myForm" action="Display.jsp" method="POST">
            <table border="0">               
                <tbody>
                    <tr>
                        <td>Username : </td>
                        <td><input type="text" name="username" value="" size="20" /></td>
                    </tr>
                    <tr>
                        <td>Password : </td>
                        <td><input type="password" name="password" value="" size="20" /></td>
                        
                    </tr>
                </tbody>
            </table>    
            <input type="reset" value="Clear" name="clear" />
            <input type="submit" value="Submit" name="submit" />
        </form>
        
         <form name="myForm" action="Register.jsp" method="POST">   
             <input type="submit" value="Register" name="register" />
        </form>
        
        
        
    </body>
</html>
