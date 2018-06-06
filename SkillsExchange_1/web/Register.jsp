<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.sql.*"%>
<% Class.forName("org.postgresql.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome new user!</title>
    </head>
    <body>
        <h1>Welcome new user!</h1>   
        <form name="myForm1" action="newUserStatus.jsp" method="POST">
            <table border="0">               
                <tbody>
                    <tr>
                        <td>Username : </td>
                        <td><input type="text" name="username1" value="" size="20" /></td>
                        
                    </tr>
                    <tr>
                        <td>Enter new password : </td>
                        <td><input type="password" name="password" value="" size="20" /></td>
                    </tr>               
                </tbody>
            </table>   
            <input type="submit" value="Submit" name="submit" />
        </form>
    </body>
</html>
