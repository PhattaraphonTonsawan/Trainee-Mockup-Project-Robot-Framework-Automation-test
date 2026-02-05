*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Handle fingerprint popup and passkey page
    [Documentation]    ตรวจสอบว่ามี Popup ลายนิ้วมือหรือไม่ ถ้ามีให้กดปุ่มตกลง และ ตรวจสอบว่ามีหน้า Passkey หรือไม่ถ้ามีให้กดปุ่มย้อนกลับ
    ${has_fingerprint}=    BuiltIn.Run Keyword And Return Status    google_login_page.Check fingerprint enable popup
    IF    ${has_fingerprint}
        google_login_page.Tap accept fingerprint pop up
    END
    ${has_passkey}=    BuiltIn.Run Keyword And Return Status    google_login_page.Check quick login title in passkey page
    IF    ${has_passkey}
        google_login_page.Tap return button in passkey page
    END

Tap login button and check login page title
    [Documentation]    กดปุ่มเข้าสู่ระบบเพื่อไปที่หน้าเข้าสู่ระบบ
    profile_page.Tap login button    button_name=${txt_login_page['txt_title']}
    login_page.Check page title

Select google account for login
    [Documentation]    เลือกลองชื่อเข้าใช้ด้วยบัญชี google จากนั้นทำการเลื่อนหาและกดเลือกบัญชี Google ที่มีอยู่ในเครื่องเพื่อเข้าสู่ระบบ
    login_page.Tap login with google account button
    google_login_page.Swipe to google account
    google_login_page.Select google account