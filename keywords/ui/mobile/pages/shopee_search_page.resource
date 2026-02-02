*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Input product name in search box
    [Documentation]    ป้อนชื่อสินค้าที่ต้องการค้นหาในช่องค้นหา
    [Arguments]    ${product_name}
    common_mobile.Input text when ready
    ...    locator=${search_page_locator['txt_search']}
    ...    text=${product_name}

Swipe to find shopee mall button
    [Documentation]    เลื่อนหน้าค้นหาจนกว่าจะแสดงปุ่ม Shopee Mall
    ${filter_container}=    common_mobile.Replace locator and wait until element visible
    ...    locator=${search_page_locator['ctn_fiter_lts']}
    ...    replace_text=${txt_search_page['txt_shopee_mall']}
    ${ฺbtn_shopee_mall}=    common_mobile.Replace locator and wait until element visible
    ...    locator=${search_page_locator['btn_shopee_mall']}
    ...    replace_text=${txt_search_page['txt_shopee_mall']}
    common_mobile.Swipe container until element visible
    ...    element_container=${filter_container}
    ...    target_locator=${ฺbtn_shopee_mall}
    ...    direction=left

Swipe to find product item
    [Documentation]    เลื่อนหน้าค้นหาจนกว่าจะแสดงสินค้าที่ต้องการ
    [Arguments]    ${product_name}
    ${replaced_locator}=    common_mobile.Replace locator and wait until element visible
    ...    locator=${search_page_locator['ctn_product']}
    ...    replace_text=${product_name}
    common_mobile.Swipe container until element visible
    ...    element_container=${search_page_locator['ctn_page']}
    ...    target_locator=${replaced_locator}

Tap product item
    [Documentation]    สัมผัสสินค้าที่ต้องการจากผลการค้นหา
    [Arguments]    ${product_name}
    ${replaced_locator}=    common_mobile.Replace locator and wait until element visible
    ...    locator=${search_page_locator['ctn_product']}
    ...    replace_text=${product_name}
    common_mobile.Tap element when ready
    ...    locator=${replaced_locator}

Tap search button after input product name
    [Documentation]    สัมผัสปุ่มค้นหาหลังจากป้อนชื่อสินค้า
    common_mobile.Tap element when ready
    ...    locator=${search_page_locator['btn_search']}

Tap shopee mall button
    [Documentation]    สัมผัสปุ่ม Shopee Mall เพื่อกรองผลการค้นหาให้แสดงเฉพาะสินค้าจาก Shopee Mall
    ${replaced_locator}=    common_mobile.Replace locator and wait until element visible
    ...    locator=${search_page_locator['btn_shopee_mall']}
    ...    replace_text=${txt_search_page['txt_shopee_mall']}
    common_mobile.Tap element when ready
    ...    locator=${replaced_locator}