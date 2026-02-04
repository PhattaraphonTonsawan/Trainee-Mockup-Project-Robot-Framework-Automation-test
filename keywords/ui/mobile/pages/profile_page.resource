*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Tap home button
    [Documentation]    สัมผัสปุ่มโฮมเพื่อกลับสู่หน้าแรก
    [Arguments]    ${button_name}
    ${replace_locator}=    common_mobile.Replace locator and wait until element visible
    ...    locator=${home_page_locator['btn_navbar']}
    ...    replace_text=${button_name}
    common_mobile.Tap element when ready    locator=${replace_locator}

Tap login button
    [Documentation]    สัมผัสปุ่มเข้าสู่ระบบเพื่อเข้าสู่หน้าเข้าสู่ระบบ
    [Arguments]    ${button_name}
    ${replace_locator}=    common_mobile.Replace locator and wait until element visible
    ...    locator=${profile_page_locator['btn_login']}
    ...    replace_text=${button_name}
    common_mobile.Tap element when ready    locator=${replace_locator}