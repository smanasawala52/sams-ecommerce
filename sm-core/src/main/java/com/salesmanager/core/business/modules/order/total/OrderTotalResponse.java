package com.salesmanager.core.business.modules.order.total;

public class OrderTotalResponse {
	
	private Double discount = null;
	private String expiration;
	private long productId=0;
	private boolean flagBOGO=false;
	private Integer quantity = new Integer(1);
	private String productSKU = "";

	public Double getDiscount() {
		return discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	public String getExpiration() {
		return expiration;
	}

	public void setExpiration(String expiration) {
		this.expiration = expiration;
	}

	public long getProductId() {
		return productId;
	}

	public void setProductId(long productId) {
		this.productId = productId;
	}

	public boolean isFlagBOGO() {
		return flagBOGO;
	}

	public void setFlagBOGO(boolean flagBOGO) {
		this.flagBOGO = flagBOGO;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public String getProductSKU() {
		return productSKU;
	}

	public void setProductSKU(String productSKU) {
		this.productSKU = productSKU;
	}

}
