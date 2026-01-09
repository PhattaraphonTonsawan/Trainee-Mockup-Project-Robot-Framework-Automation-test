*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Input search
    [Documentation]    พิมพ์ชื่อสินค้าบนช่องกรอกค้นหาสินค้า
    common_mobile.Input text when ready
    ...    locator=${home_page_locator['txt_seach_item']}
    ...    text=${product['search_product']['product_name']}

Click search icon
    [Documentation]    กดที่ไอคอนแว่นขยายเพื่อกดค้นหา
    common_mobile.Click element when ready    locator=${search_page_locator['btn_search']}

Click product card
    [Documentation]    กดเลือกสินค้าชิ้นแรก หรือสินค้าที่แสดงผลอยู่ (Product Card)
    common_mobile.Click element when ready    locator=${search_page_locator['product_container']}