*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Input product name in search box and tap search button
    [Documentation]    ป้อนชื่อสินค้าที่ต้องการค้นหาในช่องค้นหา และสัมผัสปุ่มค้นหา
    [Arguments]    ${product_name}
    shopee_search_page.Input product name in search box
    ...    product_name=${product_name}
    shopee_search_page.Tap search button after input product name

Find product in search results and tap product item
    [Documentation]    ค้นหาสินค้าที่ต้องการจากผลการค้นหา และสัมผัสสินค้านั้น
    [Arguments]    ${product_name}
    shopee_search_page.Swipe to find shopee mall button
    shopee_search_page.Tap shopee mall button
    shopee_search_page.Swipe to find product item
    ...    product_name=${product_name}
    shopee_search_page.Tap product item
    ...    product_name=${product_name}