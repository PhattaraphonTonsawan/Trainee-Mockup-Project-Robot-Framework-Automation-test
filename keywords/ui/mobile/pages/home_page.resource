*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Tap cart button
    [Documentation]    สัมผัสปุ่มตะกร้าสินค้าเพื่อเข้าสู่หน้าตะกร้าสินค้า
    common_mobile.Tap element when ready    locator=${home_page_locator['btn_cart']}

Tap profile button
    [Documentation]    สัมผัสปุ่มโปรไฟล์พื่อเข้าสู่หน้าโปรไฟล์
    common_mobile.Tap element when ready    locator=${home_page_locator['btn_profile']}

Tap search bar
    [Documentation]    สัมผัสที่แถบค้นหาสินค้าเพื่อเปิดหน้าจอการค้นหา
    common_mobile.Tap element when ready    locator=${home_page_locator['txt_search_item']}