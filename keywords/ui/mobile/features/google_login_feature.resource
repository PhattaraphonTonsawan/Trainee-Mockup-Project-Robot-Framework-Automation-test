*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Complete login process
    [Documentation]    ทำการเข้าสู่ระบบด้วยบัญชี google สำเร็จ
    google_login_page.Select google account
    google_login_page.Tap accept fingerprint pop up
    google_login_page.Tap return button in passkey page