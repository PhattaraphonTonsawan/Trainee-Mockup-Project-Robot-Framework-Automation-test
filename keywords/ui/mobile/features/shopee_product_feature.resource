*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Add item to cart
    [Documentation]    เพิ่มสินค้าลงในรถเข็น
    [Arguments]    ${button_text}
    shopee_product_page.Tap add to cart button on product page
    shopee_product_page.Tap button in modal on product page    button_text=${button_text}

Buy item now from product page
    [Documentation]    ซื้อสินค้าทันทีจากหน้าสินค้า
    [Arguments]    ${button_text}
    shopee_product_page.Tap buy now button on product page
    shopee_product_page.Tap button in modal on product page    button_text=${button_text}

Verify product details on product page
    [Documentation]    ตรวจสอบรายละเอียดสินค้าบนหน้าสินค้า
    [Arguments]    ${product_name}    ${product_price}
    shopee_product_page.Check product name on product page    product_name=${product_name}
    shopee_product_page.Check product price on product page    product_price=${product_price}