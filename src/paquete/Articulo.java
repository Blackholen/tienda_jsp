package paquete;

public class Articulo 
{
	private String name = null;
	private int price;
	private int id;
	private int cantidad;
	
	//Constructor
	public Articulo (String name, int price, int id, int cantidad)
	{
		this.setName(name);
		this.setPrice(price);
		this.setId(id);
		this.setCantidad(cantidad);
	}

	public int getCantidad() 
	{
		return cantidad;
	}

	public void setCantidad(int cantidad) 
	{
		this.cantidad = cantidad;
	}

	public int getId() 
	{
		return id;
	}

	public void setId(int id) 
	{
		this.id = id;
	}

	public int getPrice() 
	{
		return price;
	}

	public void setPrice(int price) 
	{
		this.price = price;
	}

	public String getName() 
	{
		return name;
	}

	public void setName(String name) 
	{
		this.name = name;
	}
	
	
}
