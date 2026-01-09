*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Check login page title
    [Documentation]    ตรวจสอบว่าหัวข้อหน้า Login แสดงผลถูกต้อง
    common_mobile.Swipe into element and wait until element ready    locator=${login_page_locator['txt_page_title']}

Click login button
    [Documentation]    กดปุ่มเข้าสู่ระบบ (Login) บนหน้า Login Page
    common_mobile.Swipe into element and wait until element ready    locator=${login_page_locator['btn_login']}
    common_mobile.Click element when ready    locator=${login_page_locator['btn_login']}

Click login with gmail button
    [Documentation]    กดปุ่มเพื่อเข้าสู่ระบบด้วย Google/Gmail
    common_mobile.Swipe into element and wait until element ready    locator=${login_page_locator['btn_google_login']}
    common_mobile.Click element when ready    locator=${login_page_locator['btn_google_login']}

Click register button
    [Documentation]    กดปุ่มลงทะเบียนสมาชิกใหม่
    common_mobile.Swipe into element and wait until element ready    locator=${login_page_locator['btn_register']}
    common_mobile.Click element when ready    locator=${login_page_locator['btn_register']}

Input password
    [Documentation]    กรอกรหัสผ่านลงในช่อง Password
    [Arguments]    ${password}
    common_mobile.Swipe into element and wait until element ready    locator=${login_page_locator['txt_password_input']}
    common_mobile.Input text when ready    locator=${login_page_locator['txt_password_input']}    text=${password}

Input username
    [Documentation]    กรอกชื่อผู้ใช้ลงในช่อง Username
    [Arguments]    ${username}
    common_mobile.Swipe into element and wait until element ready    locator=${login_page_locator['txt_user_input']}
    common_mobile.Input text when ready    locator=${login_page_locator['txt_user_input']}    text=${username}

Click continue login with google
    [Documentation]    กดเลือกบัญชี Gmail ที่ต้องการ Login
    common_mobile.Swipe into element and wait until element ready    locator=${google_login_page_locator['btn_gmail']}
    common_mobile.Click element when ready    locator=${google_login_page_locator['btn_gmail']}