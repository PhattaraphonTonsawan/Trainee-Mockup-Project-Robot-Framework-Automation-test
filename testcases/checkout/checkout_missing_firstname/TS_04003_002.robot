*** Settings ***
Resource    ${CURDIR}/../../../resources/import.resource
Test Teardown    common_web.Close all browser

*** Test Cases ***
TS_04003_002
    [Documentation]    สั่งซื้อสินค้าได้ 1 ชิ้นแต่ไม่กรอกชื่อจริงโดยใช้ บัญชีผู้ใช้ problem_user
    [Tags]    F_0004    TS_04003    TS_04003_002    checkout_missing_firstname    problem_user
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
    cart_page.Click checkout button
    # ตรวจสอบว่าอยู่หน้า customer information กรอกข้อมูลแค่นามสกุลและรหัสไปรษณีย์แต่ขึ้น error ไม่ใส่ชื่อจริง
    customer_information_feature.Verify error when lastname is missing