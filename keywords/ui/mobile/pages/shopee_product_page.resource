*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Check product name on product page
    [Documentation]    ตรวจสอบชื่อสินค้าว่าตรงกับค่าที่คาดหวังบนหน้าสินค้า
    [Arguments]    ${product_name}
    common_mobile.Wait until element visible    ${product_mobile_page_locator['txt_product_name']}
    AppiumLibrary.Element Should Contain Text    ${product_mobile_page_locator['txt_product_name']}    ${product_name}

Tap add to cart button on product page
    [Documentation]    สัมผัสปุ่มเพื่อเพิ่มสินค้าลงในรถเข็น
    common_mobile.Tap element when ready
    ...    locator=${product_mobile_page_locator['btn_add_to_cart']}

Tap buy item now button in modal on product page
    [Documentation]    สัมผัสปุ่มซื้อสินค้าทันทีในโมเดิ้นที่ปรากฏขึ้นหลังจากการเพิ่มสินค้าลงในรถเข็น
    ${btn_buy_now_locator}=    BuiltIn.Run Keyword And Return Status    common_mobile.Replace locator and wait until element visible
    ...    locator=${product_mobile_page_locator['btn_in_modal']}
    ...    replace_text=${txt_product_page['txt_buy_now']}
    IF    ${btn_buy_now_locator}
        common_mobile.Tap element when ready
        ...    locator=${btn_buy_now_locator}
    END

Tap add item to cart button in modal on product page
    [Documentation]    สัมผัสปุ่มเพิ่มสินค้าลงรถเข็นในโมเดิ้นที่ปรากฏขึ้นหลังจากการเพิ่มสินค้าลงในรถเข็น
    ${btn_add_to_cart_locator}=    BuiltIn.Run Keyword And Return Status    common_mobile.Replace locator and wait until element visible
    ...    locator=${product_mobile_page_locator['btn_in_modal']}
    ...    replace_text=${txt_product_page['txt_add_to_cart']}
    IF    ${btn_add_to_cart_locator}
        common_mobile.Tap element when ready
    ...    locator=${btn_add_to_cart_locator}
    END

Tap buy now button on product page
    [Documentation]    สัมผัสปุ่มเพื่อซื้อสินค้านั้นทันที
    common_mobile.Tap element when ready
    ...    locator=${product_mobile_page_locator['btn_buy_now']}

Tap cart button on product page
    [Documentation]    สัมผัสปุ่มตะกร้าสินค้าเพื่อเข้าสู่หน้าตะกร้าสินค้า
    common_mobile.Tap element when ready    locator=${product_mobile_page_locator['btn_cart']}