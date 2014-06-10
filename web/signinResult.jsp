<%-- 
    Document   : signinResult
    Created on : 06-jun-2014, 23:42:29
    Author     : CaronteTNH
--%>

<%@page import="control.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
       String name=request.getParameter("user");
       String pass=request.getParameter("pass");
       String cpass=request.getParameter("cpass");
       if(cpass.equals(pass)){
        if(login.sign_user(name, pass)){
            %>
            <script>location.replace("index.jsp");</script>
            <%
        }
        else{
            %>
            <script>location.replace("errors/signin.html");</script>
            <%
            }
            }
       else{
           %>
            <script>location.replace("errors/signin.html");</script>
            <%
       }
       %>
            
    </body>
</html>
