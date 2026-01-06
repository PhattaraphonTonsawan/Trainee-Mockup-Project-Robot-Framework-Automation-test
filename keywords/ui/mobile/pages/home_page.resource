*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Search product
    [Documentation]    กดช่องกรอกค้นหาสินค้า
    common_mobile.Swipe into element and wait until element ready    locator=${home_page_locator['txt_seach_item']}
    common_mobile.Click element when ready    locator=${home_page_locator['txt_seach_item']}

Click confirm language and start application
    [Documentation]    กดยืนยันการเลือกภาษาและเริ่มต้นใช้งาน
    common_mobile.Click element when ready    locator=${select_language_page_locator['btn_ok']}
    common_mobile.Click element when ready    locator=${select_language_page_locator['btn_start']}


Click product card
    [Documentation]    กดเลือกสินค้า
    common_mobile.Swipe into element and wait until element ready    locator=${home_page_locator['product_card']}
    common_mobile.Click element when ready    locator=${home_page_locator['product_card']}