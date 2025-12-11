*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Check page title
    [Documentation]    Check if page title display the correct text or not
    [Arguments]    ${timeout}
    common_web.Wait for element is ready    ${customer_information_page_locator.page_title}    ${timeout}
    common_web.Element should contain text    ${customer_information_page_locator.page_title}    Checkout: Your Information

Input fist name
    [Documentation]    Input first name value in first name input field
    [Arguments]    ${first_name}
    common_web.Input text and verify    ${customer_information_page_locator.txt_first_name}    ${first_name}

Input last name
    [Documentation]    Input first name value in last name input field
    [Arguments]    ${last_name}
    common_web.Input text and verify    ${customer_information_page_locator.txt_last_name}    ${last_name}

Input zip/postal code
    [Documentation]    Input first name value in zip/postal code input field
    [Arguments]    ${zip_code}
    common_web.Input text and verify    ${customer_information_page_locator.txt_zip_code}    ${zip_code}

CLick continue btn and check page
    [Documentation]    Click Continue button and next page should contain locator
    [Arguments]    ${wait_element_locator}    ${timeout}
    common_web.Click element and wait    ${customer_information_page_locator.continue_btn}    ${wait_element_locator}    ${timeout}

CLick cancel btn and check page
    [Documentation]    Click Cancel button and next page should contain locator
    [Arguments]    ${wait_element_locator}    ${timeout}
    common_web.Click element and wait    ${customer_information_page_locator.cancel_btn}    ${wait_element_locator}    ${timeout}

Error popup
    [Documentation]    Check if popup with error message appear correctly or not
    [Arguments]    ${message}    ${timeout}
    common_web.Wait for element is ready    ${customer_information_page_locator.error_div}    ${timeout}
    common_web.Element should contain text    ${customer_information_page_locator.error_div}    ${message}