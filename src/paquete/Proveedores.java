package paquete;

public class Proveedores 
{
	private String nombre = null;
	private String telefono = null;
	
	public Proveedores( String nombre, String telefono )
	{
		this.setNombre(nombre);
		this.setTelefono(telefono);
	}
	
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
}
