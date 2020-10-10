package com.salesmanager.shop.store.controller.search.facade;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.inject.Inject;

import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.salesmanager.core.business.exception.ConversionException;
import com.salesmanager.core.business.exception.ServiceException;
import com.salesmanager.core.business.services.catalog.category.CategoryService;
import com.salesmanager.core.business.services.catalog.product.PricingService;
import com.salesmanager.core.business.services.catalog.product.ProductService;
import com.salesmanager.core.business.services.catalog.product.attribute.ProductOptionService;
import com.salesmanager.core.business.services.catalog.product.attribute.ProductOptionValueService;
import com.salesmanager.core.business.services.catalog.product.manufacturer.ManufacturerService;
import com.salesmanager.core.business.services.search.SearchService;
import com.salesmanager.core.business.utils.CoreConfiguration;
import com.salesmanager.core.model.catalog.category.Category;
import com.salesmanager.core.model.catalog.product.Product;
import com.salesmanager.core.model.catalog.product.ProductCriteria;
import com.salesmanager.core.model.catalog.product.ProductList;
import com.salesmanager.core.model.catalog.product.attribute.ProductOption;
import com.salesmanager.core.model.catalog.product.attribute.ProductOptionValue;
import com.salesmanager.core.model.catalog.product.manufacturer.Manufacturer;
import com.salesmanager.core.model.merchant.MerchantStore;
import com.salesmanager.core.model.reference.language.Language;
import com.salesmanager.core.model.search.IndexProduct;
import com.salesmanager.core.model.search.SearchEntry;
import com.salesmanager.core.model.search.SearchFacet;
import com.salesmanager.core.model.search.SearchKeywords;
import com.salesmanager.core.model.search.SearchResponse;
import com.salesmanager.shop.model.catalog.SearchProductList;
import com.salesmanager.shop.model.catalog.SearchProductRequest;
import com.salesmanager.shop.model.catalog.category.ReadableCategory;
import com.salesmanager.shop.model.catalog.manufacturer.ReadableManufacturer;
import com.salesmanager.shop.model.catalog.product.ReadableProduct;
import com.salesmanager.shop.model.catalog.product.attribute.ReadableProductOption;
import com.salesmanager.shop.model.catalog.product.attribute.ReadableProductOptionValue;
import com.salesmanager.shop.model.catalog.product.attribute.api.ReadableProductOptionEntity;
import com.salesmanager.shop.model.catalog.product.attribute.api.ReadableProductOptionValueEntity;
import com.salesmanager.shop.model.entity.ValueList;
import com.salesmanager.shop.populator.catalog.ReadableCategoryPopulator;
import com.salesmanager.shop.populator.catalog.ReadableProductPopulator;
import com.salesmanager.shop.store.api.exception.ConversionRuntimeException;
import com.salesmanager.shop.store.api.exception.ServiceRuntimeException;
import com.salesmanager.shop.store.controller.manufacturer.facade.ManufacturerFacade;
import com.salesmanager.shop.store.controller.product.facade.ProductOptionFacade;
import com.salesmanager.shop.store.model.search.AutoCompleteRequest;
import com.salesmanager.shop.utils.ImageFilePath;

@Service("searchFacade")
public class SearchFacadeImpl implements SearchFacade {

	private static final Logger LOGGER = LoggerFactory.getLogger(SearchFacadeImpl.class);

	@Inject
	private SearchService searchService;

	@Inject
	private ProductService productService;

	@Inject
	private CategoryService categoryService;

	@Inject
	private PricingService pricingService;

	@Inject
	@Qualifier("img")
	private ImageFilePath imageUtils;
	
	@Inject
	private ManufacturerService manufacturerService;

	@Inject
	private ManufacturerFacade manufacturerFacade;
	
	@Autowired
	private ProductOptionFacade productOptionFacade;

	@Autowired
	private ProductOptionService productOptionService;

	@Autowired
	private ProductOptionValueService productOptionValueService;

	private final static String CATEGORY_FACET_NAME = "categories";
	private final static String MANUFACTURER_FACET_NAME = "manufacturer";
	private final static String[] ATTRIBUTES_FACET_NAME_ARR={"brand","size","color"};
	private final static List<String> ATTRIBUTES_FACET_NAME = new ArrayList<String>(Arrays.asList(ATTRIBUTES_FACET_NAME_ARR));
	private final static int AUTOCOMPLETE_ENTRIES_COUNT = 15;

	/**
	 * Index all products from the catalogue Better stop the system, remove ES
	 * indexex manually restart ES and run this query
	 */
	@Override
	@Async
	public void indexAllData(MerchantStore store) throws Exception {
		List<Product> products = productService.listByStore(store);

		for (Product product : products) {
			searchService.index(store, product);
		}

	}

