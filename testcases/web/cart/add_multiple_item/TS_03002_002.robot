*** Settings ***
Resource    ${CURDIR}/../../../resources/import.resource
Test Teardown    common_web.Close all browser

*** Test Cases ***
TS_03002_002
    [Documentation]    เพิ่มสินค้าหลายชิ้นลงตะกร้าโดยใช้ บัญชีผู้ใช้ problem_user
    [Tags]    F_0003    TS_03002    TS_03002_002    add_multiple_item     problem_user
    # เปิดหน้า login และตรวจสอบหน้า login เปิดสำเร็จ
    login_feature.Open website and login with username and password
    ...    username=${account['problem_user']['username']}
    ...    password=${account['problem_user']['password']}
    # ตรวจสอบว่าอยู่หน้า product list สำเร็จ
    product_list_page.Check product list page title
    # เพิ่มสินค้าหลายชิ้นลงตะกร้า
    @{product_name}=    product_list_feature.Add products to cart    target_product_keys=@{product}
    # ตรวจสอบว่าอยู่หน้า cart สำเร็จ
    cart_feature.Click cart button and verify page loaded
    # ตรวจสอบรายละเอียดสินค้าที่เพิ่มมาที่ตะกร้าในกรณีไม่สามารถเพิ่มสินค้าได้ครบ
    cart_feature.Verify items in cart should fail   multiple_item_list=${product_name}