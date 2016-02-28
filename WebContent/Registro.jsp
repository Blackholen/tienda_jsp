<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%><%@ page import="paquete.BaseDatos" %><%@ page import="paquete.Category" %><%@ page import="java.util.*" %>
<%@ page import="paquete.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Tienda online</title>

<!-- Bootstrap -->
<link rel="stylesheet" href="css/bootstrap.css">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script>
    	function enviar_formulario( form )
    	{
			var formulario = document.getElementById( form );
    	  	formulario.submit();
    	} 
    </script>
</head>
<body>
<%

HttpSession sesion = request.getSession();
if(sesion.getAttribute("user") == "no inicio sesion")   //Inicio sesion
{
	%>
	<nav>
  <div class="container"> 
    
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <a class="navbar-brand" href="Index.jsp">Home</a> </div>
    
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse">
      <ul class="nav navbar-nav">
        <%
      		BaseDatos datos4 = new BaseDatos();
    		ArrayList<Category> lista4 = new ArrayList<Category>(); 
    		lista4.addAll( datos4.category() );
    		for ( int e=0;e<lista4.size();e++ )
    		{
    			
    			%>
    			<form name="<%=lista4.get(e).getName() %>" id="<%=lista4.get(e).getName() %>" action="Search.jsp">
    				<input type="hidden" id="categoria" name="categoria" value="<%=lista4.get(e).getId() %>"/>
    			</form>
    			<li><a href="javascript:enviar_formulario('<%=lista4.get(e).getName() %>')"><%=lista4.get(e).getName() %> </a> </li>
    			<%
    		}
      %>
      </ul>
      
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
      <ul class="nav navbar-nav navbar-right hidden-sm">
        <li><a href="Inicio_session.jsp">Login</a> </li>
        <li><a href="Registro.jsp">Register</a> </li>
        
      </ul>
    </div>
    <!-- /.navbar-collapse --> 
  </div>
  <!-- /.container-fluid --> 
</nav>
<div class="container">
  <div class="row">
    <div class="col-lg-12">
      <div class="jumbotron">
        <h1 class="text-center">Registro</h1> 
        <p class="text-center"></p>
        <form action="Session2.jsp">
        	<label>Usuario</label>	
         	<input type="text" id="user" name="user" pattern="[a-zA-ZñÑ\s]{2,50}" required="required" value=""/><br>
            <label>Contraseña</label>	
         	<input type="password" id="password" name="password" required="required" value=""/><br>
        	<p><input type="submit" class="btn btn-primary" value="Registrarse"/> </p>
        </form><br>
         
        </div>
    </div>
  </div>
</div>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="js/jquery-1.11.2.min.js"></script> 
<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="js/bootstrap.min.js"></script>
	<% 
}else
{
	%><label>Ya inicio sesion</label><%
}
%>
</body>
</html>