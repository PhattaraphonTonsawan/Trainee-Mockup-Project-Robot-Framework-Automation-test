*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Check checkout page title
    [Documentation]    ตรวจสอบว่าอยู่หน้าชำระสินค้าแล้ว
    common_mobile.Check element text when visible
    ...    locator=${checkout_page_locator['txt_title']}
    ...    text=${txt_shopee_checkout_page['txt_title']}

Check order price in checkout page
    [Documentation]    ตรวจสอบราคาสินค้าว่าถูกต้องในหน้าชำระสินค้า
    [Arguments]    ${order_price}
    common_mobile.Check element text when visible
    ...    locator=${checkout_page_locator['lbl_order_price']}
    ...    text=${order_price}

Check product name in checkout page
    [Documentation]    ตรวจสอบชื่อสินค้าว่าถูกต้องในหน้าชำระสินค้า
    ${replaced_locator}=    common_mobile.Replace locator and wait until element visible
    ...    locator=${checkout_page_locator['lbl_product_name']}
    ...    replace_text=***replace***
    common_mobile.Check element text when visible
    ...    locator=${replaced_locator}
    ...    text=${product_detail['product_name']}

Swipe to find order price on checkout page
    [Documentation]    เลื่อนหน้าชำระเงินจนกว่าจะแสดงราคารวมของสินค้า
    common_mobile.Swipe container until element visible
    ...    container_locator=${checkout_page_locator['container_page']}
    ...    target_locator=${checkout_page_locator['lbl_order_price']}