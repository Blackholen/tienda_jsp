<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	HttpSession sesion = request.getSession();

	if ( sesion.getAttribute("admin") == "inicio sesion" )
	{
		sesion.setAttribute( "admin", "no inicio sesion" );
		response.sendRedirect("../Index.jsp");
	}else if ( sesion.getAttribute("admin") == "no inicio sesion" )
	{
		%>
		<label>Tiene que iniciar sesión para poder acceder</label>
		<%
	}
	
%>
</body>
</html>