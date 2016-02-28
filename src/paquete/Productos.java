package paquete;

public class Productos 
{
	private String name = null;
	private String price = null;
	private String inventary = null;
	private String id = null;
	private String image = null;
	private String description1 = null;
	private String description2 = null;
	private String category_id = null;
	
	public Productos(String name, String price, String inventary, String id, String image, String description1, String description2, String category_id)
	{
		this.setName(name);
		this.setPrice(price);
		this.setInventary(inventary);
		this.setId(id);
		this.setImage(image);
		this.setDescription1(description1);
		this.setDescription2(description2);
		this.setCategory_id(category_id);
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getInventary() {
		return inventary;
	}

	public void setInventary(String inventary) {
		this.inventary = inventary;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getDescription1() {
		return description1;
	}

	public void setDescription1(String description1) {
		this.description1 = description1;
	}

	public String getDescription2() {
		return description2;
	}

	public void setDescription2(String description2) {
		this.description2 = description2;
	}

	public String getCategory_id() {
		return category_id;
	}

	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}
	
}
