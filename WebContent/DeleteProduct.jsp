<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%><%@ page import="paquete.Articulo" %><%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
HttpSession sesion = request.getSession();
int elemento = Integer.parseInt( request.getParameter( "elemento" ) );
ArrayList<Articulo> lista = new ArrayList<Articulo>();
lista.addAll(( ArrayList ) sesion.getAttribute( "carrito" ));
lista.remove(elemento);

if ( lista.size() == 0 )
{
	sesion.setAttribute( "carrito", "no hay carrito" );
}else
{
	sesion.setAttribute( "carrito", lista );
}
response.sendRedirect("Cesta.jsp");

%>
</body>
</html>