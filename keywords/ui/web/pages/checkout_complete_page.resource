*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Check page title
    [Documentation]    Check if page title display the correct text or not
    common_web.Wait for element is ready    locator=${checkout_complete_page_locator['txt_page_title']}    timeout=${wait_timeout['normally['short_timeout']']}
    common_web.Element should contain text    locator=${checkout_complete_page_locator['page_title']}    expected_text=${txt_checkout_complete_page['txt_title']}

Check thank you message
    [Documentation]    Check if thank you message display or not
    common_web.Wait for element is ready    locator=${checkout_complete_page_locator['txt_thank_you']}    timeout=${wait_timeout['normally['short_timeout']']}
    common_web.Element should contain text    locator=${checkout_complete_page_locator['txt_thank_you']}    expected_text=${txt_checkout_complete_page['txt_thankyou']}

Click back to home page
    [Documentation]    Click back home button and next page should be main page
    common_web.Click element and wait    locator=${checkout_complete_page_locator['btn_back_home']}    
    ...    wait_element_locator=${product_list_page_locator['txt_title']}    
    ...    timeout=${wait_timeout['normally['short_timeout']']}