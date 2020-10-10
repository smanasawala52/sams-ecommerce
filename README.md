mysqldump -u root -p salesmanager > D:\AMS-Ecommerce\sams\salesmanager.sql

Manage content - content box
sm-shop
src
main
java
com
salesmanager
shop
admin
controller
content
ContentPagesController.java (2 matches)
309: @RequestMapping(value="/admin/content/checkContentCode.html", method=RequestMethod.POST)  
310: public @ResponseBody ResponseEntity<String> checkContentCode(HttpServletRequest request, HttpServletResponse response, Locale locale) {  
tags
PageContentTag.java (8 matches)
35: private String contentCode;  
40: public String getContentCode() {  
41: return contentCode;  
45: public void setContentCode(String contentCode) {  
46: this.contentCode = contentCode;  
66: Content content = contentService.getByCode(contentCode, store, language);  
webapp
pages
admin
content
contentPagesDetails.jsp
28: checkCode(code,id,'<c:url value="/admin/content/checkContentCode.html" />');  
shop
common
catalog
addToCartProduct.jsp
28: <sm:pageContent contentCode="${SKU}"/>  
checkout
checkout.jsp
1,480: <sm:pageContent contentCode="agreement"/>  
confirmation.jsp
128: <sm:pageContent contentCode="confirmation"/>  
merchant
contactus.jsp
207: <sm:pageContent contentCode="contactUsDetails"/>  
templates
bootstrap
catalogLayout.jsp
55: <sm:pageContent contentCode="beforeCloseBody"/>  
december
pages
checkout.jsp
1,050: <sm:pageContent contentCode="agreement" />  
landing.jsp (4 matches)
21: <sm:pageContent contentCode="heroSlider"/>  
31: <sm:pageContent contentCode="bannerImage"/>  
50: <sm:pageContent contentCode="homeMessage"/>  
71: <sm:pageContent contentCode="featuredItemsText"/>  
product.jsp
297: <sm:pageContent contentCode="sideBar"/>  
sections
footer.jsp (2 matches)
29: <sm:pageContent contentCode="contactUsDetails"/>  
118: <sm:pageContent contentCode="footerImage"/>  
header.jsp
300: <sm:pageContent contentCode="logo"/>  
shopLinks.jsp
33: <sm:pageContent contentCode="favicon"/>  
catalogLayout.jsp
110: <sm:pageContent contentCode="beforeCloseBody"/>  
exoticamobilia
pages
landing.jsp (2 matches)
23: <sm:pageContent contentCode="banner"/>  
32: <sm:pageContent contentCode="homeMessage"/>  
product.jsp
170: <sm:pageContent contentCode="fsa"/>  
sections
footer.jsp (3 matches)
70: <sm:pageContent contentCode="paymentDetails"/>  
84: <sm:pageContent contentCode="contactUsDetails"/>  
146: <sm:pageContent contentCode="footerMessage"/>  
header.jsp
327: <sm:pageContent contentCode="logo"/>  
generic
pages
checkout.jsp
1,058: <sm:pageContent contentCode="agreement" />  
landing.jsp (3 matches)
22: <sm:pageContent contentCode="bannerImage"/>  
43: <sm:pageContent contentCode="homeMessage"/>  
107: <sm:pageContent contentCode="featuredItemsText"/>  
product.jsp
284: <sm:pageContent contentCode="sideBar"/>  
sections
footer.jsp (2 matches)
29: <sm:pageContent contentCode="contactUsDetails"/>  
113: <sm:pageContent contentCode="footerImage"/>  
header.jsp (2 matches)
150: <sm:pageContent contentCode="logo"/>  
177: <sm:pageContent contentCode="headerMessage"/>  
shopLinks.jsp
32: <sm:pageContent contentCode="favicon"/>  
catalogLayout.jsp
89: <sm:pageContent contentCode="beforeCloseBody"/>  
WEB-INF
sams-tags.tld
48: <name>contentCode</name>  