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

CLick finish btn and check page
    [Documentation]    Click finish button and next page should contain locator
    [Arguments]    ${wait_element_locator}
    common_web.Click element and wait    locator=${checkout_overview_page_locator['btn_finish']}    wait_element_locator=${wait_element_locator}    timeout=${wait_timeout['normally['short_timeout']']}

CLick cancel btn and check page
    [Documentation]    Click Cancel button and next page should contain locator
    [Arguments]    ${wait_element_locator}
    common_web.Click element and wait    locator=${checkout_overview_page_locator['btn_cancel']}    wait_element_locator=${wait_element_locator}    timeout=${wait_timeout['normally['short_timeout']']}

Compare total price
    [Documentation]    Compare page total price and actual total price
    [Arguments]    ${items_price}
    ${clean_tax}=    BuiltIn.Evaluate    expression='${checkout_overview_page_locator['txt_tax']}'.replace('$', '')
    ${total_price}=    BuiltIn.Evaluate    expression=${items_price} + ${clean_tax}
    ${Actual_total_price}=    BuiltIn.Catenate    $    ${total_price}
    common_web.Element should contain text    locator=${checkout_overview_page_locator['txt_item_total_price']}    expected_text=${Actual_total_price}

Get all product price
    [Documentation]    Sum of every product price
    ${price_elements}=    SeleniumLibrary.Get WebElements    locator=${checkout_overview_page_locator['txt_item_prices']}
    ${total_sum}=    BuiltIn.Set Variable    0.0
    FOR    ${element}    IN    @{price_elements}
        ${price_text}=    common_web.Get element text    locator=${element}
        ${clean_price}=    BuiltIn.Evaluate    expression='${price_text}'.replace('$', '')
        ${new_total}=    BuiltIn.Evaluate    expression=${total_sum} + ${clean_price}
        ${total_sum}=    BuiltIn.Set Variable    ${new_total}
    END
    RETURN    ${total_sum}