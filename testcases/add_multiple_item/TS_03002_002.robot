*** Settings ***
Resource    ${CURDIR}/../../resources/import.resource
Test Teardown    common_web.Close all browser

*** Test Cases ***
TS_03002_002
    [Documentation]    เพิ่มสินค้าทุกชิ้นลงตะกร้าโดยใช้ บัญชีผู้ใช้ problem_user
    [Tags]    F_0003    TS_03002    TS_03002_002    add_multiple_item     problem_user 
    # เปิดหน้า login และตรวจสอบหน้า login เปิดสำเร็จ
    login_feature.Open login page and login to product list page    
    ...    username=${account['problem_user']['username']}
    ...    password=${account['problem_user']['password']}
    # ตรวจสอบว่าอยู่หน้า product list สำเร็จ
    product_list_page.Check product list page title
    # เพิ่มสินค้าทุกชิ้นลงตะกร้า
    product_list_feature.Add multiple products to cart    product_key=${normal_product}
    # ตรวจสอบว่าอยู่หน้า cart สำเร็จ
    cart_feature.Click cart icon to go to cart page and check cart page title
    # ตรวจสอบรายละเอียดสินค้าที่เพิ่มมาที่ตะกร้า
    cart_feature.Verify Multiple Items In Cart    product_key=${normal_product}