*** Settings ***
Resource    ${CURDIR}/../../resources/import.resource
Test Teardown    common_web.Close all browser

*** Test Cases ***
TS_04001_001
    [Documentation]    สั่งซื้อสินค้าได้ 1 ชิ้นสำเร็จโดยใช้ บัญชีผู้ใช้ standard_user
    [Tags]    F_0004    T4_03001    TS_04001_001    checkout_1_item     standard_user  
    # เปิดหน้า login และตรวจสอบหน้า login เปิดสำเร็จ
    login_feature.Open login page and login to product list page    
    ...    username=${account['standard_user']['username']}
    ...    password=${account['standard_user']['password']}
    # ตรวจสอบว่าอยู่หน้า product list สำเร็จ
    product_list_page.Check product list page title
    # เพิ่มสินค้าหนึ่งชิ้นลงตะกร้า
    product_list_feature.Add one item to cart    product_name=${product['backpack']['product_name']}
    # ตรวจสอบว่าอยู่หน้า cart สำเร็จ
    cart_feature.Click cart icon to go to cart page and check cart page title
    # ตรวจสอบรายละเอียดสินค้าที่เพิ่มมาที่ตะกร้า
    cart_feature.Verify one item detail at cart page    product=${product['backpack']}
    # ไปที่หน้า customer information
    cart_page.Click go to checkout button
    # ตรวจสอบว่าอยู่หน้า กรอกข้อมูลครบแล้วไปยังหน้า checkout overview
    customer_information_feature.Input every fields and proceed to checkout overview page
