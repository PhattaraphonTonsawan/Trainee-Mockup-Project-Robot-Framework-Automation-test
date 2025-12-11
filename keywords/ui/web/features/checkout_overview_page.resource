*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Check page title
    [Documentation]    Check if page title display the correct text or not
    [Arguments]    ${timeout}
    common_web.Wait for element is ready    ${checkout_overview_page_locator.page_title}    ${timeout}
    common_web.Element should contain text    ${checkout_overview_page_locator.page_title}    Checkout: Your Information

Check product item title
    [Documentation]    Check product title in page
    [Arguments]    ${timeout}    ${item_name}
    common_web.Wait for element is ready    ${checkout_overview_page_locator.item_name}    ${timeout}
    common_web.Element should contain text    ${checkout_overview_page_locator.item_name}    ${item_name}

CLick finish btn and check page
    [Documentation]    Click finish button and next page should contain locator
    [Arguments]    ${wait_element_locator}    ${timeout}
    common_web.Click element and wait    ${checkout_overview_page_locator.finish_btn}    ${wait_element_locator}    ${timeout}

CLick cancel btn and check page
    [Documentation]    Click Cancel button and next page should contain locator
    [Arguments]    ${wait_element_locator}    ${timeout}
    common_web.Click element and wait    ${checkout_overview_page_locator.cancel_btn}    ${wait_element_locator}    ${timeout}

Compare total price
    [Documentation]    Compare page total price and actual total price
    [Arguments]    ${items_price}
    ${clean_tax}=    BuiltIn.Evaluate    '${checkout_overview_page_locator.tax}'.replace('$', '')
    ${total_price}=    BuiltIn.Evaluate    ${items_price} + ${clean_tax}
    ${Actual_total_price}=    BuiltIn.Catenate    $    ${total_price}
    common_web.Element should contain text    ${checkout_overview_page_locator.item_total_price}    ${Actual_total_price}

Get all product price
    [Documentation]    Sum of every product price
    ${price_elements}=    SeleniumLibrary.Get WebElements    ${checkout_overview_page_locator.item_prices}
    ${total_sum}=    BuiltIn.Set Variable    0.0
    FOR    ${element}    IN    @{price_elements}
        ${price_text}=    common_web.Get element text    ${element}
        ${clean_price}=    BuiltIn.Evaluate    '${price_text}'.replace('$', '')
        ${new_total}=    BuiltIn.Evaluate    ${total_sum} + ${clean_price}
        ${total_sum}=    Set Variable    ${new_total}
    END
    RETURN    ${total_sum}