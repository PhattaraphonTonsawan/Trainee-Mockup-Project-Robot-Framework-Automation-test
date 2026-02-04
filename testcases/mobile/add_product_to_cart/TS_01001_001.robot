*** Settings ***
Resource    ${CURDIR}/../../../resources/import.resource

*** Test Cases ***
TS_01001_001
    [Documentation]    ทดสอบการทำการสั่งซื้อสินค้า 1 ชิ้น แล้วมาที่หน้าแสดงหน้าทำการสั่งซื้อ ด้วยการเข้าสู่ระบบด้วย บัญชี google 
    [Tags]    F_0001    TS_01001    TS_01001_001    add_product_then_checkout    mobile
    # Step 1: เปิดแอปพลิเคชัน Shopee และตรวจสอบว่าหน้าเลือกภาษาปรากฏขึ้น
    choose_language_feature.Open shopee application and verify choose language page    langeuage_page_title=${txt_choose_langauge_page['txt_title']}
    # Step 2: เลือกภาษาไทยแล้วรอ popup ต้อนรับผู้ใช้งานใหม่
    choose_language_feature.Choose language and check welcome page popup
    # Step 3: กดปุ่มเริ่มต้นและไปยังหน้าหลัก
    choose_language_feature.Tap start button and navigate to home page
    # Step 4: กดปุ่มเมนู ฉัน
    home_page.Tap button in bottom navigation bar
    ...    button_name=${txt_home_page['txt_profile_button']}
    # Step 5: กดปุ่มลงชื่อเข้าใช้
    profile_feature.Tap login button and check login page title
    # Step 6: เลือกดำเนินการต่อด้วย google
    login_page.Tap login with google account button
    google_login_feature.Login with gmail account and verify fingerprint popup is visible
    # Step 7: กดปุ่มตกลงที่หน้าสแกนลายนิ้วมือและไปที่หน้า passkey
    google_login_feature.Tap accept in fingerprint page and verify passkey page title
    # Step 8:  กดปุ่มย้อนกลับ ที่หน้ายืนยันตัวตนด้วยพาสคีย์
    google_login_page.Tap return button in passkey page
    # Step 9: กดเลือกไปที่ปุ่ม "หน้าแรก"
    profile_page.Tap home button
    ...    button_name=${txt_home_page['txt_home_button']}
    # Step 10: ค้นหาสินค้าด้วยการ Search ชื่อสินค้า
    home_page_feature.Tap search bar
    shopee_search_feature.Input product name in search box and tap search button
    ...    product_name=${product_detail['product_name']}
    # Step 11: ค้นหาสินค้าจากผลลัพธ์การค้นหากดเลือกสินค้าเป้าหมาย
    shopee_search_feature.Filter search results by shopee mall
    shopee_search_feature.Find product in search results and tap product item
    ...    product_name=${product_detail['product_name']}
    shopee_product_page.Check product name on product page
    ...    product_name=${product_detail['product_name']}
    # Step 12: สั่งซื้อสินค้า
    shopee_product_feature.Buy item now from product page
    shopee_checkout_page.Check checkout page title
    shopee_checkout_feature.Verify order details on checkout page
    ...    product_name=${product_detail['product_name']}
    ...    product_qty=${product['quantity']}
