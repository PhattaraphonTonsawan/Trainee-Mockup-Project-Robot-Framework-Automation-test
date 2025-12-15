*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Check product detail have added to cart
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
    common_web.Click element when ready    locator=${replace_locator}

Click go to cart page
    [Documentation]    กดไอคอนตะกร้าเพื่อไปยังหน้า Cart
    common_web.Click element when ready    locator=${product_list_page_locator['go_to_cart_btn']}

Select sort type option
    [Documentation]    เลือกรูปแบบการเรียงลำดับสินค้าจาก dropdown ตามค่าที่กำหนด
    [Arguments]    ${option}
    common_web.Select dropdown option when ready
    ...    locator=${product_list_page_locator['btn_dropdown']}
    ...    option=${option}

Wait until page loaded
    [Documentation]    รอจนกว่าหน้า Product List จะโหลดเสร็จและ element หลักปรากฏ
    common_web.Scroll into element and wait until element visible    locator=${product_list_page_locator['txt_title']}
