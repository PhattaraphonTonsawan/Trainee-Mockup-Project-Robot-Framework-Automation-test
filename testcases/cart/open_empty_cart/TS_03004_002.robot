*** Settings ***
Resource    ${CURDIR}/../../../resources/import.resource
Test Teardown    common_web.Close all browser

*** Test Cases ***
TS_03004_002
    [Documentation]    เปิดตะกร้าตอนที่ตะกร้าว่างเปล่า โดยใช้บัญชี problem_user
    [Tags]    F_0003    TS_03004    TS_03004_002    open_empty_cart    problem_user
    # เปิดหน้า login และตรวจสอบหน้า login เปิดสำเร็จ
    login_feature.Open website and login with username and password
    ...    username=${account['problem_user']['username']}
    ...    password=${account['problem_user']['password']}
    # ตรวจสอบว่าอยู่หน้า product list สำเร็จ
    product_list_page.Check product list page title
    # ตรวจสอบว่าอยู่หน้า cart สำเร็จ
    cart_feature.Click cart button and verify page loaded
    # ตรวจสอบตะกร้าว่าง
    cart_page.Verify the cart is empty