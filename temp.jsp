<%-- 
    Document   : temp
    Created on : 3 Jun, 2021, 10:50:06 AM
    Author     : Vinay Chopda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello <%= session.getAttribute("u_name123") %></h1>
    </body>
</html>
