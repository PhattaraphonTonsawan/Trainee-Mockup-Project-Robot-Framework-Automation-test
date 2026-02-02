*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Add item to cart
    [Documentation]    เพิ่มสินค้าลงในรถเข็น
    shopee_product_page.Tap add to cart button on product page
    shopee_product_page.Tap add item to cart button in modal on product page

Buy item now from product page
    [Documentation]    ซื้อสินค้าทันทีจากหน้าสินค้า
    shopee_product_page.Tap buy now button on product page
    shopee_product_page.Tap buy item now button in modal on product page

Verify product details on product page
    [Documentation]    ตรวจสอบรายละเอียดสินค้าบนหน้าสินค้า
    [Arguments]    ${product_name}
    shopee_product_page.Check product name on product page    product_name=${product_name}