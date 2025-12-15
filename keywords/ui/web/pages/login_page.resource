*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Check login page title
    [Documentation]    ตรวจสอบว่าชื่อหน้าล็อกอินถูกต้องตามที่คาดหวัง
    common_web.Check element text when visible
    ...    locator=${login_page_locator['txt_title']}
    ...    text=${txt_login_page['txt_title']}

Click login button
    [Documentation]    กดปุ่ม Login บนหน้า Login
    common_web.Click element when ready    locator=${login_page_locator['btn_login']}

Input username
    [Documentation]    กรอก Username บนหน้า Login
    [Arguments]    ${username}
    common_web.Input text when ready    locator=${login_page_locator['txt_username']}    text=${username}

Input password
    [Documentation]    กรอก Password บนหน้า Login
    [Arguments]    ${password}
    common_web.Input text when ready    locator=${login_page_locator['txt_password']}    text=${password}

Open login page
    [Documentation]    เปิดหน้า Login ด้วย URL ที่กำหนด
    common_web.Open web browser and maximize window    url=${web_url['login_page']}

Verify value in username box
    [Documentation]    ตรวจสอบค่าที่กรอกในช่อง Username ว่าตรงกับค่าที่คาดหวังหรือไม่
    [Arguments]    ${username}
    common_web.Wait and verify element value
    ...    locator=${login_page_locator['txt_username']}
    ...    expected_value=${username}

Verify value in password box
    [Documentation]    ตรวจสอบค่าที่กรอกในช่อง Password ว่าตรงกับค่าที่คาดหวังหรือไม่
    [Arguments]    ${password}
    common_web.Wait and verify element value
    ...    locator=${login_page_locator['txt_password']}
    ...    expected_value=${password}

Wait until username box is ready
    [Documentation]    รอจนกว่าช่อง Username จะพร้อมให้ใช้งาน
    common_web.Scroll into element and wait until element visible    locator=${login_page_locator['txt_username']}

Wait until page loaded
    [Documentation]    รอจนกว่าหน้า Login จะโหลดเสร็จและ element หลักปรากฏ
    common_web.Scroll into element and wait until element visible    locator=${login_page_locator['txt_title']}

Wait until password box is ready
    [Documentation]    รอจนกว่าช่อง Password จะพร้อมให้ใช้งาน
    common_web.Scroll into element and wait until element visible    locator=${login_page_locator['txt_password']}

Wait until login button is ready
    [Documentation]    รอจนกว่าปุ่ม Login จะพร้อมให้ใช้งาน
    common_web.Scroll into element and wait until element visible    locator=${login_page_locator['btn_login']}

Wait until login error message appears
    [Documentation]    ตรวจสอบว่าแสดงข้อความแจ้งเตือนเมื่อเกิดข้อผิดพลาดในการ Login
    common_web.Scroll into element and wait until element visible    locator=${login_page_locator['lbl_login_error']}
