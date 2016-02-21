package paquete;

public class Pedidos 
{
	private String id = null;
	private String producto = null;
	private String cantidad = null;
	
	public Pedidos(String id, String producto, String cantidad)
	{
		this.setId(id);
		this.setProducto(producto);
		this.setCantidad(cantidad);
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getProducto() {
		return producto;
	}

	public void setProducto(String producto) {
		this.producto = producto;
	}

	public String getCantidad() {
		return cantidad;
	}

	public void setCantidad(String cantidad) {
		this.cantidad = cantidad;
	}
}
