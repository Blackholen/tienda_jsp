package paquete;

import java.sql.*;
import java.util.*;
import paquete.Productos;

public class BaseDatos 
{
	//Variables
	Connection conecta = null;
	Statement consulta = null;
	ResultSet conjuntoResultados = null;
	PreparedStatement actualiza = null;
	String usuario = "";
	String pass = "";
	
	//Constructor
	public BaseDatos()
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
	
	
	//Muestra todos los articulos
	public ArrayList portada() throws ClassNotFoundException
	{
		ArrayList<Productos> arraylist = null;
		try
		{
			consulta = conecta.createStatement();
			conjuntoResultados = consulta.executeQuery("select * from product");
			arraylist = new ArrayList<Productos>();
			
			while ( conjuntoResultados.next() )
			{
				String name  = conjuntoResultados.getString("name");
				String price  = conjuntoResultados.getString("price");
				String inventary  = conjuntoResultados.getString("inventary");
				String id  = conjuntoResultados.getString("id");
				String image = conjuntoResultados.getString("image");
				String description1  = conjuntoResultados.getString("description1");
				String description2  = conjuntoResultados.getString("description2");
				String category_id  = conjuntoResultados.getString("category_id");
				Productos p = new Productos(name, price, inventary, id, image, description1, description2, category_id);
				arraylist.add(p);
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
				consulta.close();
				conecta.close();
			}
			catch ( Exception excepcion )
			{
				excepcion.printStackTrace();
			}
		}//fin finally
		return arraylist;
		
	}//fin portada
	
	
	public ArrayList search(String name) throws ClassNotFoundException
	{
		ArrayList<String> arraylist = null;
		try
		{
			consulta = conecta.createStatement();
			conjuntoResultados = consulta.executeQuery("select image, price from product where name="+name+"");
			
			while ( conjuntoResultados.next() )
			{
				int price = conjuntoResultados.getInt("price");
				String image = conjuntoResultados.getString("image");
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
				consulta.close();
				conecta.close();
			}
			catch ( Exception excepcion )
			{
				excepcion.printStackTrace();
			}
		}//fin finally
		return arraylist;
		
	}//fin search
	
	//Muestra un producto cuyo id sea el mismo que le pasamos
	public ArrayList producto(String ids) throws ClassNotFoundException
	{
		ArrayList<Productos> arraylist = null;
		try
		{
			String sql = "select * from product where id=?";
			actualiza = conecta.prepareStatement(sql);
			actualiza.setString(1, ids);
			conjuntoResultados = actualiza.executeQuery();
			arraylist = new ArrayList<Productos>();
			
			while ( conjuntoResultados.next() )
			{
				String name  = conjuntoResultados.getString("name");
				String price  = conjuntoResultados.getString("price");
				String inventary  = conjuntoResultados.getString("inventary");
				String id  = conjuntoResultados.getString("id");
				String image = conjuntoResultados.getString("image");
				String description1  = conjuntoResultados.getString("description1");
				String description2  = conjuntoResultados.getString("description2");
				String category_id  = conjuntoResultados.getString("category_id");
				Productos p = new Productos(name, price, inventary, id, image, description1, description2, category_id);
				arraylist.add(p);
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
				conecta.close();
			}
			catch ( Exception excepcion )
			{
				excepcion.printStackTrace();
			}
		}//fin finally
		return arraylist;
		
	}//fin producto
	
	
	
	

	
}//fin BaseDatos
