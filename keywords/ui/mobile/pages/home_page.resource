*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Search product
    [Documentation]    กดช่องกรอกค้นหาสินค้า
    common_mobile.Swipe into element and wait until element ready    locator=${home_page_locator['txt_seach_item']}
    common_mobile.Click element when ready    locator=${home_page_locator['txt_seach_item']}