package com.salesmanager.core.business.modules.order.total;

import java.math.BigDecimal;
import java.util.Date;

import org.apache.commons.lang.Validate;
import org.apache.commons.lang3.StringUtils;
import org.kie.api.runtime.KieSession;
import org.kie.internal.io.ResourceFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.salesmanager.core.business.configuration.DroolsBeanFactory;
import com.salesmanager.core.business.constants.Constants;
import com.salesmanager.core.business.services.catalog.product.PricingService;
import com.salesmanager.core.model.catalog.category.Category;
import com.salesmanager.core.model.catalog.product.Product;
import com.salesmanager.core.model.catalog.product.price.FinalPrice;
import com.salesmanager.core.model.customer.Customer;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.order.OrderSummary;
import com.salesmanager.core.model.order.OrderTotal;
import com.salesmanager.core.model.order.OrderTotalType;
import com.salesmanager.core.model.shoppingcart.ShoppingCartItem;
import com.salesmanager.core.modules.order.total.OrderTotalPostProcessorModule;

@Component
public class PromoCodeCalculatorModule implements OrderTotalPostProcessorModule {
	
	
	@Autowired
	private DroolsBeanFactory droolsBeanFactory;
	
	@Autowired
	private PricingService pricingService;

	private String name;
	private String code;

	@Override
	public String getName() {
		// TODO Auto-generated method stub
		return name;
	}

	@Override
	public void setName(String name) {
		this.name = name;

	}

	@Override
	public String getCode() {
		// TODO Auto-generated method stub
		return code;
	}

	@Override
	public void setCode(String code) {
		this.code = code;
	}

	@Override
	public OrderTotal caculateProductPiceVariation(OrderSummary summary, ShoppingCartItem shoppingCartItem,
			Product product, Customer customer, MerchantStore store) throws Exception {
		
		Validate.notNull(summary, "OrderTotalSummary must not be null");
		Validate.notNull(store, "MerchantStore must not be null");
		
		KieSession kieSession=droolsBeanFactory.getKieSession(ResourceFactory.newClassPathResource("com/salesmanager/drools/rules/PromoCoupon.drl"));
		
		OrderTotalResponse resp = new OrderTotalResponse();
		
		OrderTotalInputParameters inputParameters = new OrderTotalInputParameters();
		inputParameters.setPromoCode(summary.getPromoCode());
		inputParameters.setDate(new Date());
		if(product!=null) {
			inputParameters.setProductId(product.getId());
			if(product.getCategories() != null && !product.getCategories().isEmpty()) {
				for(Category cat:product.getCategories()) {
					inputParameters.getItemCategoryCodes().add(cat.getCode());
					inputParameters.setItemCategoryCode(cat.getCode());
				}
			}
		}
		inputParameters.setItemManufacturerCode(product.getManufacturer().getCode());
		inputParameters.setQuantity(shoppingCartItem.getQuantity());
		inputParameters.setProductSKU(product.getSku());

		
        kieSession.insert(inputParameters);
        kieSession.setGlobal("total",resp);
        kieSession.fireAllRules();

        if(resp.isFlagBOGO() && ((resp.getProductId() > 0 && resp.getProductId() == product.getId()) || 
        		(resp.getProductSKU()!="" && !resp.getProductSKU().isEmpty() && resp.getProductSKU().equalsIgnoreCase(product.getSku())))) {
			OrderTotal orderTotal = null;
			// shoppingCartItem.setQuantity(shoppingCartItem.getQuantity() * resp.getQuantity());
			orderTotal = new OrderTotal();
			orderTotal.setOrderTotalCode(Constants.OT_DISCOUNT_TITLE);
			orderTotal.setOrderTotalType(OrderTotalType.SUBTOTAL);
			orderTotal.setTitle(Constants.OT_SUBTOTAL_MODULE_CODE);
			orderTotal.setText("Buy "+shoppingCartItem.getQuantity()+" get "+(shoppingCartItem.getQuantity()*resp.getQuantity())+" free.");
			
			//calculate discount that will be added as a negative value
			FinalPrice productPrice = pricingService.calculateProductPrice(product);
			
			Double discount = 1d;
			if(resp.getQuantity()>0) {
				discount = (double) 1 / (1+resp.getQuantity());
				System.out.println("discount_PRE: " + discount);
				discount = resp.getQuantity()*discount;
			}
			System.out.println("productPrice.getFinalPrice(): " + productPrice.getFinalPrice());
			System.out.println("discount: " + discount);
			System.out.println("shoppingCartItem.getQuantity(): " + shoppingCartItem.getQuantity());
			System.out.println("resp.getQuantity(): " + resp.getQuantity());
			BigDecimal reduction = productPrice.getFinalPrice().multiply(new BigDecimal(discount));
			System.out.println("reduction1: " + reduction);
			reduction = reduction.multiply(new BigDecimal(shoppingCartItem.getQuantity()));
			System.out.println("reduction2: " + reduction);
			
			orderTotal.setValue(reduction);//discount value
			return orderTotal;
        } else if(!StringUtils.isBlank(summary.getPromoCode()) && resp.getDiscount() != null) {
			
			OrderTotal orderTotal = null;
			if(resp.getDiscount() != null) {
					orderTotal = new OrderTotal();
					orderTotal.setOrderTotalCode(Constants.OT_DISCOUNT_TITLE);
					orderTotal.setOrderTotalType(OrderTotalType.SUBTOTAL);
					orderTotal.setTitle(Constants.OT_SUBTOTAL_MODULE_CODE);
					orderTotal.setText(summary.getPromoCode());
					
					//calculate discount that will be added as a negative value
					FinalPrice productPrice = pricingService.calculateProductPrice(product);
					
					Double discount = resp.getDiscount();
					BigDecimal reduction = productPrice.getFinalPrice().multiply(new BigDecimal(discount));
					reduction = reduction.multiply(new BigDecimal(shoppingCartItem.getQuantity()));
					
					orderTotal.setValue(reduction);//discount value
					
					//TODO check expiration
			}
				
			
			
			return orderTotal;
			
		}
		
		
		
		return null;
	}

}
