package paquete;

public class Pedidos 
{
	private String id = null;
	private String producto = null;
	private String cantidad = null;
	private String fecha = null;
	private String nombre = null;
	
	private double precio;
	
	

	private String usuario = null;

	

	private String apellidos = null;
	private String direccion = null;
	private String postal = null;
	private String email = null;
	private String provincia = null;
	private String ciudad = null;
	
	

	public Pedidos(String id, String producto, String cantidad, String fecha, String nombre, String apellidos, String direccion, String postal, String email, String provincia, String ciudad, double precio, String usuario)
	{
		this.setId(id);
		this.setProducto(producto);
		this.setCantidad(cantidad);
		this.setFecha(fecha);
		this.setNombre(nombre);
		this.setApellidos(apellidos);
		this.setDireccion(direccion);
		this.setPostal(postal);
		this.setEmail(email);
		this.setProvincia(provincia);
		this.setCiudad(ciudad);
		this.setPrecio(precio);
		this.setUsuario(usuario);
	}
	
	
	
	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	
	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}
	
	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
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
	
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getPostal() {
		return postal;
	}

	public void setPostal(String postal) {
		this.postal = postal;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getProvincia() {
		return provincia;
	}

	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}

	public String getCiudad() {
		return ciudad;
	}

	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}
	
}
