*** Settings ***
Resource    ${CURDIR}/../../resources/import.resource
Test Teardown    common_web.Close all browser

*** Test Cases ***
TS_01001_001
    [Documentation]    Verifies that the standard user can login and access the Product List page.
    [Tags]    F_0001    TS_01001    TS_01001_001    login    standard_user
    # เปิดหน้า login และตรวจสอบหน้า login เปิดสำเร็จ
    login_feature.Open login page and wait until page loaded
    # ตรวจสอบหน้า login element ต่างๆพร้อมใช้งาน
    login_feature.Wait until login element is ready
    # กรอก username และตรวจสอบ value หลังกรอก
    login_feature.Input username and verify value in username box
    ...    username=${account['standard_user']['username']}
    # กรอก password และตรวจสอบ value หลังกรอก
    login_feature.Input password and verify value in password box
    ...    password=${account['standard_user']['password']}
    # กดปุ่ม login และเปิดหน้า product list สำเร็จ
    login_feature.Click login button and wait for product list page loaded