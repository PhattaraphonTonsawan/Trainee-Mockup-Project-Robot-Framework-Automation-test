*** Settings ***
Resource    ${CURDIR}/../../resources/import.resource
Test Teardown    common_web.Close all browser

*** Test Cases ***
TS_02002_001
    [Documentation]    ทดสอบการจัดเรียงการแสดงผลของ Product โดยเรียงตาม ชื่อสินค้าตามตัวอักษรภาษาอังกฤษจาก Z ไป A
    [Tags]    F_0002    TS_02002    TS_02002_001    sorting    standard_user
    # เปิดหน้า login และตรวจสอบหน้า login เปิดสำเร็จ
    login_feature.Open website and login with username and password
    ...    username=${account['standard_user']['username']}
    ...    password=${account['standard_user']['password']}
    # ตรวจสอบว่าอยู่หน้า product list สำเร็จ
    product_list_page.Check product list page title
    # กดเลือก Dropdown Sort Name (A to Z)
    product_list_page.Select sort type option    option=${dropdown_list['z_to_a']}
    # ตรวจสอบความถูกของการ sort
    product_list_feature.Verify products are sorted by name from z to a