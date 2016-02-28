package paquete;

import java.sql.*;
import java.util.*;
import paquete.Productos;
import paquete.Pedidos;
import paquete.Proveedores;
import paquete.Category;


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
			conjuntoResultados = consulta.executeQuery("select * from product order by id asc");
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
	
	//Muestra todos los pedidos
		public ArrayList pedidos() throws ClassNotFoundException
		{
			ArrayList<Pedidos> arraylist = null;
			try
			{
				consulta = conecta.createStatement();
				conjuntoResultados = consulta.executeQuery("select * from pedidos order by id_pedido asc");
				arraylist = new ArrayList<Pedidos>();
				
				while ( conjuntoResultados.next() )
				{
					String producto  = conjuntoResultados.getString("id_product");
					String cantidad  = conjuntoResultados.getString("cantidad");
					String id  = conjuntoResultados.getString("id_pedido");
					String fecha = conjuntoResultados.getString("fecha");
					String nombre = conjuntoResultados.getString("nombre");
					String apellidos = conjuntoResultados.getString("apellidos");
					String direc = conjuntoResultados.getString("direc");
					String email = conjuntoResultados.getString("email");
					String provincia = conjuntoResultados.getString("provincia");
					String ciudad = conjuntoResultados.getString("ciudad");
					String postal = conjuntoResultados.getString("postal");
					String usuario = conjuntoResultados.getString("usuario");
					Double precio = conjuntoResultados.getDouble("price");
					Pedidos p = new Pedidos( id, producto, cantidad, fecha, nombre, apellidos, direc, postal, email, provincia, ciudad, precio, usuario );
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
			
		}//fin pedidos
		
		public ArrayList pedido(String usu) throws ClassNotFoundException
		{
			ArrayList<Pedidos> arraylist = null;
			try
			{
				String sql = "select * from pedidos where usuario=? order by id_pedido asc";
				actualiza = conecta.prepareStatement(sql);
				actualiza.setString(1, usu);
				conjuntoResultados = actualiza.executeQuery();
				arraylist = new ArrayList<Pedidos>();
				
				while ( conjuntoResultados.next() )
				{
					String producto  = conjuntoResultados.getString("id_product");
					String cantidad  = conjuntoResultados.getString("cantidad");
					String id  = conjuntoResultados.getString("id_pedido");
					String fecha = conjuntoResultados.getString("fecha");
					String nombre = conjuntoResultados.getString("nombre");
					String apellidos = conjuntoResultados.getString("apellidos");
					String direc = conjuntoResultados.getString("direc");
					String email = conjuntoResultados.getString("email");
					String provincia = conjuntoResultados.getString("provincia");
					String ciudad = conjuntoResultados.getString("ciudad");
					String postal = conjuntoResultados.getString("postal");
					String usuario = conjuntoResultados.getString("usuario");
					Double precio = conjuntoResultados.getDouble("price");
					Pedidos p = new Pedidos( id, producto, cantidad, fecha, nombre, apellidos, direc, postal, email, provincia, ciudad, precio, usuario );
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
			
		}//fin pedidos
		
		
		
		
		//Mete un pedido
				public void meterPedido( int id, int producto, int cantidad, String fecha, String nombre, String apellidos, String direccion, String postal, String email, String provincia, String ciudad, String precio, String usuario ) throws ClassNotFoundException
				{
					int cod = Integer.parseInt(postal);
					double price = Double.parseDouble(precio);
					try
					{
						
						String sql = "insert into pedidos(id_pedido,id_product,cantidad,fecha,nombre,apellidos,direc,postal,email,provincia,ciudad,price,usuario) values (?,?,?,?,?,?,?,?,?,?,?,?,?) ";
						actualiza = conecta.prepareStatement(sql);
						actualiza.setInt(1, id);
						actualiza.setInt(2, producto);
						actualiza.setInt(3, cantidad);
						actualiza.setString(4, fecha);
						actualiza.setString(5, nombre);
						actualiza.setString(6, apellidos);
						actualiza.setString(7, direccion);
						actualiza.setInt(8, cod);
						actualiza.setString(9, email);
						actualiza.setString(10, provincia);
						actualiza.setString(11, ciudad);
						actualiza.setDouble(12, price);
						actualiza.setString(13, usuario);
						actualiza.executeUpdate();
					}//fin try
					catch ( SQLException excepcionSql )
					{
						excepcionSql.printStackTrace();
					}
					finally
					{
						try
						{
							
							actualiza.close();
							conecta.close();
						}
						catch ( Exception excepcion )
						{
							excepcion.printStackTrace();
						}
					}//fin finally
					
					
				}//fin meterPedido
		
		//Muestra todos los proveedores
				public ArrayList proveedores() throws ClassNotFoundException
				{
					ArrayList<Proveedores> arraylist = null;
					try
					{
						consulta = conecta.createStatement();
						conjuntoResultados = consulta.executeQuery("select * from proveedores");
						arraylist = new ArrayList<Proveedores>();
						
						while ( conjuntoResultados.next() )
						{
							String nombre  = conjuntoResultados.getString("nombre");
							String telefono  = conjuntoResultados.getString("telefono");
							Proveedores p = new Proveedores( nombre, telefono );
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
					
				}//fin pedidos
	
	
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
	
	//Muestra un producto cuya categoria sea el mismo que le pasamos
		public ArrayList productos(String cat) throws ClassNotFoundException
		{
			int categoria = Integer.parseInt( cat );
			ArrayList<Productos> arraylist = null;
			try
			{
				String sql = "select * from product where category_id=?";
				actualiza = conecta.prepareStatement(sql);
				actualiza.setInt(1, categoria);
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
	
	//Edita un producto
		public ArrayList editarProducto(String ids, String name, String image, String description1, String description2, String inventary, String price, String category_id) throws ClassNotFoundException
		{
			int id = Integer.parseInt(ids);
			int categoria = Integer.parseInt(category_id);
			int prices = Integer.parseInt(price);
			int inventario = Integer.parseInt(inventary);
			ArrayList<Productos> arraylist = null;
			try
			{
				String sql = "update product set id=?,name=?,image=?,description1=?,description2=?,inventary=?,price=?,category_id=? where id=?";
				actualiza = conecta.prepareStatement(sql);
				actualiza.setInt(1, id);
				actualiza.setString(2, name);
				actualiza.setString(3, image);
				actualiza.setString(4, description1);
				actualiza.setString(5, description2);
				actualiza.setInt(6, inventario);
				actualiza.setInt(7, prices);
				actualiza.setInt(8, categoria);
				actualiza.setInt(9, id);
				actualiza.executeUpdate();
				arraylist = new ArrayList<Productos>();
				
				
			}//fin try
			catch ( SQLException excepcionSql )
			{
				excepcionSql.printStackTrace();
			}
			finally
			{
				try
				{
					actualiza.close();
					conecta.close();
					conecta.close();
				}
				catch ( Exception excepcion )
				{
					excepcion.printStackTrace();
				}
			}//fin finally
			return arraylist;
			
		}//fin producto
		//Edita un producto
				public void productoComprado(int id, int inventary) throws ClassNotFoundException
				{
					
					
					try
					{
						String sql = "update product set inventary=(inventary - ?) where id=?";
						actualiza = conecta.prepareStatement(sql);
						actualiza.setInt(1, inventary);
						actualiza.setInt(2, id);
						actualiza.executeUpdate();	
					}//fin try
					catch ( SQLException excepcionSql )
					{
						excepcionSql.printStackTrace();
					}
					finally
					{
						try
						{
							actualiza.close();
							conecta.close();
							conecta.close();
						}
						catch ( Exception excepcion )
						{
							excepcion.printStackTrace();
						}
					}//fin finally
					
					
				}//fin producto
	
	
		//Muestra todas las categorias
		public ArrayList category() throws ClassNotFoundException
		{
			ArrayList<Category> arraylist = null;
			try
			{
				consulta = conecta.createStatement();
				conjuntoResultados = consulta.executeQuery("select * from category order by id asc");
				arraylist = new ArrayList<Category>();
				
				while ( conjuntoResultados.next() )
				{
					String id  = conjuntoResultados.getString("id");
					String name  = conjuntoResultados.getString("name");
					System.out.println(id);System.out.println(name);
					Category c = new Category( id, name );
					arraylist.add(c);
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
		
		
		
		
		//add a producto
				public ArrayList addProducto(String ids, String name, String image, String description1, String description2, String inventary, String price, String category_id) throws ClassNotFoundException
				{
					int id = Integer.parseInt(ids);
					int categoria = Integer.parseInt(category_id);
					int prices = Integer.parseInt(price);
					int inventario = Integer.parseInt(inventary);
					ArrayList<Productos> arraylist = null;
					try
					{
						String sql = "insert into product(id, name, image, description1, description2, inventary, price, category_id) values(?,?,?,?,?,?,?,?)";
						actualiza = conecta.prepareStatement(sql);
						actualiza.setInt(1, id);
						actualiza.setString(2, name);
						actualiza.setString(3, image);
						actualiza.setString(4, description1);
						actualiza.setString(5, description2);
						actualiza.setInt(6, inventario);
						actualiza.setInt(7, prices);
						actualiza.setInt(8, categoria);
						actualiza.executeUpdate();
						arraylist = new ArrayList<Productos>();
						
						
					}//fin try
					catch ( SQLException excepcionSql )
					{
						excepcionSql.printStackTrace();
					}
					finally
					{
						try
						{
							actualiza.close();
							conecta.close();
							conecta.close();
						}
						catch ( Exception excepcion )
						{
							excepcion.printStackTrace();
						}
					}//fin finally
					return arraylist;
					
				}//fin producto
				
				
				public ArrayList addCategory(String ids, String name) throws ClassNotFoundException
				{
					int id = Integer.parseInt(ids);
					
					ArrayList<Productos> arraylist = null;
					try
					{
						String sql = "insert into category(id, name) values(?,?)";
						actualiza = conecta.prepareStatement(sql);
						actualiza.setInt(1, id);
						actualiza.setString(2, name);
						actualiza.executeUpdate();
						arraylist = new ArrayList<Productos>();
						
						
					}//fin try
					catch ( SQLException excepcionSql )
					{
						excepcionSql.printStackTrace();
					}
					finally
					{
						try
						{
							actualiza.close();
							conecta.close();
							conecta.close();
						}
						catch ( Exception excepcion )
						{
							excepcion.printStackTrace();
						}
					}//fin finally
					return arraylist;
					
				}//fin producto

	
				//Elimina un producto
				public void eliminarProducto(String ids) throws ClassNotFoundException
				{
					int id = Integer.parseInt(ids);
					try
					{
						String sql = "delete from product where id=?";
						actualiza = conecta.prepareStatement(sql);
						actualiza.setInt(1, id);
						actualiza.executeQuery();
						
						
						
					}//fin try
					catch ( SQLException excepcionSql )
					{
						excepcionSql.printStackTrace();
					}
					finally
					{
						try
						{
							
							actualiza.close();
							conecta.close();
						}
						catch ( Exception excepcion )
						{
							excepcion.printStackTrace();
						}
					}//fin finally
					
					
				}//fin producto
				
				//Elimina un proveedor
				public void eliminarProveedor(String nombre) throws ClassNotFoundException
				{
					
					try
					{
						String sql = "delete from proveedores where nombre=?";
						actualiza = conecta.prepareStatement(sql);
						actualiza.setString(1, nombre);
						actualiza.executeQuery();
						
						
						
					}//fin try
					catch ( SQLException excepcionSql )
					{
						excepcionSql.printStackTrace();
					}
					finally
					{
						try
						{
							
							actualiza.close();
							conecta.close();
						}
						catch ( Exception excepcion )
						{
							excepcion.printStackTrace();
						}
					}//fin finally
					
					
				}//fin producto
				
				//Elimina una categoria
				public boolean eliminarCategory(String ids) throws ClassNotFoundException
				{
					boolean puede = true;
					int id = Integer.parseInt(ids);
					try
					{
						String sql = "delete from category where id=?";
						actualiza = conecta.prepareStatement(sql);
						actualiza.setInt(1, id);
						actualiza.executeQuery();
						
						
						
					}//fin try
					catch ( SQLException excepcionSql )
					{
						excepcionSql.printStackTrace();
						puede = false;
					}
					finally
					{
						try
						{
							
							actualiza.close();
							conecta.close();
						}
						catch ( Exception excepcion )
						{
							excepcion.printStackTrace();
						}
					}//fin finally
					
					return puede;
				}//fin producto
				
				
				//muestra un proveedor
				public ArrayList proveedor(String name) throws ClassNotFoundException
				{
					
					ArrayList<Proveedores> arraylist = null;
					try
					{
						String sql = "select * from proveedores where nombre=?";
						actualiza = conecta.prepareStatement(sql);
						actualiza.setString(1, name);
						conjuntoResultados = actualiza.executeQuery();
						arraylist = new ArrayList<Proveedores>();
						while ( conjuntoResultados.next() )
						{
							String nombre  = conjuntoResultados.getString("nombre");
							String telefono = conjuntoResultados.getString("telefono");
							Proveedores c = new Proveedores( nombre, telefono );
							arraylist.add(c);
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
							actualiza.close();
							conecta.close();
							conecta.close();
						}
						catch ( Exception excepcion )
						{
							excepcion.printStackTrace();
						}
					}//fin finally
					return arraylist;
					
				}//fin producto
				
				//Edita un producto
				public ArrayList editarProveedor(String name, String telefonos, String name2) throws ClassNotFoundException
				{
					int telefono = Integer.parseInt(telefonos);
					
					ArrayList<Proveedores> arraylist = null;
					try
					{
						String sql = "update proveedores set nombre=?,telefono=? where nombre=?";
						System.out.println(telefono);
						actualiza = conecta.prepareStatement(sql);
						actualiza.setString(1, name);
						actualiza.setInt(2, telefono);
						actualiza.setString(3, name2);
						actualiza.executeUpdate();
						arraylist = new ArrayList<Proveedores>();
						
						
					}//fin try
					catch ( SQLException excepcionSql )
					{
						excepcionSql.printStackTrace();
					}
					finally
					{
						try
						{
							actualiza.close();
							conecta.close();
							conecta.close();
						}
						catch ( Exception excepcion )
						{
							excepcion.printStackTrace();
						}
					}//fin finally
					return arraylist;
					
				}//fin producto
				
				public ArrayList editarCategoria(String ids, String nombre) throws ClassNotFoundException
				{
					int id = Integer.parseInt(ids);
					
					ArrayList<Category> arraylist = null;
					try
					{
						String sql = "update category set name=? where id=?";
						actualiza = conecta.prepareStatement(sql);
						actualiza.setString(1, nombre);
						actualiza.setInt(2, id);
						actualiza.executeUpdate();
						arraylist = new ArrayList<Category>();
						
						
					}//fin try
					catch ( SQLException excepcionSql )
					{
						excepcionSql.printStackTrace();
					}
					finally
					{
						try
						{
							actualiza.close();
							conecta.close();
							conecta.close();
						}
						catch ( Exception excepcion )
						{
							excepcion.printStackTrace();
						}
					}//fin finally
					return arraylist;
					
				}//fin producto
				
				public ArrayList mostrarCategoria(String ids) throws ClassNotFoundException
				{
					int id = Integer.parseInt(ids);
					
					ArrayList<Category> arraylist = null;
					try
					{
						String sql = "select * from category where id=?";
						actualiza = conecta.prepareStatement(sql);
						actualiza.setInt(1, id);
						conjuntoResultados = actualiza.executeQuery();
						arraylist = new ArrayList<Category>();
						
						while ( conjuntoResultados.next() )
						{
							String idd  = conjuntoResultados.getString("id");
							String name  = conjuntoResultados.getString("name");
							System.out.println(id);System.out.println(name);
							Category c = new Category( idd, name );
							arraylist.add(c);
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
							actualiza.close();
							conecta.close();
							conecta.close();
						}
						catch ( Exception excepcion )
						{
							excepcion.printStackTrace();
						}
					}//fin finally
					return arraylist;
					
				}//fin producto
				
				//add a proveedro
				public ArrayList addProveedor(String name, String telefonos) throws ClassNotFoundException
				{
					int telefono = Integer.parseInt(telefonos);
					
					ArrayList<Productos> arraylist = null;
					try
					{
						String sql = "insert into proveedores(nombre, telefono) values(?,?)";
						actualiza = conecta.prepareStatement(sql);
						actualiza.setString(1, name);
						actualiza.setInt(2, telefono);
						actualiza.executeUpdate();
						arraylist = new ArrayList<Productos>();
						
						
					}//fin try
					catch ( SQLException excepcionSql )
					{
						excepcionSql.printStackTrace();
					}
					finally
					{
						try
						{
							actualiza.close();
							conecta.close();
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
