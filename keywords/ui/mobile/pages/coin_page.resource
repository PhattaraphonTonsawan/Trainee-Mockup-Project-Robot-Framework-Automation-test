*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Click checkin button
    [Documentation]    กดปุ่มเช็คอินเพื่อรับเหรียญ
    common_mobile.Swipe into element and wait until element ready    locator=${coin_page_locator['btn_checkin']}
    common_mobile.Click element when ready    locator=${coin_page_locator['btn_checkin']}

Check coin total
    [Documentation]    ตรวจสอบว่าชื่อหน้า หรือยอดรวมเหรียญแสดงผล
    common_mobile.Swipe into element and wait until element ready    locator=${coin_page_locator['lbl_coin_total']}

Verify coins value
    [Documentation]    ตรวจสอบว่าจำนวนเหรียญเท่ากับค่าที่คาดหวังหรือไม่
    [Arguments]    ${expected_value}
    common_mobile.Swipe into element and wait until element ready    locator=${coin_page_locator['lbl_coin_total']}
    common_mobile.Wait and verify element value    locator=${coin_page_locator['lbl_coin_total']}    expected_value=${expected_value}