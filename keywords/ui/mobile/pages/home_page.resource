*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Tap cart button
    [Documentation]    สัมผัสปุ่มตะกร้า
    common_mobile.Swipe container until element visible
    ...    element_container=${home_page_locator['container_page']}
    ...    target_locator=${home_page_locator['btn_cart']}
    common_mobile.Tap element when ready    locator=${home_page_locator['btn_cart']}

Tap profile button
    [Documentation]    สัมผัสปุ่มหน้าโปรไฟล์
    common_mobile.Swipe container until element visible
    ...    element_container=${home_page_locator['container_page']}
    ...    target_locator=${home_page_locator['btn_profile']}
    common_mobile.Tap element when ready    locator=${home_page_locator['btn_profile']}

Tap searchbox
    [Documentation]    สัมผัสช่องกรอกค้นหาสินค้า
    common_mobile.Swipe container until element visible
    ...    element_container=${home_page_locator['container_page']}
    ...    target_locator=${home_page_locator['txt_search_item']}
    common_mobile.Tap element when ready    locator=${home_page_locator['txt_search_item']}