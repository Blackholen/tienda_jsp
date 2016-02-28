<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%>
<%@ page import="paquete.BaseDatos" %><%@ page import="paquete.Productos" %><%@ page import="java.util.*" %><%@ page import="paquete.Category" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String name = request.getParameter("name");
String id = request.getParameter("nombre");


if (  name != null &&  id != null  )
{
	BaseDatos datos = new BaseDatos();
	datos.editarCategoria( id, name );
	response.sendRedirect("Categoria.jsp");
}else
{
%>
<label>Error</label>
<%	
}
%>
</body>
</html>