*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Tap login button and check login page title
    [Documentation]    กดปุ่มเข้าสู่ระบบเพื่อไปที่หน้าเข้าสู่ระบบ
    profile_page.Tap login button    button_name=${txt_login_page['txt_title']}
    login_page.Check page title