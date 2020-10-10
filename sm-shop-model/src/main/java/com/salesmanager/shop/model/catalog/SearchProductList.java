package com.salesmanager.shop.model.catalog;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.salesmanager.shop.model.catalog.category.ReadableCategory;
import com.salesmanager.shop.model.catalog.manufacturer.ReadableManufacturer;
import com.salesmanager.shop.model.catalog.product.attribute.ReadableProductOption;
import com.salesmanager.shop.model.catalog.product.attribute.ReadableProductOptionValue;
import com.salesmanager.shop.model.catalog.product.attribute.api.ReadableProductOptionEntity;
import com.salesmanager.shop.model.catalog.product.attribute.api.ReadableProductOptionValueEntity;


/**
 * Object representing the results of a search query
 * @author Carl Samson
 *
 */
public class SearchProductList extends ProductList {
	

	private static final long serialVersionUID = 1L;
	private List<ReadableCategory> categoryFacets = new ArrayList<ReadableCategory>();
	private List<ReadableManufacturer> manuFacturerFacets = new ArrayList<ReadableManufacturer>();
	private Map<String,List<ReadableProductOptionValueEntity>> attributesFacets = new HashMap<String,List<ReadableProductOptionValueEntity>>();
	
	
	public List<ReadableCategory> getCategoryFacets() {
		return categoryFacets;
	}
	public void setCategoryFacets(List<ReadableCategory> categoryFacets) {
		this.categoryFacets = categoryFacets;
	}
	public List<ReadableManufacturer> getManuFacturerFacets() {
		return manuFacturerFacets;
	}
	public void setManuFacturerFacets(List<ReadableManufacturer> manuFacturerFacets) {
		this.manuFacturerFacets = manuFacturerFacets;
	}
	public Map<String, List<ReadableProductOptionValueEntity>> getAttributesFacets() {
		return attributesFacets;
	}
	public void setAttributesFacets(Map<String,List<ReadableProductOptionValueEntity>> attributesFacets) {
		this.attributesFacets = attributesFacets; 
	}


}
