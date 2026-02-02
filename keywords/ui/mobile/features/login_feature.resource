*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Choose login with google
    [Documentation]    เลือกวิธีเข้าสู่ระบบด้วย account google
    login_page.Tap login with google account button
