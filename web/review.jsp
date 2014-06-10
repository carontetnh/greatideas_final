<%-- 
    Document   : review
    Created on : 08-jun-2014, 19:52:38
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
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
               <%
       String id=request.getParameter("idea_id");
       idea i=login.getIdea(id);
            %>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Fecha', 'Valoración'],
          ['<%=i.getFecha()%>', <%=i.getVotos()%>]
        ]);

        var options = {
          title: 'Historia',
          hAxis: {title: 'Fecha',  titleTextStyle: {color: '#333'}},
          vAxis: {minValue: 0}
        };

        var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
	<style type="text/css">
	.rating {
          overflow: hidden;
          display: inline-block;
      }
      .rating-input {
          position: absolute;
          left: 0;
          top: -50px;
      }
      .rating-star {        
          display: block;
          float: right;        
          width: 16px;
          height: 16px;
          background: url('http://kubyshkin.ru/samples/star-rating/star.png') 0 -16px;
      }
      .rating-star:hover,
      .rating-star:hover ~ .rating-star {
          background-position: 0 0;
      }
	</style>
       <script type="text/javascript">
            function loadPage(){
            if(localStorage.getItem("user")===null){
                location.replace("errors/login.html");  
            }
            else{
                document.getElementById("username").innerHTML = localStorage.getItem("user");
                document.getElementById("username2").value=localStorage.getItem("user");
            }
        }
        </script>
  </head>
<!-- NAVBAR
================================================== -->
  <body onload="loadPage()">
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
            <li><a href="new.jsp">New</a></li>
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
                <div class="list-group">
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
            </div>

            <div class="col-md-9">
                <p align="center">
			<div id="chart_div" style="width: 900px; height: 500px;"></div>
			Rating:
			<%=i.getVotos()%>
	<br>
   <form class="form-signin" role="form" action="VoteUp" method="post">
            <input name="id_idea" value="<%=i.getId()%>" style="display:none"/>
			<p><button class="btn btn-lg btn-primary btn-block" type="submit">Vote Up!</button></p>
                    </form>
                           <form class="form-signin" role="form" action="VoteDown" method="post">
            <input name="id_idea" value="<%=i.getId()%>" style="display:none"/>
			<p><button class="btn btn-lg btn-danger btn-block" type="submit">Vote Down!</button></p>
                    </form>
                </p>
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

