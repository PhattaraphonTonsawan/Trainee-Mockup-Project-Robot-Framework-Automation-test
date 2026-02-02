*** Settings ***
Resource    ${CURDIR}/../../../resources/import.resource
Test Teardown    common_web.Close all browser

*** Test Cases ***
TS_03003_003
    [Documentation]    ทดสอบลบสินค้าออกจากตะกร้า 1 ชิ้นโดยใช้บัญชี  performance_glitch_user
    [Tags]    F_0003    TS_03003    TS_03003_003    remove_single_item    performance_glitch_user
    # เปิดหน้า login และตรวจสอบหน้า login เปิดสำเร็จ
    login_feature.Open website and login with username and password
    ...    username=${account['performance_glitch_user']['username']}
    ...    password=${account['performance_glitch_user']['password']}
    # ตรวจสอบว่าอยู่หน้า product list สำเร็จ
    product_list_page.Check product list page title
    # เพิ่มสินค้าหนึ่งชิ้นลงตะกร้า
    @{product_name}=    product_list_feature.Add products to cart
    ...    target_product_keys=${testdata['ts_03001']['test_product']}
    # ตรวจสอบว่าอยู่หน้า cart สำเร็จ และ ตรวจสอบรายละเอียดสินค้าที่เพิ่มมาที่ตะกร้า
    cart_feature.Click cart button and verify page loaded
    cart_feature.Verify items in cart    multiple_item_list=@{product_name}
    # ลบรายการสินค้าที่เพิ่มออกจากตะกร้า
    cart_page.Click remove one item from cart    product_name=${product['sauce_labs_backpack']['product_name']}
    # ตรวจสอบตะกร้าว่างเปล่า
    cart_page.Verify the cart is empty