*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Check cart page title
    [Documentation]    ตรวจสอบว่าอยู่หน้ารถเข็นแล้ว
    common_mobile.Check element text when visible
    ...    locator=${cart_page_mobile_locator['txt_title']}
    ...    text=${txt_shopee_cart_page['txt_title']}

Check checkout button not visible
    [Documentation]    ตรวจสอบว่าปุ่มกดชำระสินค้าไม่แสดงขึ้นมา และไม่สามารถชำระสินค้าได้
    common_mobile.Wait until element not visible    locator=${cart_page_mobile_locator['btn_checkout']}

Check item name
    [Documentation]    ตรวจสอบชื่อสินค้าที่เพิ่มเข้ามาว่าตรงตามข้อมูลทดสอบหรือไม่
    [Arguments]    ${item_name}
    common_mobile.Check element text when visible
    ...    locator=${cart_page_mobile_locator['txt_product_name']}
    ...    text=${item_name}

Check item quantity
    [Documentation]    ตรวจสอบจำนวนสินค้าที่เพิ่มเข้ามาว่าตรงตามข้อมูลทดสอบหรือไม่
    [Arguments]    ${item_quantity}
    ${actual_text}=    AppiumLibrary.Get Text    ${cart_page_mobile_locator['txt_product_quantity']}
    BuiltIn.Should Be Equal As Strings    ${actual_text}    ${item_quantity}    strip=${True}

Check message when cart is empty
    [Documentation]    ตรวจสอบว่าตะกร้าสินค้านั้นว่างหรือไม่
    common_mobile.Wait until element visible    locator=${cart_page_mobile_locator['lbl_empty_cart_first']}
    common_mobile.Wait until element visible    locator=${cart_page_mobile_locator['lbl_empty_cart_second']}

Replace locator in cart page
    [Documentation]    แทนที่ข้อความภายใน locator (default=***replace***) ด้วยข้อความใหม่สำหรับหร้าตะกร้า
    [Arguments]    ${locator}    ${replace_text}    ${target_text}=***replace***
    ${locator_replaced}=    String.Replace String    ${locator}    ${target_text}    ${replace_text}
    RETURN    ${locator_replaced}

Swipe to find delete item button
    [Documentation]    ปัดสินค้าไปทางซ้ายเพื่อให้ปุ่มลบสินค้าแสดงขี้นมา
    [Arguments]    ${item_name}
    ${delete_button}=    Replace locator in cart page
    ...    locator=${cart_page_mobile_locator['btn_direct_delete']}
    ...    replace_text=${item_name}
    ${product_card}=    Replace locator in cart page
    ...    locator=${cart_page_mobile_locator['ctn_product_card']}
    ...    replace_text=${item_name}
    common_mobile.Swipe container until element visible
    ...    element_container=${product_card}
    ...    target_locator=${delete_button}
    ...    direction=right

Tap to checkout button
    [Documentation]    สัมผัสปุ่ม checkout เพื่อทำรายการชำระเงิน
    common_mobile.Tap element when ready    locator=${cart_page_mobile_locator['btn_checkout']}

Tap to delete item button
    [Documentation]    สัมผัสปุ่มลบสินค้าเพื่อลบสินค้าออกจากตะกร้า
    [Arguments]    ${item_name}
    ${replaced_button_locator}=    common_mobile.Replace locator and wait until element visible
    ...    locator=${cart_page_mobile_locator['btn_direct_delete']}
    ...    replace_text=${item_name}
    common_mobile.Tap element when ready
    ...    locator=${replaced_button_locator}

Tap to increase item quantity
    [Documentation]    สัมผัสเพื่อเพิ่มจำนวนสินค้านั้นๆที่อยู่ในตะกร้า
    [Arguments]    ${item_name}
    ${replace_locator}=    common_mobile.Replace locator and wait until element visible
    ...    locator=${cart_page_mobile_locator['btn_add_item_quantity']}
    ...    replace_text=${item_name}
    common_mobile.Tap element when ready
    ...    locator=${replace_locator}