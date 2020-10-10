package com.salesmanager.core.business.modules.order.total;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Input itm to be added to drules engine
 * @author carlsamson
 *
 */
public class OrderTotalInputParameters {
	
	private Double discount;//output value set by engine
	private String totalCode;//output value set by engine
	
	//input parameters
	private long productId;
	private String itemManufacturerCode;
	private String itemCategoryCode;
	private String shippingMethod;
	private String promoCode;
	private Date date = new Date();
	private Integer quantity = new Integer(1);	
	private List<String> itemCategoryCodes = new ArrayList<String>();
	private String productSKU = "";
	
	//might add variation based on other objects such as Customer
	
	public Double getDiscount() {
		return discount;
	}
	public void setDiscount(Double discount) {
		this.discount = discount;
	}
	public String getTotalCode() {
		return totalCode;
	}
	public void setTotalCode(String totalCode) {
		this.totalCode = totalCode;
	}
	public String getItemManufacturerCode() {
		return itemManufacturerCode;
	}
	public void setItemManufacturerCode(String itemManufacturerCode) {
		this.itemManufacturerCode = itemManufacturerCode;
	}
	public String getItemCategoryCode() {
		return itemCategoryCode;
	}
	public void setItemCategoryCode(String itemCategoryCode) {
		this.itemCategoryCode = itemCategoryCode;
	}
	public long getProductId() {
		return productId;
	}
	public void setProductId(long productId) {
		this.productId = productId;
	}
	public String getShippingMethod() {
		return shippingMethod;
	}
	public void setShippingMethod(String shippingMethod) {
		this.shippingMethod = shippingMethod;
	}
	public String getPromoCode() {
		return promoCode;
	}
	public void setPromoCode(String promoCode) {
		this.promoCode = promoCode;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public List<String> getItemCategoryCodes() {
		return itemCategoryCodes;
	}
	public void setItemCategoryCodes(List<String> itemCategoryCodes) {
		this.itemCategoryCodes = itemCategoryCodes;
	}
	
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getQuantity() {
		return quantity;
	}
	public String getProductSKU() {
		return productSKU;
	}
	public void setProductSKU(String productSKU) {
		this.productSKU = productSKU;
	}
}
