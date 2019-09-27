package semi.model.dto;

public class ProductListDTO {
	private String title;
	private String imagepath;
	private int price;
	private int star;

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImagepath() {
		return imagepath;
	}

	public void setImagepath(String imagepath) {
		String[] temp = imagepath.split(",");
		this.imagepath = temp[0];
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

}
