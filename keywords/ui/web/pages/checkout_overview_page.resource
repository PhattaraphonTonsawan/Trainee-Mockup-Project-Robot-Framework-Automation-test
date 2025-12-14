*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Check page title
    [Documentation]    Check if page title display the correct text or not
    common_web.Wait for element is ready    locator=${checkout_overview_page_locator['txt_page_title']}    timeout=${wait_timeout['normally['short_timeout']']}
    common_web.Element should contain text    locator=${checkout_overview_page_locator['txt_page_title']}    expected_text=${txt_checkout_overview_page['txt_title']}

Check product item title
    [Documentation]    Check product title in page
    [Arguments]    ${item_name}
    common_web.Wait for element is ready    locator=${checkout_overview_page_locator['txt_item_name']}    timeout=${wait_timeout['normally['short_timeout']']}
    common_web.Element should contain text    locator=${checkout_overview_page_locator['txt_item_name']}    expected_text=${item_name}

Click finish button and wait next page
    [Documentation]    Click finish button and next page should be checkout complete page
    common_web.Click element and wait    locator=${checkout_overview_page_locator['btn_finish']}    
    ...    wait_element_locator=${checkout_complete_page_locator['txt_page_title']}    
    ...    timeout=${wait_timeout['normally['short_timeout']']}

Click cancel button and wait main page
    [Documentation]    Click Cancel button and next page should be main page
    common_web.Click element and wait    locator=${checkout_overview_page_locator['btn_cancel']}    
    ...    wait_element_locator=${product_list_page_locator['txt_title']}    
    ...    timeout=${wait_timeout['normally['short_timeout']']}

Compare total price
    [Documentation]    Compare page total price and actual total price
    [Arguments]    ${items_price}
    ${tax_element_text}=    SeleniumLibrary.Get Text    locator=${checkout_overview_page_locator['txt_tax']}
    ${clean_tax_str}=    String.Replace String    string=${tax_element_text}    search_for=$    replace_with=${EMPTY}
    ${expected_total_float}=    BuiltIn.Evaluate    round(${items_price} + float('${clean_tax_str}'), 2)
    ${page_total_text}=    SeleniumLibrary.Get Text    locator=${checkout_overview_page_locator['txt_item_total_price']}
    ${clean_page_total_str_1}=    String.Replace String    string=${page_total_text}    search_for=$    replace_with=${EMPTY}
    ${clean_page_total_str_2}=    String.Strip String    string=${clean_page_total_str_1}
    ${page_total_float}=    BuiltIn.Evaluate    float('${clean_page_total_str_2}')
    BuiltIn.Should Be Equal As Numbers    ${page_total_float}    ${expected_total_float}

Get all product price
    [Documentation]    Sum of every product price
    ${price_elements}=    SeleniumLibrary.Get WebElements    locator=${checkout_overview_page_locator['txt_item_prices']}
    ${total_sum}=    BuiltIn.Set Variable    0.0
    FOR    ${element}    IN    @{price_elements}
        ${price_text}=    common_web.Get element text    locator=${element}
        ${clean_price_str}=    String.Replace String    string=${price_text}    search_for=$    replace_with=${EMPTY}
        ${new_total}=    BuiltIn.Evaluate    ${total_sum} + float('${clean_price_str}')
        ${total_sum}=    BuiltIn.Set Variable    ${new_total}
    END
    RETURN    ${total_sum}