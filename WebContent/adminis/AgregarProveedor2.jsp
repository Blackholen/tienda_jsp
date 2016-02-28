<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%>
<%@ page import="paquete.BaseDatos" %><%@ page import="paquete.Proveedores" %><%@ page import="java.util.*" %><%@ page import="paquete.Category" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String name = request.getParameter("name");
String telefono = request.getParameter("telefono");


if (  name != null && telefono != null  )
{
	
	BaseDatos datos = new BaseDatos();
	ArrayList<Proveedores> lista = new ArrayList<Proveedores>();
	lista.addAll(datos.proveedores());
	boolean igual = false;
	for ( int i=0;i<lista.size();i++ )
	{
		String nombre = lista.get(i).getNombre();
		
		if (  name.equals(nombre) )
		{
			igual = true;
		}
	}
	
	if ( igual )
	{
		%>
		<label>El proveedor ya existe</label>
		<%
	}else
	{
		BaseDatos datos2 = new BaseDatos();
		datos2.addProveedor(name, telefono);
		response.sendRedirect("proveedores.jsp");
	}
	
}else
{
%>
<label>Error</label>
<%	
}
%>
</body>
</html>