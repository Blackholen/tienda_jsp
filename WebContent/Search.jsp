<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%>
<%@ page import="paquete.BaseDatos" %><%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String nombre = request.getParameter("nombre");
	
	if (nombre != null)
	{
		BaseDatos busqueda = new BaseDatos();
		ArrayList<String> lista;
		lista = (ArrayList) busqueda.search(nombre);
		
	}
%>
</body>
</html>