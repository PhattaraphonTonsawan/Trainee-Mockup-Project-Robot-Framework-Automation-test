*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Click login button and wait for product list page loaded
    [Documentation]    กดปุ่ม Login และรอจนกว่าหน้า Product List จะโหลดเสร็จ จากนั้นตรวจสอบชื่อหน้าว่าถูกต้อง
    login_page.Click login button
    product_list_page.Wait until page loaded
    product_list_page.Check product list page title

Click login button and wait for login error message
    [Documentation]    กดปุ่ม Login และรอจนกว่าหน้า login จะแสดงข้อความ error 
    login_page.Click login button
    product_list_page.Wait until page loaded
    login_page.Wait until login error message appears

Input username and verify value in username box
    [Documentation]    กรอกชื่อผู้ใช้ลงในช่อง Username และตรวจสอบว่าค่าที่กรอกถูกต้อง
    [Arguments]    ${username}
    login_page.Input username    username=${username}
    login_page.Verify value in username box    username=${username}

Input password and verify value in password box
    [Documentation]    กรอกรหัสผ่านลงในช่อง Password และตรวจสอบว่าค่าที่กรอกถูกต้อง
    [Arguments]    ${password}
    login_page.Input password    password=${password}
    login_page.Verify value in password box    password=${password}

Open login page and login to product list page
    [Documentation]    เปิดหน้า Login และเข้าสู่ระบบด้วย Username และ Password จากนั้นไปยังหน้า Product List
    [Arguments]    ${username}    ${password}
    Open login page and wait until page loaded
    Input username and verify value in username box    username=${username}
    Input password and verify value in password box    password=${password}
    Click login button and wait for product list page loaded

Open login page and wait until page loaded
    [Documentation]    เปิดหน้า Login และรอจนกว่าหน้าจะโหลดเสร็จ จากนั้นตรวจสอบชื่อหน้า Login
    login_page.Open login page
    login_page.Wait until page loaded
    login_page.Check login page title

Wait until login element is ready
    [Documentation]    รอจนกว่า element ทั้งหมดบนหน้า Login (Username, Password, Login Button) พร้อมให้ใช้งาน
    login_page.Wait until username box is ready
    login_page.Wait until password box is ready
    login_page.Wait until login button is ready
