*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Click login button on profile page
    [Documentation]    กดปุ่ม "เข้าสู่ระบบ" ที่อยู่บนหน้า Profile (หน้าฉัน)
    common_mobile.Swipe into element and wait until element ready    locator=${profile_page_locator['btn_login']}
    common_mobile.Click element when ready    locator=${profile_page_locator['btn_login']}