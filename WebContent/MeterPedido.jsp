<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%>
<%@ page import="paquete.BaseDatos" %><%@ page import="paquete.Pedidos" %><%@ page import="java.util.*" %><%@ page import="paquete.Articulo" %>
<%@ page import="java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String dinero = request.getParameter("money");
String nombre = request.getParameter("name");
String apellidos = request.getParameter("apellidos");
String postal = request.getParameter("postal");
String email = request.getParameter("email");
String provincia = request.getParameter("provincia");
String ciudad = request.getParameter("ciudad");
String direc = request.getParameter("dir");
String price = request.getParameter("price");

if ( dinero != null && price != null )
{
	double d = Double.parseDouble(dinero);
	double p = Double.parseDouble(price);
	if ( d < p )
	{
		response.sendRedirect("pago_cancelado.jsp");
	}
	else
	{
		if (  dinero != null && nombre != null && apellidos != null && postal != null && email != null && provincia != null && ciudad != null && direc != null  )
		{
			System.out.println("holis");
			BaseDatos datos = new BaseDatos();
			ArrayList<Pedidos> lista = new ArrayList<Pedidos>();
			lista.addAll(datos.pedidos());
			int contador = 0;
			for ( int i=0;i<lista.size();i++ )
			{
				int idss = Integer.parseInt(lista.get(i).getId());
				if ( idss >= contador )
				{
					contador = idss;
					contador++;
				}
			}
			
			
			HttpSession sesion = request.getSession();
			Calendar calendario = GregorianCalendar.getInstance();
			Date fecha = calendario.getTime();
			SimpleDateFormat formatoDeFecha = new SimpleDateFormat("dd/MM/yyyy");
			System.out.println(formatoDeFecha.format(fecha));
		    
			if ( sesion.getAttribute("carrito") != "no hay carrito" )
			{
				ArrayList<Articulo> lista2 = new ArrayList<Articulo>();
				lista2.addAll( ( ArrayList ) sesion.getAttribute( "carrito" ) );
				for ( int i = 0; i < lista2.size(); i++ )
				{
					BaseDatos datos2 = new BaseDatos();
					BaseDatos datos3 = new BaseDatos();
					int id = lista2.get(i).getId();
					datos2.meterPedido(contador, id, lista2.get(i).getCantidad(), formatoDeFecha.format(fecha), nombre, apellidos, direc, postal, email, provincia, ciudad, dinero, (String)sesion.getAttribute("nombre")  );
					datos3.productoComprado(id, lista2.get(i).getCantidad());
				}
				response.sendRedirect("Index.jsp");
			}
			
			
		}else
		{
		%>
		<label>Error</label>
		<%	
		}
	}
}



%>
</body>
</html>