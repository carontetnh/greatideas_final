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
        if(login.login_user(name, pass)){
            %>
            
            <script>
    localStorage.setItem("user", "<%=name%>"); 
    location.replace("great.jsp");</script>
            <%
        }
        else{
            %>
            <script>location.replace("errors/login.html");</script>
            <%
            }
            %>
    </body>
</html>
