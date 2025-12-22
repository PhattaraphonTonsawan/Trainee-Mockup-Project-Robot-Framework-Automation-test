*** Settings ***
Resource    ${CURDIR}/../../resources/import.resource
Test Teardown    common_web.Close all browser

*** Test Cases ***
TS_02003_001
    [Documentation]    ทดสอบการจัดเรียงการแสดงผลของ Product โดยเรียงตาม ราคาสินค้าจาก ราคาต่ำ ไป ราคาสูง
    [Tags]    F_0002    TS_02003    TS_02003_001    sorting    standard_user
    # เปิดหน้า login และตรวจสอบหน้า login เปิดสำเร็จ
    login_feature.Open website and login with username and password
    ...    username=${account['standard_user']['username']}
    ...    password=${account['standard_user']['password']}
    # ตรวจสอบว่าอยู่หน้า product list สำเร็จ
    product_list_page.Check product list page title
    # กดเลือก Dropdown Sort Name (A to Z)
    product_list_page.Select sort type option    option=${dropdown_list['price_lo_to_hi']}
    # ตรวจสอบความถูกของการ sort
    product_list_feature.Verfiy products are sorted by price from low to high