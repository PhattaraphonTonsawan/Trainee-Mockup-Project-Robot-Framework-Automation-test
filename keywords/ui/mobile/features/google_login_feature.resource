*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Login with gmail account and verify fingerprint popup is visible
    [Documentation]    เลือก account ที่ต้องการและเข้าสู่หน้าแสกนลายนิ้วมือ
    google_login_page.Select google account
    google_login_page.Check fingerprint enable popup

Tap accept in fingerprint page and verify passkey page title
    [Documentation]    กดปุ่มตกลงที่หน้าสแกนลายนิ้วมือและไปที่หน้า passkey
    google_login_page.Tap accept fingerprint pop up
    BuiltIn.Run Keyword And Ignore Error    google_login_page.Check quick login title in passkey page