*** Settings ***
Resource    ${CURDIR}/../../resources/import.resource
Test Teardown    common_web.Close all browser

*** Test Cases ***
TS_03001_004
    [Documentation]    เพิ่มสินค้าหนึ่งชิ้นลงตะกร้าโดยใช้ บัญชีผู้ใช้ error_user
    [Tags]    F_0003    TS_03001    TS_03001_004    add_single_item     error_user  
    # เปิดหน้า login และตรวจสอบหน้า login เปิดสำเร็จ
    login_feature.Open login page and login to product list page    
    ...    username=${account['error_user']['username']}
    ...    password=${account['error_user']['password']}
    # ตรวจสอบว่าอยู่หน้า product list สำเร็จ
    product_list_page.Check product list page title
    # เพิ่มสินค้าหนึ่งชิ้นลงตะกร้า
     ${product_name}=    product_list_feature.Add one item to cart    product_name=${product['Sauce Labs Backpack']['product_name']}
    # ตรวจสอบว่าอยู่หน้า cart สำเร็จ
    cart_feature.Click cart icon to go to cart page and check cart page title
    # ตรวจสอบรายละเอียดสินค้าที่เพิ่มมาที่ตะกร้า
    cart_feature.Verify one item detail at cart page    product=${product['${product_name}']}