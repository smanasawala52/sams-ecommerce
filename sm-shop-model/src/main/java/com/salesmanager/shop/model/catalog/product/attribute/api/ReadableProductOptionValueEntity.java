

package com.salesmanager.shop.model.catalog.product.attribute.api;

import com.salesmanager.shop.model.catalog.product.attribute.ProductOptionValueDescription;

public class ReadableProductOptionValueEntity extends ProductOptionValueEntity {

  /**
   * 
   */
  private String price;
  private static final long serialVersionUID = 1L;
  private ProductOptionValueDescription description;
  private int productCount;
  
  
  public ProductOptionValueDescription getDescription() {
    return description;
  }
  public void setDescription(ProductOptionValueDescription description) {
    this.description = description;
  }
public String getPrice() {
	return price;
}
public void setPrice(String price) {
	this.price = price;
}
public int getProductCount() {
	return productCount;
}
public void setProductCount(int productCount) {
	this.productCount = productCount;
}

}
