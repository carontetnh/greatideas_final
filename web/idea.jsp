<%-- 
    Document   : idea
    Created on : 08-jun-2014, 19:51:17
    Author     : CaronteTNH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="control.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
	<link rel="shortcut icon" href="img/icon/icon.ico">
    <title>Shop Item Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="css/shop-item.css" rel="stylesheet">
	
        
        <script type="text/javascript">
            function loadPage(){
            if(localStorage.getItem("user")===null){
                location.replace("login.html");  
            }
            else{
                document.getElementById("username").innerHTML = localStorage.getItem("user");
                
            }
        }
        </script>
  </head>
<!-- NAVBAR
================================================== -->
  <body onload="loadPage()">
       <%
       String id=request.getParameter("idea_id");
       idea i=login.getIdea(id);
            %>
 <div class="navbar navbar-default navbar-fixed-top " role="navigation">
       <div class="container">
          <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="great.jsp"><img class="img-circle" src="img/gi_logo/nav-bar/logo.png">Great Ideas</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="great.jsp">Great</a></li>
            <li><a href="new.html">New</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
           <li><a href="#"><div id="username"></div></a></li>
           <li><a href="addIdea.html">Add Idea</a></li>
            <li><a href="About.html">About</a></li>
             <li><a href="logout.html">Log Out</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>

    <div class="container">

        <div class="row">

            <div class="col-md-3">
                <p class="lead">Great Idea</p>

                    <%
                    out.print("<form class=\"form-signin\" action=\"idea.jsp\" method=\"post\">");
          out.print("<input name=\"idea_id\" value=\""+i.getId()+"\" style=\"display:none\"/>");
          out.print("<p><button class=\"btn btn-default\" type=\"submit\" role=\"button\">Idea &raquo;</a></p>");
          out.print("</form>");
          %>
                    <%
                    out.print("<form class=\"form-signin\" action=\"review.jsp\" method=\"post\">");
          out.print("<input name=\"idea_id\" value=\""+i.getId()+"\" style=\"display:none\"/>");
          out.print("<p><button class=\"btn btn-default\" type=\"submit\" role=\"button\">Review &raquo;</a></p>");
          out.print("</form>");
          %>

            </div>

            <div class="col-md-9">

                <div class="thumbnail">
                    <img class="featurette-image img-responsive" src="data:image/jpeg;base64,<%=i.getImage()%>" style="max-height:500px">
                    <div class="caption-full">
                        <!--<h4 class="pull-right">$24.99</h4>-->
                        <h4><a href="#"><%=i.getTitulo()%></a>
                        </h4>
                        <p><%=i.getInfo()%></p>
                    </div>
                        <p>
                            <span class="glyphicon glyphicon-star"></span><%=i.getVotos()%>
                        </p>
                    </div>
                        
                </div>
            </div>

        </div>

    </div>
    <!-- /.container -->

    <div class="container">

        <hr>

        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <!--<p>Copyright &copy; Company 2013 - Template by <a href="http://maxoffsky.com/">Maks</a>-->
                    </p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- JavaScript -->
    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/bootstrap.js"></script>
<script>
function over(e)
{
e.className = "glyphicon glyphicon-star";
}
function out(e)
{
e.className = "glyphicon glyphicon-star-empty";
}
</script>
</body>

</html>

