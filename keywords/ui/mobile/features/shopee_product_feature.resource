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

Navigate back to home page
    [Documentation]    กดปุ่มย้อนกลับเพื่อกลับไปที่หน้าหลัก
    common_mobile.Tap element when ready    locator=${product_mobile_page_locator['btn_return']}
    common_mobile.Tap element when ready    locator=${search_page_locator['btn_return_product_list']}
    common_mobile.Tap element when ready    locator=${search_page_locator['btn_return']}
    common_mobile.Tap element when ready    locator=${search_page_locator['btn_return']}