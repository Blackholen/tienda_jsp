<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%>
<%@ page import="paquete.BaseDatos" %><%@ page import="paquete.Articulo" %><%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String name = null;
	String cant = null;
	String ids = null;
	String prices = null;
	HttpSession sesion = request.getSession();
	
	//Comprueba si no hay ningún item en el atributo carrito
	if ( sesion.getAttribute("carrito") == "no hay carrito" )
	{
		name = request.getParameter( "name" );
		cant = request.getParameter( "cantidad" );
		ids = request.getParameter( "id" );
		prices = request.getParameter( "price" );
		
		//Comprueba si las variables no son nulas
		if ( cant != null && name != null && ids != null && prices != null )
		{
			int cantidad = Integer.parseInt( cant );
			int id = Integer.parseInt( ids );
			int price = Integer.parseInt( prices );
			
			ArrayList<Articulo> lista = new ArrayList<Articulo>();
			Articulo articulo = new Articulo( name, price, id, cantidad );
			lista.add( articulo );
			sesion.setAttribute( "carrito", lista );
			response.sendRedirect("Index.jsp");
		}else
		{
			//Algun valor es null
		}
	}else
	{
		name = request.getParameter( "name" );
		cant = request.getParameter( "cantidad" );
		ids = request.getParameter( "id" );
		prices = request.getParameter( "price" );
		if ( cant != null && name != null && ids != null && prices != null )
		{
			int cantidad = Integer.parseInt( cant );
			int id = Integer.parseInt( ids );
			int price = Integer.parseInt( prices );
			
			ArrayList<Articulo> lista = new ArrayList<Articulo>();
			Articulo articulo = new Articulo( name, price, id, cantidad );
			lista.addAll(( ArrayList ) sesion.getAttribute( "carrito" ));
			lista.add( articulo );
			sesion.setAttribute( "carrito", lista );
			response.sendRedirect("Index.jsp");
		}else
		{
			//Algun valor es null
		}
		
		
	}
			
	
	
%>
</body>
</html>