*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Check product detail added to cart
    [Documentation]    ตรวจสอบข้อมูลสินค้าที่ถูกเพิ่มลงในตะกร้า โดยตรวจสอบชื่อสินค้า, คำอธิบายสินค้า และราคาสินค้า
    [Arguments]    ${product_detail}
    common_web.Check element text when visible
    ...    locator=${product_list_page_locator['lbl_cart_item']}
    ...    text=${product_detail}

Check product list page title
    [Documentation]    ตรวจสอบว่าหน้าปัจจุบันคือหน้า Product List โดยตรวจสอบชื่อหน้าตามที่คาดหวัง
    common_web.Check element text when visible
    ...    locator=${product_list_page_locator['txt_title']}
    ...    text=${txt_product_list_page['txt_title']}

Click add one item to cart
    [Documentation]    เพิ่มสินค้า 1 รายการลงในตะกร้าโดยกดปุ่ม 'Add to cart' ของสินค้านั้น
    [Arguments]    ${product_name}
    ${replace_locator}=    common_web.Replace locator and wait until element visible
    ...    locator=${product_list_page_locator['btn_add_item']}
    ...    replace_text=${product_name}
    ...    target_text=***replace***
    common_web.Click element when ready    locator=${replace_locator}

Click cart icon to go to cart page
    [Documentation]    กดไอคอนตะกร้าเพื่อไปยังหน้า Cart
    common_web.Click element when ready    locator=${product_list_page_locator['btn_go_to_cart']}

Get product name list from page
    [Documentation]    ดึงชื่อสินค้าทุกชิ้นในหน้าปัจจุบัน
    @{element_name_list}=    SeleniumLibrary.Get WebElements    locator=${product_list_page_locator['lbl_product_name']}
    ${name_list}=    BuiltIn.Create List
    FOR    ${element}    IN    @{element_name_list}
        ${text}=    SeleniumLibrary.Get Text    locator=${element}
        Collections.Append To List    ${name_list}    ${text}
    END
    RETURN    ${name_list}

Get product price list from page
    [Documentation]    ดึงราคาสินค้าทุกชิ้นในหน้าปัจจุบัน
    @{element_price_list}=    SeleniumLibrary.Get WebElements    locator=${product_list_page_locator['lbl_product_price']}
    ${price_list}=    BuiltIn.Create List
    FOR    ${element}    IN    @{element_price_list}
        ${text}=    SeleniumLibrary.Get Text    locator=${element}
        ${clean_text}=    common.Sanitize text    text=${text}
        ${number}=    BuiltIn.Convert To Number    item=${clean_text}
        Collections.Append To List    ${price_list}    ${number}
    END
    RETURN    ${price_list}

Select sort type option
    [Documentation]    เลือกรูปแบบการเรียงลำดับสินค้าจาก dropdown ตามค่าที่กำหนด
    [Arguments]    ${option}
    common_web.Select dropdown option when ready
    ...    locator=${product_list_page_locator['ddl_sort_product']}
    ...    option=${option}

Wait until page loaded
    [Documentation]    รอจนกว่าหน้า Product List จะโหลดเสร็จและ element หลักปรากฏ
    common_web.Scroll into element and wait until element visible    locator=${product_list_page_locator['txt_title']}