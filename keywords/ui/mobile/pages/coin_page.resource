*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Click checkin button
    [Documentation]
    common_mobile.Swipe into element and wait until element ready    locator=${coin_page_locator['btn_checkin']}
    common_mobile.Click element when ready    locator=${coin_page_locator['btn_checkin']}

Check page title
    [Documentation]
    common_mobile.Swipe into element and wait until element ready    locator=${coin_page_locator['lbl_coin_total']}

Verify coins value
    [Documentation]
    [Arguments]    ${expected value}
    common_mobile.Swipe into element and wait until element ready    locator=${coin_page_locator['lbl_coin_total']}
    common_mobile.Wait and verify element value    locator=${coin_page_locator['lbl_coin_total']}    expected_value=${expected value}