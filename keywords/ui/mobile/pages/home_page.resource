*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Check search bar visible
    [Documentation]    ตรวจสอบว่าแถบค้นหาสินค้าแสดงในหน้าจอหรือไม่
    common_mobile.Wait until element visible    locator=${home_page_locator['txt_search_item']}

Tap button in bottom navigation bar
    [Documentation]    สัมผัสปุ่มที่ Navbar ด้านล่างของหน้าจอ
    [Arguments]    ${button_name}
    ${replace_locator}=    common_mobile.Replace locator and wait until element visible
    ...    locator=${home_page_locator['btn_navbar']}
    ...    replace_text=${button_name}
    common_mobile.Tap element when ready    locator=${replace_locator}

Tap cart button
    [Documentation]    สัมผัสปุ่มตะกร้าสินค้าเพื่อเข้าสู่หน้าตะกร้าสินค้า
    common_mobile.Tap element when ready    locator=${home_page_locator['btn_cart']}

Tap search bar
    [Documentation]    สัมผัสที่แถบค้นหาสินค้าเพื่อเปิดหน้าจอการค้นหา
    common_mobile.Tap element when ready    locator=${home_page_locator['txt_search_item']}