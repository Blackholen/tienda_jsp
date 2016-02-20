package paquete;

import java.sql.*;
import java.util.*;

public class BaseDatos 
{
	//Variables
	Connection conecta = null;
	Statement consulta = null;
	ResultSet conjuntoResultados = null;
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
		ArrayList<String> arraylist = null;
		try
		{
			consulta = conecta.createStatement();
			conjuntoResultados = consulta.executeQuery("select name, image, des2 from product");
			arraylist = new ArrayList<String>();
			while ( conjuntoResultados.next() )
			{
				String name  = conjuntoResultados.getString("name");
				String image = conjuntoResultados.getString("image");
				String des2 = conjuntoResultados.getString("des2");
				arraylist.add(name);
				arraylist.add(image);
				arraylist.add(des2);
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
	
	
	public ArrayList producto(int id) throws ClassNotFoundException
	{
		ArrayList<String> arraylist = null;
		try
		{
			consulta = conecta.createStatement();
			conjuntoResultados = consulta.executeQuery("select name, des1, des2, price, image, stock from product where id_product="+id+"");
			arraylist = new ArrayList<String>();
			while ( conjuntoResultados.next() )
			{
				String name  = conjuntoResultados.getString("name");
				String des1 = conjuntoResultados.getString("des1");
				String des2 = conjuntoResultados.getString("des2");
				String price = conjuntoResultados.getString("price");
				String image = conjuntoResultados.getString("image");
				String stock = conjuntoResultados.getString("stock");
				
				arraylist.add(name);
				arraylist.add(des1);
				arraylist.add(des2);
				arraylist.add(price);
				arraylist.add(image);
				arraylist.add(stock);
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
		
	}//fin producto
	
	
	
	

	
}//fin BaseDatos
