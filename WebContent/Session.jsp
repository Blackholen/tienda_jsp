<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%>
<%@ page import="paquete.User" %>
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
	HttpSession sesion = request.getSession();
	String userName = null;
	String password = null;
	String login = null;
	
	//Si  no existe la sesion
	if ( sesion.getAttribute("user") == "no inicio sesion" )
	{
		userName = request.getParameter("user");
		password = request.getParameter("password");
		//login = request.getParameter("login");&& login.equals( "login" )
		
		//Comprueba si los datos no son nulos y que el boton pulsado es el de iniciar sesion
		if ( userName != null && password != null  )
		{
			User user = new User();
			boolean correcto = user.usuario(userName, password);
			
			//Comprueba el resultado del inicio de sesion
			if ( correcto )
			{
				//Inicio de sesion correcto
				sesion.setAttribute( "user", "inicio sesion" );
				sesion.setAttribute( "nombre", userName );
				response.sendRedirect("Index.jsp");
				
			}else
			{
				//Inicio de sesion incorrecto
				%>
				<label>No existe el usuario</label>
				<%
				
			}
		}
	//fin if	
	}else
	{
		
	}
	
	
%>

</body>
</html>
