*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Check login page title
    [Documentation]    Check login page title
    common_web.Element should contain text
    ...    locator=${login_page_locator['txt_title']}
    ...    expected_text=${txt_login_page['txt_title']}

Click login button when ready
    [Documentation]    Click login button on login page
    common_web.Wait for element is ready    locator=${login_page_locator['btn_login']}
    common_web.Click element and wait    locator=${login_page_locator['btn_login']}

Input username
    [Documentation]    Input username on login page
    [Arguments]    ${username}
    common_web.Input text and verify    locator=${login_page_locator['txt_username']}    text=${username}

Input password
    [Documentation]    Input password on login page
    [Arguments]    ${password}
    common_web.Input text and verify    locator=${login_page_locator['txt_password']}    text=${password}

Open login page
    [Documentation]    Open login page URL
    common_web.Open new browser    url=${web_url['login_page']}    browser=${browser_type}

Wait until login error message appears
    [Documentation]    Check alert when login error
    common_web.Wait for element is ready    locator=${login_page_locator['lbl_login_error']}
    