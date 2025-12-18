*** Settings ***
Resource    ${CURDIR}/../../../resources/import.resource
Test Teardown    common_web.Close all browser

*** Test Cases ***
TS_04001_002
    [Documentation]    สั่งซื้อสินค้าได้ 1 ชิ้นไม่สำเร็จโดยใช้ บัญชีผู้ใช้ problem_user
    [Tags]    F_0004    TS_04001    TS_04001_002    checkout_1_item    problem_user
    # เปิดหน้า login และตรวจสอบหน้า login เปิดสำเร็จ
    login_feature.Open website and login with username and password
    ...    username=${account['problem_user']['username']}
    ...    password=${account['problem_user']['password']}
    # ตรวจสอบว่าอยู่หน้า product list สำเร็จ
    product_list_page.Check product list page title
    # เพิ่มสินค้าหนึ่งชิ้นลงตะกร้า
    @{product_list}=    product_list_feature.Add products to cart
    ...    target_product_keys=${testdata['ts_04001']['test_product']}
    # ตรวจสอบว่าอยู่หน้า cart สำเร็จ
    cart_feature.Click cart button and verify page loaded
    # ตรวจสอบรายละเอียดสินค้าที่เพิ่มมาที่ตะกร้า
    cart_feature.Verify items in cart    multiple_item_list=${product_list}
    # ไปที่หน้า customer information
    cart_page.Click go to checkout button
    # ตรวจสอบว่าอยู่หน้า customer information กรอกข้อมูลครบแต่นามสกุลไม่ขึ้นในช่องกรอกนามสกุลและขึ้น error
    customer_information_feature.Input every fields and last name error