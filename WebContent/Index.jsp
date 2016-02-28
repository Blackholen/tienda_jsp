<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%>
<%@ page import="paquete.BaseDatos" %><%@ page import="java.util.*" %><%@ page import="paquete.Productos" %><%@ page import="paquete.Category" %>
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
if(	sesion.getAttribute("user") == "no inicio sesion" || sesion.getAttribute("user") == "inicio sesion"	)
{
	
}else
{
	sesion.setAttribute( "user", "no inicio sesion" );
	sesion.setAttribute( "carrito", "no hay carrito" );
	sesion.setAttribute( "admin", "no inicio sesion" );
	sesion.setAttribute( "nombre", "invitado" );
}

//Muestra el código cuando el usuario todavía no ha inicado sesión
if ( sesion.getAttribute("user") == "no inicio sesion" )
{
	BaseDatos datos = new BaseDatos();
	ArrayList<Productos> lista = new ArrayList<Productos>(); 
	lista.addAll( datos.portada() );
%>
<nav>
  <div class="container"> 
    
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <a class="navbar-brand" href="#">Home</a> </div>
    
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
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <div id="carousel1" class="carousel slide">
          <ol class="carousel-indicators">
            <li data-target="#carousel1" data-slide-to="0" class="active"> </li>
            <li data-target="#carousel1" data-slide-to="1" class=""> </li>
            <li data-target="#carousel1" data-slide-to="2" class=""> </li>
          </ol>
          <div class="carousel-inner">
            <div class="item"> <img class="img-responsive" src="img/portada_tienda.jpg" alt="thumb"> 
            </div>
            <div class="item active"> <img class="img-responsive" src="img/encuentra_todo_lo.jpg" alt="thumb">
              
            </div>
            <div class="item"> <img class="img-responsive" src="img/ficus_bonsai_club.jpg" alt="thumb">
            </div>
          </div>
          <a class="left carousel-control" href="#carousel1" data-slide="prev"><span class="icon-prev"></span></a> <a class="right carousel-control" href="#carousel1" data-slide="next"><span class="icon-next"></span></a></div>
      </div>
</div>
    <hr>
  </div>
<div class="container">
  <div class="row">
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
      <div class="row">
        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-2"><img class="img-circle" alt="Free Shipping" src="img/free_shipping.jpg"></div>
        <div class="col-lg-6 col-md-9 col-sm-9 col-xs-9">
          <h4>Free Shipping</h4>
        </div>
      </div>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
      <div class="row">
        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-2"><img class="img-circle" alt="Free Shipping" src="img/free_returns.png"></div>
        <div class="col-lg-6 col-md-9 col-sm-9 col-xs-9">
          <h4>Free Returns</h4>
        </div>
      </div>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
      <div class="row">
        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-2"><img class="img-circle" alt="Free Shipping" src="img/low_price.jpg"></div>
        <div class="col-lg-6 col-md-9 col-sm-9 col-xs-9">
          <h4>Low Prices</h4>
        </div>
      </div>
    </div>
  </div>
</div>
<hr>
<h2 class="text-center">RECOMMENDED PRODUCTS</h2>
<hr>
<div class="container">
  <div class="row text-center">
  <%
  for( int x=0;x<lista.size();x++ ) 
	{
	  System.out.println(lista.get(x).getImage());
	    %>
	    <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6">
	    	<div class="thumbnail"> 
	    		<img src="<%=lista.get(x).getImage() %>" alt="<%=lista.get(x).getName() %>" class="img-responsive"/>
	    		<div class="caption">
          			<h3><%=lista.get(x).getName() %></h3>
          			<p>Lorem ipsum dolor sit amet, consectetur adipisicing.</p>
          			<form action="producto.jsp">
          				<input type="hidden" id="ids" name="ids" value="<%=lista.get(x).getId() %>"/>
          				<p><input type="submit" class="btn btn-primary" role="button" value="More"></p>
          			</form>
        		</div>
      		</div>
      	</div>
	    <% 
	}
  
}else if( sesion.getAttribute("user") == "inicio sesion" )
{
	//Muestra el código cuando el usuario ha iniciado sesión
	BaseDatos datos = new BaseDatos();
	ArrayList<Productos> lista = new ArrayList<Productos>(); 
	lista.addAll(datos.portada());
	
	
%>
<nav>
  <div class="container"> 
    
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <a class="navbar-brand" href="#">Home</a> </div>
    
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
        <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><%=sesion.getAttribute("nombre") %> <span class="caret"></span></a>
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
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <div id="carousel1" class="carousel slide">
          <ol class="carousel-indicators">
            <li data-target="#carousel1" data-slide-to="0" class="active"> </li>
            <li data-target="#carousel1" data-slide-to="1" class=""> </li>
            <li data-target="#carousel1" data-slide-to="2" class=""> </li>
          </ol>
          <div class="carousel-inner">
            <div class="item"> <img class="img-responsive" src="img/portada_tienda.jpg" alt="thumb"> 
            </div>
            <div class="item active"> <img class="img-responsive" src="img/encuentra_todo_lo.jpg" alt="thumb">
              
            </div>
            <div class="item"> <img class="img-responsive" src="img/ficus_bonsai_club.jpg" alt="thumb">
            </div>
          </div>
          <a class="left carousel-control" href="#carousel1" data-slide="prev"><span class="icon-prev"></span></a> <a class="right carousel-control" href="#carousel1" data-slide="next"><span class="icon-next"></span></a></div>
      </div>
</div>
    <hr>
  </div>
<div class="container">
  <div class="row">
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
      <div class="row">
        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-2"><img class="img-circle" alt="Free Shipping" src="img/free_shipping.jpg"></div>
        <div class="col-lg-6 col-md-9 col-sm-9 col-xs-9">
          <h4>Free Shipping</h4>
        </div>
      </div>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
      <div class="row">
        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-2"><img class="img-circle" alt="Free Shipping" src="img/free_returns.png"></div>
        <div class="col-lg-6 col-md-9 col-sm-9 col-xs-9">
          <h4>Free Returns</h4>
        </div>
      </div>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
      <div class="row">
        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-2"><img class="img-circle" alt="Free Shipping" src="img/low_price.jpg"></div>
        <div class="col-lg-6 col-md-9 col-sm-9 col-xs-9">
          <h4>Low Prices</h4>
        </div>
      </div>
    </div>
  </div>
</div>
<hr>
<h2 class="text-center">RECOMMENDED PRODUCTS</h2>
<hr>
<div class="container">
  <div class="row text-center">
  <%
  for(int x=0;x<lista.size();x++) 
	{
	  System.out.println(lista.get(x).getImage());
	    %>
	    <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6">
	    	<div class="thumbnail"> 
	    		<img src="<%=lista.get(x).getImage() %>" alt="<%=lista.get(x).getName() %>" class="img-responsive"/>
	    		<div class="caption">
        			<h3><%=lista.get(x).getName() %></h3>
        			<p>Lorem ipsum dolor sit amet, consectetur adipisicing.</p>
        			<form action="producto.jsp">
        				<input type="hidden" id="ids" name="ids" value="<%=lista.get(x).getId() %>"/>
        				<p><input type="submit" class="btn btn-primary" role="button" value="More"></p>
        			</form>
      		</div>
    		</div>
    	</div>
	    <% 
	}
}
%>
<body>

    
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
        <a href="adminis/Index.jsp">Administracción</a>
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
<script src="js/jquery-1.11.2.min.js"></script> 
<script src="js/bootstrap.min.js"></script>
</body>
</html>