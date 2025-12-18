*** Settings ***
Resource    ${CURDIR}/../../../resources/import.resource
Test Teardown    common_web.Close all browser

*** Test Cases ***
TS_03001_005
    [Documentation]    เพิ่มสินค้าหนึ่งชิ้นลงตะกร้าโดยใช้ บัญชีผู้ใช้ visual_user
    [Tags]    F_0003    TS_03001    TS_03001_005    add_single_item     visual_user
    # เปิดหน้า login และตรวจสอบหน้า login เปิดสำเร็จ
    login_feature.Open website and login with username and password
    ...    username=${account['visual_user']['username']}
    ...    password=${account['visual_user']['password']}
    # ตรวจสอบว่าอยู่หน้า product list สำเร็จ
    product_list_page.Check product list page title
    # เพิ่มสินค้าหนึ่งชิ้นลงตะกร้า
    @{product_name}=    product_list_feature.Add products to cart
    ...    target_product_keys=${testdata['ts_03001']['test_product']}
    # ตรวจสอบว่าอยู่หน้า cart สำเร็จ
    cart_feature.Click cart button and verify page loaded
    # ตรวจสอบรายละเอียดสินค้าที่เพิ่มมาที่ตะกร้า
    cart_feature.Verify items in cart   multiple_item_list=${product_name}