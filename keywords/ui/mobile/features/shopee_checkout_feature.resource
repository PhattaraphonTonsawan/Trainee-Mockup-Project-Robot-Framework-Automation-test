*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Verify order details on checkout page
    [Documentation]    ตรวจสอบความถูกต้องของข้อมูลบนหน้า Checkout (หัวข้อหน้า, ชื่อสินค้า, และราคาก่อนหักส่วนลด)
    [Arguments]    ${product_qty}=1
    ${order_price}=    BuiltIn.Evaluate    int(${product_detail['product_price']}) * (${product_qty})
    shopee_checkout_page.Check checkout page title
    shopee_checkout_page.Check product name in checkout page
    shopee_checkout_page.Swipe to find order price on checkout page
    shopee_checkout_page.Check order price in checkout page    order_price=${order_price}