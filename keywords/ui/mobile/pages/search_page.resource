*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Input search
    [Documentation]    พิมพ์ชื่อสินค้าบนช่องกรอกค้นหาสินค้า
    common_mobile.Input text when ready
    ...    locator=${home_page_locator['txt_seach_item']}
    ...    text=${product['search_product']['product_name']}