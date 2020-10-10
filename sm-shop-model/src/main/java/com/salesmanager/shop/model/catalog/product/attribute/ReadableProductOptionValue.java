package com.salesmanager.shop.model.catalog.product.attribute;

public class ReadableProductOptionValue extends ProductOptionValue {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String price;
	private String image;
	private String name;
	private int productCount;


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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getProductCount() {
		return productCount;
	}

	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}

}