	@Override
	public SearchProductList search(MerchantStore store, Language language, SearchProductRequest searchRequest) {
		SearchResponse response = search(store, language.getCode(), searchRequest.getQuery(), searchRequest.getCount(),
				searchRequest.getStart());
		return convertToSearchProductList(response, store, searchRequest.getStart(), searchRequest.getCount(),
				language);
	}

	private SearchResponse search(MerchantStore store, String languageCode, String query, Integer count,
			Integer start) {
		try {
			LOGGER.debug("Search " + query);
			return searchService.search(store, languageCode, query, count, start);
		} catch (ServiceException e) {
			throw new ServiceRuntimeException(e);
		}
	}

	@Override
	public SearchProductList convertToSearchProductList(SearchResponse searchResponse, MerchantStore merchantStore,
			int start, int count, Language language) {

		SearchProductList returnList = new SearchProductList();
		List<SearchEntry> entries = searchResponse.getEntries();

		if (CollectionUtils.isNotEmpty(entries)) {
			List<Long> ids = entries.stream().map(SearchEntry::getIndexProduct).map(IndexProduct::getId)
					.map(Long::parseLong).collect(Collectors.toList());

			ProductCriteria searchCriteria = new ProductCriteria();
			searchCriteria.setMaxCount(count);
			searchCriteria.setStartIndex(start);
			searchCriteria.setProductIds(ids);
			searchCriteria.setAvailable(true);

			ProductList productList = productService.listByStore(merchantStore, language, searchCriteria);

			List<ReadableProduct> readableProducts = productList.getProducts().stream()
					.map(product -> convertProductToReadableProduct(product, merchantStore, language))
					.collect(Collectors.toList());

			returnList.getProducts().addAll(readableProducts);
			returnList.setProductCount(productList.getProducts().size());
		}

		// Facets
		Map<String, List<SearchFacet>> facets = Optional.ofNullable(searchResponse.getFacets())
				.orElse(Collections.emptyMap());

		List<ReadableCategory> categoryProxies = getCategoryFacets(merchantStore, language, facets);
		returnList.setCategoryFacets(categoryProxies);

		List<ReadableManufacturer> manuFacturerProxies = getManufacteurerFacets(merchantStore, language, facets);
		returnList.setManuFacturerFacets(manuFacturerProxies);
		
		Map<String,List<ReadableProductOptionValueEntity>> attributesFacets =  getAttributesFacets(merchantStore, language, facets);
		returnList.setAttributesFacets(attributesFacets);
		
		return returnList;
	}

