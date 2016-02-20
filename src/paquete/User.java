package paquete;

import java.sql.*;

public class User 
{
	Connection conecta = null;
	Statement consulta = null;
	ResultSet conjuntoResultados = null;
	PreparedStatement actualiza = null;
	String usuario = "";
	String pass = "";
	
	//Constructor
	public User ()
	{
		usuario = "rasty16";
		pass = "rasty16";
		this.conectar();
	}
	
	
	//Conecta a la base de datos y con el jdbc
		public void conectar()
		{
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conecta = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe",usuario,pass);
			}catch ( SQLException excepcionSql )
			{
				excepcionSql.printStackTrace();
			}
			catch ( ClassNotFoundException noEncontroClase )
			{
				noEncontroClase.printStackTrace();
			}
		}//fin conectar
		
		
		//Comprueba si el usuario existe en la base de datos
		public boolean usuario(String usuario, String contrasena)
		{
			boolean correcto = false;
			String user = null;
			String password = null;
			try
			{
				String sql = "select usuario,pass from usuarios where usuario=? and pass=?";
				actualiza = conecta.prepareStatement(sql);
				actualiza.setString(1, usuario);
				actualiza.setString(2, contrasena);
				conjuntoResultados = actualiza.executeQuery();
				
				while ( conjuntoResultados.next() )
				{
					user = conjuntoResultados.getString("usuario");
					password = conjuntoResultados.getString("pass");
					//System.out.println(user);System.out.println(password);
				}
				
				if ( user != null && password != null )
				{
					if ( user.equals(usuario) && password.equals(contrasena) )
					{
						correcto = true;
					}
				}else
				{
					
				}
				
				
			}//fin try
			catch ( SQLException excepcionSql )
			{
				excepcionSql.printStackTrace();
				
			}
			finally
			{
				try
				{
					conjuntoResultados.close();
					actualiza.close();
					//conecta.close();
				}
				catch ( Exception excepcion )
				{
					excepcion.printStackTrace();
				}
			}//fin finally
			return correcto;
		}//fin usuario
		
		
		//Incorpora al usuario a la base de datos
		public void registro(String usuario, String contrasena)
		{
			
			
			try
			{
				String sql = "insert into usuarios(usuario, pass) values(?,?)";
				actualiza = conecta.prepareStatement(sql);
				actualiza.setString(1, usuario);
				actualiza.setString(2, contrasena);
				conjuntoResultados = actualiza.executeQuery();
				
			}//fin try
			catch ( SQLException excepcionSql )
			{
				excepcionSql.printStackTrace();
				
			}
			finally
			{
				try
				{
					conjuntoResultados.close();
					actualiza.close();
					//conecta.close();
				}
				catch ( Exception excepcion )
				{
					excepcion.printStackTrace();
				}
			}//fin finally
			
		}//fin usuario
		
		
		//Comprueba si existe el usuario en la base de datos
		public boolean existe ( String usuario )
		{
			boolean correcto = false;
			String user = null;
			try
			{
				String sql = "select usuario from usuarios where usuario=?";
				actualiza = conecta.prepareStatement(sql);
				actualiza.setString(1, usuario);
				conjuntoResultados = actualiza.executeQuery();
				
				while ( conjuntoResultados.next() )
				{
					user = conjuntoResultados.getString("usuario");
					
				}
				
				if ( user != null  )
				{
					correcto = true;
				}
				
			}//fin try
			catch ( SQLException excepcionSql )
			{
				excepcionSql.printStackTrace();
			}
			finally
			{
				try
				{
					conjuntoResultados.close();
					actualiza.close();
					//conecta.close();
				}
				catch ( Exception excepcion )
				{
					excepcion.printStackTrace();
				}
			}//fin finally
			return correcto;
		}//fin existe
}//fin user
