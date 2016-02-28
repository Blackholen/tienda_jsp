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

if ( sesion.getAttribute("carrito") == "no hay carrito" )
{
	//Si no hay ningún artículo en el carrito
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
      <form class="navbar-form navbar-right" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
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
        <h1 class="text-center">Cesta</h1>
         <h3>No hay ningún artículo en la cesta</h3><br>
         
         
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
	//Muestra el carrito
	ArrayList<Articulo> lista = new ArrayList<Articulo>();
	lista.addAll(( ArrayList ) sesion.getAttribute( "carrito" ));
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
      <form class="navbar-form navbar-right" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
      <ul class="nav navbar-nav navbar-right hidden-sm">
        <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><%=sesion.getAttribute("nombre") %> <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">Cesta</a> </li>
            <li><a href="#">Historial de pedidos</a> </li>
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
        <h1 class="text-center">Cesta</h1>
         <table class="table table-hover">
         	<tr>
            	<th>Producto </th>
                <th>Cantidad </th>
                <th>Precio(unitario) </th>
                <th>Eliminar </th>
            </tr>
            <%
            double precio = 0;
            	for ( int i = 0; i < lista.size(); i++ )
            	{
            		precio = precio + ( lista.get(i).getPrice() * lista.get(i).getCantidad() );
            		%>
            		<tr>
            		<th><%=lista.get(i).getName() %></th>
            		<th><%=lista.get(i).getCantidad() %></th>
            		<th><%=lista.get(i).getPrice() %></th>
            		<th>
            			<form action="DeleteProduct.jsp">
            				<input type="hidden" id="elemento" name="elemento" value="<%=i %>"/>
            				<input type="submit" value="Eliminar">
            			</form>
            		</th>
            		</tr>
            		<%
            	}
            	
            	precio = precio + ( precio * 0.21 );
            %>
         </table><br>
         <label>Iva: 21%</label><br>
         <label>Precio con iva: <%=precio %> </label><br>
         <form action="DatosPago.jsp">
         	<input type="hidden" id="price" name="price" value="<%=precio %>"/>
         	<input type="submit" value="Proceder al pago"/>
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
    		lista4.addAll( datos5.category() );
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
}
%>
</html>