*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Check cart page title
    [Documentation]    ตรวจสอบว่าอยู่หน้าตะกร้าสินค้าแล้ว
    common_web.Check element text when visible
    ...    locator=${cart_page_locator['txt_title']}
    ...    text=${txt_cart_page['txt_title']}

Click remove one item from cart
    [Documentation]    ลบสินค้าหนึ่งชิ้นออกจากตะกร้า
    [Arguments]    ${product_name}
    ${replace_locator}=    common_web.Replace locator and wait until element visible
    ...    locator=${cart_page_locator['btn_remove_item']}
    ...    replace_text=${product_name}
    common_web.Click element when ready    locator=${replace_locator}

Click back to shopping button
    [Documentation]    กดปุ่มย้อนกลับไปเลือกซื้อสินค้าต่อ
    common_web.Click element when ready    locator=${cart_page_locator['btn_back_to_shopping']}

Click go to checkout button
    [Documentation]    กดปุ่ม Checkout เพื่อสรุปราคาสินค้าทั้งหมด
    common_web.Click element when ready    locator=${cart_page_locator['btn_checkout']}

Verify specific product detail in cart
    [Documentation]    ตรวจสอบรายการสินค้าที่ถูกเพิ่มเข้าในตะกร้าโดยตรวจสอบ ชื่อ คำอธิบายสินค้า และ ราคา
    [Arguments]    ${name}    ${price}    ${description}
    ${replace_locator_product_name}=    common_web.Replace locator and wait until element visible
    ...    locator=${cart_page_locator['lbl_item_name']}
    ...    replace_text=${name}
    ${replace_locator_product_description}=    common_web.Replace locator and wait until element visible
    ...    locator=${cart_page_locator['lbl_item_description']}
    ...    replace_text=${name}
    ${replace_locator_product_price}=    common_web.Replace locator and wait until element visible
    ...    locator=${cart_page_locator['lbl_item_price']}
    ...    replace_text=${name}
    common_web.Scroll into element and wait until element visible    locator=${replace_locator_product_name}
    common_web.Check element text when visible
    ...    locator=${replace_locator_product_description}
    ...    text=${description}
    common_web.Check element text when visible
    ...    locator=${replace_locator_product_price}
    ...    text=${price}