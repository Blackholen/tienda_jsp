<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%><%@ page import="java.util.*" %><%@ page import="paquete.Articulo" %><%@ page import="paquete.BaseDatos" %><%@ page import="paquete.Category" %>
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
<%
HttpSession sesion = request.getSession();
if ( sesion.getAttribute("user") == "inicio sesion" )
{
	String precio = request.getParameter("price");
	if ( precio != null )
	{
		double price = Double.parseDouble(precio);
		%>
		<body>
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
		      
		      <ul class="nav navbar-nav navbar-right hidden-sm">
		        <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Usuario <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="Cesta.jsp">Cesta</a> </li>
            <li><a href="Pedidos.jsp">Historial de pedidos</a> </li>
            <li class="divider"></li>
            <li><a href="Logout.jsp">logout</a> </li>
          </ul>
        </li>
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
		        <h1 class="text-center">Pago</h1>
		         
		         <label>Precio a pagar: <%=price %></label><br>
		         <label>Todos los campos son requeridos </label><br>
		         
		         <form action="MeterPedido.jsp">
		         	<input type="hidden" id="price" name="price"   value="<%=price %>"/>
		         	<label>Nombre: </label><input type="text" id="name" name="name" pattern="[a-zA-ZñÑ\s]{2,50}" required="required" value=""/><br>
		            <label>Apellidos: </label><input type="text" id="apellidos" name="apellidos" pattern="[a-zA-ZñÑ\s]{2,50}" required="required" value=""/><br>
		            <label>Dirección: </label><input type="text" id="dir" name="dir" pattern="^.*(?=.*[0-9])(?=.*[a-zA-ZñÑ\s]).*$" required="required" value=""/><br>
		            <label>Cod postal: </label><input type="text" id="postal" name="postal" pattern="^([1-9]{2}|[0-9][1-9]|[1-9][0-9])[0-9]{3}$" min="0" required="required" value=""/><br>
		            <label>Email: </label><input type="email" id="email" name="email"  required="required" value=""/><br>
		            <label>Provincia: </label><input type="text" id="provincia" name="provincia" pattern="[a-zA-ZñÑ\s]{2,50}" required="required" value=""/><br>
		            <label>Ciudad: </label><input type="text" id="ciudad" name="ciudad" pattern="[a-zA-ZñÑ\s]{2,50}" required="required" value=""/><br>
		            <label>Dinero a pagar : </label><input type="number" id="money" name="money" step="any" min="0" max="<%=price %>" required="required"  value="<%=price %>"/><br>
		         	<input type="submit" value="Pagar"/>
		         </form>
		         
		        </div>
		    </div>
		  </div>
		</div>
		<hr>
		  <div class="container well">
		    <div class="row">
		      <div class="col-xs-6 col-sm-6 col-md-6 col-lg-7">
		        <div class="row">
		          <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6">
		            <div>
		              <ul class="list-unstyled">
		                <li> <h4>Categorias</h4> </li>
		                <%
      		BaseDatos datos5 = new BaseDatos();
    		ArrayList<Category> lista5 = new ArrayList<Category>(); 
    		lista5.addAll( datos5.category() );
    		for ( int e=0;e<lista5.size();e++ )
    		{
    			
    			%>
    			<form name="<%=lista5.get(e).getName() %>" id="<%=lista5.get(e).getName() %>" action="Search.jsp">
    				<input type="hidden" id="categoria" name="categoria" value="<%=lista5.get(e).getId() %>"/>
    			</form>
    			<li><a href="javascript:enviar_formulario('<%=lista5.get(e).getName() %>')"><%=lista5.get(e).getName() %> </a> </li>
    			<%
    		}
      %>
		              </ul>
		            </div>
		          </div>
		          <div class="col-sm-4 col-md-4 col-lg-4  col-xs-6">
		            
		          </div>
		          <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6">
		            
		          </div>
		        </div>
		      </div>
		      <div class="col-xs-6 col-sm-6 col-md-6 col-lg-5"> 
		        <address>
		        <strong>Información</strong><br>
		        Código postal 33402<br>
		        Asturias, Avilés, 99110-0219<br>
		        <abbr title="Phone">P:</abbr> (123) 456-7890
		      </address>
		        <address>
		        <strong>Email</strong><br>
		        <a href="mailto:#">dasaru-1995@hotmail.com</a><br>
		        <a>Administracción</a>
		        </address>
		        </div>
		    </div>
		  </div>

		<footer class="text-center">
		  <div class="container">
		    <div class="row">
		      <div class="col-xs-12">
		        <p>Copyright © David Sánchez Ruiz. All rights reserved.</p>
		      </div>
		    </div>
		  </div>
		</footer>
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
		<script src="js/jquery-1.11.2.min.js"></script> 
		<!-- Include all compiled plugins (below), or include individual files as needed --> 
		<script src="js/bootstrap.min.js"></script>
		</body>
		<%
	}else
	{
		%>
		<label>La variable precio es nula</label>
		<%
	}
	
}else
{
	%>
	<label>Necesita iniciar sesion</label>
	<%
}
%>

</html>