*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Search product
    [Documentation]    ค้นหาสินค้าจากช่อง search
    common_mobile.Scroll into element and wait until element ready    locator=${home_page_locator['txt_seach_item']}
    common_mobile.Click element when ready    locator=${home_page_locator['txt_seach_item']}