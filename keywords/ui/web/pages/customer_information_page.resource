*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Check page title
    [Documentation]    Check if page title display the correct text or not
    common_web.Wait for element is ready    locator=${customer_information_page_locator['txt_page_title']}    timeout=${wait_timeout['normally['short_timeout']']}
    common_web.Element should contain text    locator=${customer_information_page_locator['txt_page_title']}    expected_text=${txt_customer_infomation_page['txt_title']}

Click continue button and check page
    [Documentation]    Click Continue button and next page should contain locator
    [Arguments]    ${wait_element_locator}
    common_web.Click element and wait    locator=${customer_information_page_locator['btn_continue']}    wait_element_locator=${wait_element_locator}    timeout=${wait_timeout['normally['short_timeout']']}

Click cancel button and check page
    [Documentation]    Click Cancel button and next page should contain locator
    [Arguments]    ${wait_element_locator}
    common_web.Click element and wait    locator=${customer_information_page_locator['btn_cancel']}    wait_element_locator=${wait_element_locator}    timeout=${wait_timeout['normally['short_timeout']']}

Input fist name
    [Documentation]    Input first name value in first name input field
    [Arguments]    ${first_name}
    common_web.Input text and verify    locator=${customer_information_page_locator['txt_first_name']}    text=${first_name}

Input last name
    [Documentation]    Input first name value in last name input field
    [Arguments]    ${last_name}
    common_web.Input text and verify    locator=${customer_information_page_locator['txt_last_name']}    text=${last_name}

Input zip/postal code
    [Documentation]    Input first name value in zip/postal code input field
    [Arguments]    ${zip_code}
    common_web.Input text and verify    locator=${customer_information_page_locator['txt_zip_code']}    text=${zip_code}