	private Map<String, List<ReadableProductOptionValueEntity>> getAttributesFacets(
			MerchantStore merchantStore, Language language, Map<String, List<SearchFacet>> facets) {
		Map<String,List<ReadableProductOptionValueEntity>> attributesFacets = new HashMap<String,List<ReadableProductOptionValueEntity>>();
		for(Entry<String, List<SearchFacet>> tempFac :facets.entrySet()) {
			if(ATTRIBUTES_FACET_NAME.contains(tempFac.getKey()) && tempFac.getValue()!=null && !tempFac.getValue().isEmpty()) {
				List<ReadableProductOptionValueEntity> readableProductOptionValues = new ArrayList<ReadableProductOptionValueEntity>();
				for (SearchFacet tempVal:tempFac.getValue()) {
					System.out.println("key: "+ tempFac.getKey()+" val: "+tempVal.getKey()+" :: "+ tempVal.getCount() +" :: "+ tempVal.getName());
					if(!StringUtils.isBlank(tempVal.getName())) {
						try {
							List<ProductOptionValue> productOptionValue = productOptionValueService.getByName(merchantStore, tempVal.getName(), language);
							if(productOptionValue!=null) {
								ReadableProductOptionValueEntity readableProductOptionValue = productOptionFacade.getOptionValue(productOptionValue.get(0).getId() , merchantStore, language);
								readableProductOptionValue.setProductCount((int)tempVal.getCount());
								readableProductOptionValues.add(readableProductOptionValue);
							}
						} catch (ServiceException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				}
				if(CollectionUtils.isNotEmpty(readableProductOptionValues)) {
					ProductOption option = productOptionService.getByCode(merchantStore, tempFac.getKey());
					if (option != null) {
						ReadableProductOptionEntity key = productOptionFacade.getOption(option.getId(), merchantStore, language);
						for(ReadableProductOptionValueEntity readableProductOptionValue:readableProductOptionValues) {
							System.out.println("Shabbir1: "+key.getDescription().getName()+" :: "+ readableProductOptionValue.getDescription().getName());
						}
						attributesFacets.put(key.getDescription().getName(), readableProductOptionValues);
					}
				}
			}
		}
		return attributesFacets;
	}

	private List<ReadableCategory> getCategoryFacets(MerchantStore merchantStore, Language language,
			Map<String, List<SearchFacet>> facets) {
		List<SearchFacet> categoriesFacets = facets.entrySet().stream()
				.filter(e -> CATEGORY_FACET_NAME.equals(e.getKey())).findFirst().map(Entry::getValue)
				.orElse(Collections.emptyList());

		if (CollectionUtils.isNotEmpty(categoriesFacets)) {

			List<String> categoryCodes = categoriesFacets.stream().map(SearchFacet::getName)
					.collect(Collectors.toList());

			Map<String, Long> productCategoryCount = categoriesFacets.stream()
					.collect(Collectors.toMap(SearchFacet::getKey, SearchFacet::getCount));

			List<Category> categories = categoryService.listByCodes(merchantStore, categoryCodes, language);
			return categories.stream().map(category -> convertCategoryToReadableCategory(merchantStore, language,
					productCategoryCount, category)).collect(Collectors.toList());
		} else {
			return Collections.emptyList();
		}
	}

	private ReadableCategory convertCategoryToReadableCategory(MerchantStore merchantStore, Language language,
			Map<String, Long> productCategoryCount, Category category) {
		ReadableCategoryPopulator populator = new ReadableCategoryPopulator();
		try {
			ReadableCategory categoryProxy = populator.populate(category, new ReadableCategory(), merchantStore,
					language);
			Long total = productCategoryCount.get(categoryProxy.getCode());
			if (total != null) {
				categoryProxy.setProductCount(total.intValue());
			}
			return categoryProxy;
		} catch (ConversionException e) {
			throw new ConversionRuntimeException(e);
		}
	}
	
	private List<ReadableManufacturer> getManufacteurerFacets(MerchantStore merchantStore, Language language,
			Map<String, List<SearchFacet>> facets) {
		List<SearchFacet> manufacturerFacets = facets.entrySet().stream()
				.filter(e -> MANUFACTURER_FACET_NAME.equals(e.getKey())).findFirst().map(Entry::getValue)
				.orElse(Collections.emptyList());
		List<ReadableManufacturer> readableManufacturers = new ArrayList<ReadableManufacturer>();
		if (CollectionUtils.isNotEmpty(manufacturerFacets)) {
			List<String> manufacturerCodes = manufacturerFacets.stream().map(SearchFacet::getName)
					.collect(Collectors.toList());
			Map<String, Long> productManufacturerCount = manufacturerFacets.stream()
					.collect(Collectors.toMap(SearchFacet::getName, SearchFacet::getCount));
			for(String manufacturerCode:manufacturerCodes) {
				 try {
					ReadableManufacturer readableManufacturer = manufacturerFacade.getManufacturer(Long.valueOf(manufacturerCode), merchantStore, language);
					if(readableManufacturer!=null) {
						Long total = productManufacturerCount.get(manufacturerCode);
						if (total != null) {
							readableManufacturer.setProductCount(total.intValue());
						}
						readableManufacturers.add(readableManufacturer);
					}
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} 
			}
			return readableManufacturers;
		} else {
			return Collections.emptyList();
		}
	}

	private ReadableProduct convertProductToReadableProduct(Product product, MerchantStore merchantStore,
			Language language) {

		ReadableProductPopulator populator = new ReadableProductPopulator();
		populator.setPricingService(pricingService);
		populator.setimageUtils(imageUtils);

		try {
			return populator.populate(product, new ReadableProduct(), merchantStore, language);
		} catch (ConversionException e) {
			throw new ConversionRuntimeException(e);
		}
	}

	@Override
	public ValueList autocompleteRequest(String word, MerchantStore store, Language language) {
		AutoCompleteRequest req = new AutoCompleteRequest(store.getCode(), language.getCode());
		//String formattedQuery = String.format(coreConfiguration.getProperty("AUTOCOMPLETE_QUERY"), query);

		/**
		 * formatted toJSONString because of te specific field names required in
		 * the UI
		 **/

		SearchKeywords keywords = getSearchKeywords(req, word);
		ValueList returnList = new ValueList();
		returnList.setValues(keywords.getKeywords());
		return returnList;
	}

	private SearchKeywords getSearchKeywords(AutoCompleteRequest req, String word) {
		try {
			LOGGER.debug("Search auto comlete " + word);
			return searchService.searchForKeywords(req.getCollectionName(), word, AUTOCOMPLETE_ENTRIES_COUNT);
		} catch (ServiceException e) {
			throw new ServiceRuntimeException(e);
		}
	}
}
