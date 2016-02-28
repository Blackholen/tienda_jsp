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
String id = request.getParameter("id");
String name = request.getParameter("name");
String image = request.getParameter("image");
String description1 = request.getParameter("description1");
String description2 = request.getParameter("description2");
String price = request.getParameter("precio");
String category_id = request.getParameter("categoria");
String inventary = request.getParameter("inventary");
System.out.println(id);
System.out.println(name);
System.out.println(image);
System.out.println(description1);
System.out.println(description2);
System.out.println(price);
System.out.println(category_id);
System.out.println(inventary);

if ( id != null && name != null && image != null && description1 != null & description2 != null && price != null && category_id != null && inventary != null )
{
	BaseDatos datos = new BaseDatos();
	datos.editarProducto(id, name, image, description1, description2, inventary, price, category_id);
	response.sendRedirect("productos.jsp");
}else
{
%>
<label>Error</label>
<%	
}
%>
</body>
</html>