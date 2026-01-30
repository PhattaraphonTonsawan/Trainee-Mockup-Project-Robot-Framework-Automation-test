*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Check product name on product page
    [Documentation]    ตรวจสอบชื่อสินค้าว่าตรงกับค่าที่คาดหวังบนหน้าสินค้า
    [Arguments]    ${product_name}
    common_mobile.Check element text when visible
    ...    locator=${product_mobile_page_locator['txt_product_name']}
    ...    text=${product_name}

Check product price on product page
    [Documentation]    ตรวจสอบราคาสินค้าว่าตรงกับค่าที่คาดหวังบนหน้าสินค้า
    [Arguments]    ${product_price}
    common_mobile.Check element text when visible
    ...    locator=${product_mobile_page_locator['txt_product_price']}
    ...    text=${product_price}

Tap add to cart button on product page
    [Documentation]    สัมผัสปุ่มเพื่อเพิ่มสินค้าลงในรถเข็น
    common_mobile.Tap element when ready
    ...    locator=${product_mobile_page_locator['btn_add_to_cart']}

Tap button in modal on product page
    [Documentation]    สัมผัสปุ่มซื้อสินค้าทันทีหรือปุ่มเพิ่มสินค้าลงในตะกร้า ในโมเดิ้นที่ปรากฏขึ้นหลังจากการเพิ่มสินค้าลงในรถเข็นหรือการซื้อทันที
    [Arguments]    ${button_text}
    ${locator_in_modal}=    common_mobile.Replace locator and wait until element visible
    ...    locator=${product_mobile_page_locator['btn_in_modal']}
    ...    replace_text=${button_text}
    common_mobile.Tap element when ready
    ...    locator=${locator_in_modal}

Tap buy now button on product page
    [Documentation]    สัมผัสปุ่มเพื่อซื้อสินค้านั้นทันที
    common_mobile.Tap element when ready
    ...    locator=${product_mobile_page_locator['btn_buy_now']}