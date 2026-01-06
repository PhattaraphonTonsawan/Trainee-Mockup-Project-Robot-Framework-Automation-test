*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Click gmail button
    [Documentation]
    common_mobile.Swipe into element and wait until element ready    locator=${google_login_page_locator['btn_gmail']}
    common_mobile.Click element when ready    locator=${google_login_page_locator['btn_gmail']}