<%-- 
    Document   : index
    Created on : 31-may-2014, 12:58:02
    Author     : CaronteTNH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="control.*"%>
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
                location.replace("errors/login.html");  
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
           try{
       String title=request.getParameter("title");
       String desc=request.getParameter("desc");
       String id=request.getParameter("id");
       %>
       <script>localStorage.setItem("id_idea", "<%=login.create_idea(title, desc,id)%>");</script>
       <%
       //if(login.create_idea(title, desc,id)){
            %>
 <div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
          <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.html"><img class="img-circle" src="img/gi_logo/nav-bar/logo.png">Great Ideas</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="index.html">Great</a></li>
            <li><a href="big.html">Big</a></li>
            <li><a href="new.html">New</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><div id="username"></div></a></li>
            <li class="active"><a href="addIdea.html">Add Idea</a></li>
            <li><a href="./">About</a></li>
             <li><a href="logout.html">Log Out</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>

  

	<div class="container">
    <div class="container marketing">

      <div class="row featurette">
        <div class="col-md-5">
          <img class="featurette-image img-responsive" data-src="holder.js/500x500/auto" alt="Generic placeholder image">
        </div>
		
		<div class="col-md-7">
          <h2 class="featette-heading"> Almost done!<span class="text-muted">(One more step)</span></h2>
          <p class="lead">Upload an image or photo of your idea to show how it is physically or how it is in your mind.</p>
			         <form action="UploadFile" method="post" enctype="multipart/form-data">
            Select File: <input type="file" name="filetoupload"><br>
            <input type="submit" value="Upload File">
            
        </form>
		</div>
        
      </div>

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
    <%}
           catch(Exception e){
            %>
            <script>location.replace("errors/createIdea.html");</script>
            <%
        }
       %> 
  </body>
</html>
