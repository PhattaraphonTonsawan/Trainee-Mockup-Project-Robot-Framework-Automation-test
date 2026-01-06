*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Check page title
    [Documentation]
    common_mobile.Swipe into element and wait until element ready    locator=${login_page_locator['txt_page_title']}

Click login button
    [Documentation]
    common_mobile.Swipe into element and wait until element ready    locator=${login_page_locator['btn_login']}
    common_mobile.Click element when ready    locator=${login_page_locator['btn_login']}

Click login with gmail button
    [Documentation]
    common_mobile.Swipe into element and wait until element ready    locator=${login_page_locator['btn_google_login']}
    common_mobile.Click element when ready    locator=${login_page_locator['btn_google_login']}

Click register button
    [Documentation]
    common_mobile.Swipe into element and wait until element ready    locator=${login_page_locator['btn_register']}
    common_mobile.Click element when ready    locator=${login_page_locator['btn_register']}

Iput password
    [Documentation]
    [Arguments]    ${password}
    common_mobile.Swipe into element and wait until element ready    locator=${login_page_locator['txt_password_input']}
    common_mobile.Input text when ready    locator=${login_page_locator['txt_password_input']}    text=${password}

Input username
    [Documentation]
    [Arguments]    ${username}
    common_mobile.Swipe into element and wait until element ready    locator=${login_page_locator['txt_user_input']}
    common_mobile.Input text when ready    locator=${login_page_locator['txt_user_input']}    text=${username}