<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%>
<%@ page import="paquete.BaseDatos" %><%@ page import="paquete.Articulo" %><%@ page import="java.util.*" %><%@ page import="paquete.Productos" %>
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
</head>
<body>
<%
String id = request.getParameter("ids");
System.out.println(id);
HttpSession sesion = request.getSession();

//Comprueba si inicio la sesion
if ( sesion.getAttribute("user") == "inicio sesion" )
{
	//inicio sesion
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
        <li class="active"><a href="#">Bonsais <span class="sr-only">(current)</span></a> </li>
        <li><a href="#">Sustratos</a> </li>
        
      </ul>
      <form class="navbar-form navbar-right" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
      <ul class="nav navbar-nav navbar-right hidden-sm">
        <li><a href="#">Login</a> </li>
        <li><a href="#">Register</a> </li>
        <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Usuario <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="Cesta.jsp">Cesta</a> </li>
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
<%
BaseDatos datos = new BaseDatos();
ArrayList<Productos> lista = new ArrayList<Productos>(); 

lista.addAll(datos.producto(id));
%>
<div class="container">
  <div class="row">
    <div class="col-lg-12">
      <div class="jumbotron">
      <%
      for(int x=0;x<lista.size();x++) 
      {
      %>
        <h1 class="text-center"><%=lista.get(x).getName() %></h1>
        <img src="<%=lista.get(x).getImage() %>" alt="" class="img-responsive"> 
        <p class="text-center"><%=lista.get(x).getDescription2() %></p>
        <p class="text-center">Precio: <%=lista.get(x).getPrice() %></p>
        <%
      }
        %>
         <form action="MeteProducto.jsp">	
         	<label>Cantidad</label>
         	<input type="number" id="cantidad" name="cantidad" min="1" max="50"  required="required" value="" >
         	<input type="hidden" id="price" name="price" min="1" max="50"  required="required" value="30" >
         	<input type="hidden" id="name" name="name"   required="required" value="Bonsai1" >
         	<input type="hidden" id="id" name="id"   required="required" value="1" >
        	<p><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span><input type="submit" class="btn btn-primary"  value="Add to Cart" /> </p>
        	
        </form>
        </div>
    </div>
  </div>
</div>

<hr>

<hr>
  <div class="container well">
    <div class="row">
      <div class="col-xs-6 col-sm-6 col-md-6 col-lg-7">
        <div class="row">
          <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6">
            <div>
              <ul class="list-unstyled">
                <li> <h4>Categorias</h4> </li>
                <li> <a>Bonsais</a> </li>
                <li> <a>Sustratos</a> </li>
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
	
	
	<%
}else if ( sesion.getAttribute("user") == "no inicio sesion" )
{
	//No inicio sesion
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
	        <li class="active"><a href="#">Bonsais <span class="sr-only">(current)</span></a> </li>
	        <li><a href="#">Sustratos</a> </li>
	        
	      </ul>
	      <form class="navbar-form navbar-right" role="search">
	        <div class="form-group">
	          <input type="text" class="form-control" placeholder="Search">
	        </div>
	        <button type="submit" class="btn btn-default">Submit</button>
	      </form>
	      <ul class="nav navbar-nav navbar-right hidden-sm">
	        <li><a href="#">Login</a> </li>
	        <li><a href="#">Register</a> </li>
	        
	      </ul>
	    </div>
	    <!-- /.navbar-collapse --> 
	  </div>
	  <!-- /.container-fluid --> 
	</nav>
	<div class="container">
	<%
BaseDatos datos = new BaseDatos();
ArrayList<Productos> lista = new ArrayList<Productos>(); 

lista.addAll(datos.producto(id));
%>
	  <div class="row">
	    <div class="col-lg-12">
	      <div class="jumbotron">
	        <%
      for(int x=0;x<lista.size();x++) 
      {
      %>
        <h1 class="text-center"><%=lista.get(x).getName() %></h1>
        <img src="<%=lista.get(x).getImage() %>" alt="" class="img-responsive"> 
        <p class="text-center"><%=lista.get(x).getDescription2() %></p>
        <p class="text-center">Precio: <%=lista.get(x).getPrice() %></p>
        <%
      }
        %>
	        <p>Es necesario iniciar sesion para comprar</p>
	        </form>
	        </div>
	    </div>
	  </div>
	</div>

	<hr>
	
	<hr>
	  <div class="container well">
	    <div class="row">
	      <div class="col-xs-6 col-sm-6 col-md-6 col-lg-7">
	        <div class="row">
	          <div class="col-sm-4 col-md-4 col-lg-4 col-xs-6">
	            <div>
	              <ul class="list-unstyled">
	                <li> <h4>Categorias</h4> </li>
	                <li> <a>Bonsais</a> </li>
	                <li> <a>Sustratos</a> </li>
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
	  <% 
}
%>


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
</html>