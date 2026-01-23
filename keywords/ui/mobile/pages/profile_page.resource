*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Tap home button
    [Documentation]    สัมผัสปุ่มโฮมสินค้าเพื่อกลับสู่หน้าแรก
    common_mobile.Tap element when ready    locator=${profile_page_locator['btn_home']}

Tap login button
    [Documentation]    สัมผัสปุ่มเข้าสู่ระบบเพื่อเข้าสู่หน้าเข้าสู่ระบบ
    common_mobile.Tap element when ready    locator=${profile_page_locator['btn_login']}