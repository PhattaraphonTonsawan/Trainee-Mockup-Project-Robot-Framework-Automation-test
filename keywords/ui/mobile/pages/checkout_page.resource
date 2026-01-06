*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Check page title
    [Documentation]    
    common_mobile.Swipe into element and wait until element ready    locator=${checkout_page_locator['txt_title']}

Check total price
    [Documentation]    
    [Arguments]    ${total price}
    common_mobile.Swipe into element and wait until element ready    locator=${checkout_page_locator['lbl_total_price']}
    common_mobile.Wait and verify element value    locator=${checkout_page_locator['lbl_total_price']}    expected_value=${total price}

Check product name
    [Documentation]    
    [Arguments]    ${product name}
    common_mobile.Swipe into element and wait until element ready    locator=${checkout_page_locator['lbl_product_name']}
    common_mobile.Wait and verify element value    locator=${checkout_page_locator['lbl_product_name']}    expected_value=${product name}

Check total payment
    [Documentation]    
    [Arguments]    ${total payment}
    common_mobile.Swipe into element and wait until element ready    locator=${checkout_page_locator['lbl_total_payment']}
    common_mobile.Wait and verify element value    locator=${checkout_page_locator['lbl_total_payment']}    expected_value=${total payment}