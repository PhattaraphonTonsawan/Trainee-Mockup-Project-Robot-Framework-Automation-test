*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Handle fingerprint popup and passkey page
    [Documentation]    กดปุ่มตกลงที่หน้าสแกนลายนิ้วมือและไปที่หน้า passkey
    BuiltIn.Run Keyword And Ignore Error    google_login_page.Check fingerprint enable popup
    BuiltIn.Run Keyword And Ignore Error    google_login_page.Tap accept fingerprint pop up
    BuiltIn.Run Keyword And Ignore Error    google_login_page.Check quick login title in passkey page
    BuiltIn.Run Keyword And Ignore Error    google_login_page.Tap return button in passkey page

Tap login button and check login page title
    [Documentation]    กดปุ่มเข้าสู่ระบบเพื่อไปที่หน้าเข้าสู่ระบบ
    profile_page.Tap login button    button_name=${txt_login_page['txt_title']}
    login_page.Check page title