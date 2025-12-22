*** Settings ***
Resource    ${CURDIR}/../../../resources/import.resource
Test Teardown    common_web.Close all browser

*** Test Cases ***
TS_04005_005
    [Documentation]    สั่งซื้อสินค้า 1 ชิ้นแต่ยกเลิกการสั่งซื้อโดยใช้ บัญชีผู้ใช้ visual_user
    [Tags]    F_0004    TS_04005    TS_04005_005    cancel_checkout    visual_user
    # เปิดหน้า login และตรวจสอบหน้า login เปิดสำเร็จ
    login_feature.Open website and login with username and password
    ...    username=${account['visual_user']['username']}
    ...    password=${account['visual_user']['password']}
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
    # ตรวจสอบว่าอยู่หน้า customer information กรอกข้อมูลครบแล้วไปยังหน้า checkout overview
    customer_information_feature.Input every fields and proceed to checkout overview page
    # ยกเลิกการสั่งซื้อสินค้า
    checkout_overview_feature.Cancel checkout process