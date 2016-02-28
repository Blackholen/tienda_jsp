package paquete;
import java.sql.*;

public class Admin 
{
	Connection conecta = null;
	Statement consulta = null;
	ResultSet conjuntoResultados = null;
	PreparedStatement actualiza = null;
	String usuario = "";
	String pass = "";
	
	public Admin()
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
			
			public boolean usuario(String usuario, String contrasena)
			{
				boolean correcto = false;
				String user = null;
				String password = null;
				try
				{
					String sql = "select usuario,password from administracion where usuario=? and password=?";
					actualiza = conecta.prepareStatement(sql);
					actualiza.setString(1, usuario);
					actualiza.setString(2, contrasena);
					conjuntoResultados = actualiza.executeQuery();
					
					while ( conjuntoResultados.next() )
					{
						user = conjuntoResultados.getString("usuario");
						password = conjuntoResultados.getString("password");
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
}
