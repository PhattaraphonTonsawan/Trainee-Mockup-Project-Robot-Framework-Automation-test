*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Check page title
    [Documentation]    ตรวจสอบว่าชื่อหน้าถูกต้องตามที่คาดหวังหรือไม่
    common_web.Check element text when visible
    ...    locator=${checkout_overview_page_locator['txt_page_title']}
    ...    text=${txt_checkout_overview_page['txt_title']}

Check product item title
    [Documentation]    ตรวจสอบชื่อสินค้าที่ปรากฏบนหน้า
    [Arguments]    ${item_name}
    ${replace_locator_product_name}=    common_web.Replace locator and wait until element visible
    ...    locator=${checkout_overview_page_locator['txt_item_name']}
    ...    replace_text=${item_name}
    common_web.Check element text when visible
    ...    locator=${replace_locator_product_name}
    ...    text=${item_name}

Click finish button
    [Documentation]    กดปุ่ม Finish และตรวจสอบว่าหน้าถัดไปเป็นหน้า Checkout Complete Page
    common_web.Click element when ready    locator=${checkout_overview_page_locator['btn_finish']}

Click cancel button
    [Documentation]    กดปุ่ม Cancel และตรวจสอบว่าหน้าถัดไปเป็นหน้า Main Page
    common_web.Click element when ready    locator=${checkout_overview_page_locator['btn_cancel']}

Get item tax
    [Documentation]    ดึงค่าภาษีจากหน้าจอ Checkout Overview Page และส่งกลับเป็นตัวแปร
    ${tax}=    common_web.Get element text when visible    locator=${checkout_overview_page_locator['txt_tax']}
    RETURN    ${tax}

Get total price
    [Documentation]    ดึงค่ารวมราคาสินค้ารวมภาษีจากหน้าจอ Checkout Overview Page และส่งกลับเป็นตัวแปร
    ${total_price}=    common_web.Get element text when visible
    ...    locator=${checkout_overview_page_locator['txt_total_price']}
    RETURN    ${total_price}

Get list of product price
    [Documentation]    ดึงรายการ element ราคาสินค้าแต่ละชิ้นจากหน้าจอ Checkout Overview Page และส่งกลับเป็นลิสต์
    ${list_product_price}=    SeleniumLibrary.Get WebElements    ${checkout_overview_page_locator['txt_item_prices']}
    RETURN    ${list_product_price}

Wait until page loaded
    [Documentation]    รอจนกว่าหน้า Checkout Overview Page จะโหลดเสร็จและ element หลักปรากฏ
    common_web.Scroll into element and wait until element visible
    ...    locator=${checkout_overview_page_locator['txt_page_title']}