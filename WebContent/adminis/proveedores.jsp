<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%>
<%@ page import="paquete.BaseDatos" %><%@ page import="paquete.Proveedores" %><%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin - Bootstrap Admin Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<%
HttpSession sesion = request.getSession();
if ( sesion.getAttribute("admin") == "inicio sesion" )
{
	%>
<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Administraci�n</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
               
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Admin <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="logout.jsp"><i class="fa fa-fw fa-power-off"></i> Cerrar sesi�n</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li class="active">
                        <a href="proveedores.jsp"><i class="fa fa-fw fa-table"></i> Proveedores</a>
                    </li>
                    <li>
                        <a href="pedidos.jsp"><i class="fa fa-fw fa-table"></i> Pedidos</a>
                    </li>
                    <li >
                        <a href="productos.jsp"><i class="fa fa-fw fa-table"></i> Productos</a>
                    </li>
                    <li >
                        <a href="Categoria.jsp"><i class="fa fa-fw fa-table"></i> Categorias</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Proveedores
                        </h1>
                        <form action="AgregarProveedor.jsp">
                        	<input type="submit" value="Agregar proveedor"/>
                        </form>
                        
                    </div>
                </div>
                <!-- /.row -->

                

                <div class="row">
                    <div class="col-lg-12">
                        
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Nombre</th>
                                        <th>Tel�fono</th>
                                        
                                        <th>Editar</th>
                                        <th>Eliminar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                BaseDatos datos = new BaseDatos();
            					ArrayList<Proveedores> lista = new ArrayList<Proveedores>();
            					lista.addAll(datos.proveedores());
            					for( int x=0;x<lista.size();x++ ) 
            					{
            						%>
            						<tr>
                                        <td><%=lista.get(x).getNombre() %></td>
                                        <td><%=lista.get(x).getTelefono() %></td>
                                        <td><form action="EditarProveedor.jsp"><input type="hidden" id="ids" name="ids" value="<%=lista.get(x).getNombre() %>"/><input type="submit" value="Editar"/></form></td>
                                        <td><form action="EliminarProveedor.jsp"><input type="hidden" id="ids" name="ids" value="<%=lista.get(x).getNombre() %>"/><input type="submit" value="Eliminar"/></form></td>
                                    </tr>
            						<%
            					}
                                %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    
                    
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>
<%
}else if ( sesion.getAttribute("admin") == "no inicio sesion" )
{
	%>
	<body><label>No ha iniciado sesi�n</label></body>
	<%
}
%>
</html>