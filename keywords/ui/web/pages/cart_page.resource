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
    ...    target_text=${product_name}
    ...    replace_text=***replace***
    common_web.Click element when ready    locator=${replace_locator}

Click back to shopping button
    [Documentation]    กดปุ่มย้อนกลับไปเลือกซื้อสินค้าต่อ
    common_web.Click element when ready    locator=${cart_page_locator['btn_back_to_shopping']}

Click go to checkout button
    [Documentation]    กดปุ่ม Checkout เพื่อสรุปราคาสินค้าทั้งหมด
    common_web.Click element when ready    locator=${cart_page_locator['btn_checkout']}

Verify product name in cart
    [Documentation]    ตรวจสอบชื่อสินค้าที่ถูกเพิ่มเข้าในตะกร้า
    [Arguments]    ${name}
    ${replace_locator_product_name}=    common_web.Replace locator and wait until element visible
    ...    locator=${cart_page_locator['lbl_item_name']}
    ...    target_text=***replace***
    ...    replace_text=${name}
    common_web.Scroll into element and wait until element visible    locator=${replace_locator_product_name}

Verify product description in cart
    [Documentation]    ตรวจสอบคำอธิบายสินค้าที่ถูกเพิ่มเข้าในตะกร้า
    [Arguments]    ${name}    ${description}
    ${replace_locator_product_description}=    common_web.Replace locator and wait until element visible
    ...    locator=${cart_page_locator['lbl_item_description']}
    ...    target_text=***replace***
    ...    replace_text=${name}
    common_web.Check element text when visible
    ...    locator=${replace_locator_product_description}
    ...    text=${description}

Verify product price in cart
    [Documentation]    ตรวจสอบคำอธิบายสินค้าที่ถูกเพิ่มเข้าในตะกร้า
    [Arguments]    ${name}    ${price}
    ${replace_locator_product_description}=    common_web.Replace locator and wait until element visible
    ...    locator=${cart_page_locator['lbl_item_description']}
    ...    target_text=***replace***
    ...    replace_text=${name}
    common_web.Check element text when visible
    ...    locator=${replace_locator_product_description}
    ...    text=${price}