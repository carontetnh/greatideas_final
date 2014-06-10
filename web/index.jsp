<%-- 
    Document   : index
    Created on : 31-may-2014, 12:58:02
    Author     : CaronteTNH
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="control.login"%>
<%@page import="control.idea"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="img/icon/icon.ico">

    <title>Great Ideas</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Custom styles for this template -->
    <link href="css/carousel.css" rel="stylesheet">
	<style>
	body {
  min-height: 2000px;
  padding-top: 70px;
}
	</style>
 <script type="text/javascript">
            function loadPage(){
             if(localStorage.getItem("user")===null){       
            }
            else{
                location.replace("great.jsp");
            }
        }
        </script>
  </head>
<!-- NAVBAR
================================================== -->
  <body onload="loadPage()">
 <div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
          <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.jsp"><img class="img-circle" src="img/gi_logo/nav-bar/logo.png">Great Ideas</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="index.jsp">Great</a></li>
            <li><a href="new.jsp">New</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="login.html" >Log In</a></li>
            <li><a href="About.html">About</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>

  

	<div class="container">
    <div class="container marketing">
		
      <!-- Three columns of text below the carousel -->
       <div class="row">
         <%
              ArrayList<idea> ideas=login.getGreatIdeas();
              int cont=0;
              for(int i=0;i<ideas.size();i++){
                  if(cont<=2){
        out.print("<div class=\"col-lg-4\">");
          //out.print("<img class=\"img-circle\" src=\""+ideas.get(i).getImage()+"\" alt=\"Generic placeholder image\">");
         out.print("<img class=\"img-circle\" src=\"data:image/jpeg;base64,"+ideas.get(i).getImage()+"\" style=\"max-width:168px\">");
        //out.print("<img id=\"ItemPreview\" src=\"\" />");
          out.print("<h2>"+ideas.get(i).getTitulo()+"</h2>");
          out.print("<p>"+ideas.get(i).getInfo()+"</p>");
          out.print("<form action=\"idea.jsp\" method=\"post\">");
          out.print("<input name=\"idea_id\" value=\""+ideas.get(i).getId()+"\" style=\"display:none\"/>");
          out.print("<p><button class=\"btn btn-default\" type=\"submit\" role=\"button\">View details &raquo;</a></p>");
          out.print("</form>");
        out.print("</div><!-- /.col-lg-4 -->");
        cont++;
                  }
                  else{break;}
              }
         %>
      </div><!-- /.row --><!-- /.row -->


      <!-- START THE FEATURETTES -->

      <hr class="featurette-divider">
      <!-- /END THE FEATURETTES -->


      <!-- FOOTER -->
      <footer>
        <p class="pull-right"><a href="#">Back to top</a></p>
        <p>&copy; 2014 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
      </footer>

    </div><!-- /.container -->
	</div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/docs.min.js"></script>
  </body>
</html>
