*** Settings ***
Resource    ${CURDIR}/../../../resources/import.resource
Test Teardown    common_web.Close all browser

*** Test Cases ***
TS_04001_001
    [Documentation]    สั่งซื้อสินค้าได้ 1 ชิ้นสำเร็จโดยใช้ บัญชีผู้ใช้ standard_user
    [Tags]    F_0004    TS_04001    TS_04001_001    checkout_1_item    standard_users
    # เปิดหน้า login และตรวจสอบหน้า login เปิดสำเร็จ
    login_feature.Open website and login with username and password
    ...    username=${account['standard_user']['username']}
    ...    password=${account['standard_user']['password']}
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
    # ตรวจสอบว่าอยู่หน้า customer information กรอกข้อมูลครบแล้วไปยังหน้า checkout overview
    customer_information_feature.Input every fields and proceed to checkout overview page
    # ตรวจสอบว่าอยู่หน้า checkout overview และสามารถ checkout ได้สำเร็จด้วยสินค้า 1 ชิ้น
    checkout_overview_feature.Confirm checkout with all item    @{product_list}
    # สามารถ checkout ได้สำเร็จและกลับมาที่หน้า product list ได้สำเร็จ
    checkout_complete_feature.Complete checkout and go to product list page