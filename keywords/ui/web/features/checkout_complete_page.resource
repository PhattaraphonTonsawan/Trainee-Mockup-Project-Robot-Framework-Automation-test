*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Check page title
    [Documentation]    Check if page title display the correct text or not
    [Arguments]    ${timeout}
    common_web.Wait for element is ready    ${checkout_complete_page_locator.page_title}    ${timeout}
    common_web.Element should contain text    ${checkout_complete_page_locator.page_title}    Checkout: Complete!

Check thank you message
    [Documentation]    Check if thank you message display or not
    [Arguments]    ${timeout}
    common_web.Wait for element is ready    ${checkout_complete_page_locator.thank_you_msg}    ${timeout}
    common_web.Element should contain text    ${checkout_complete_page_locator.thank_you_msg}    Thank you for your order!

CLick back home btn and check page
    [Documentation]    Click back home button and next page should contain locator
    [Arguments]    ${wait_element_locator}    ${timeout}
    common_web.Click element and wait    ${checkout_complete_page_locator.back_home_btn}    ${wait_element_locator}    ${timeout}