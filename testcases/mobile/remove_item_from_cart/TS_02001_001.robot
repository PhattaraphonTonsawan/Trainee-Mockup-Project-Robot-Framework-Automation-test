*** Settings ***
Resource    ${CURDIR}/../../../resources/import.resource
Test Teardown    AppiumLibrary.Terminate Application    app_id=${app_capabilities['app_package']}

*** Test Cases ***
TS_02001_001
    [Documentation]    ทดสอบการลบสินค้า 1 ชิ้น ออกจากตะกร้าแล้วเช็คตะกร้าว่างเปล่า ด้วยการเข้าสู่ระบบด้วย บัญชี google
    [Tags]    F_0002    TS_02001    TS_02001_001    remove_item_from_cart    mobile
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
    login_feature.Tap login button and check login page title
    # Step 6: เลือกดำเนินการต่อด้วย google
    login_page.Tap login with google account button
    google_login_page.Swipe to google account
    google_login_page.Select google account
    # Step 7: กดปุ่มตกลงที่หน้าสแกนลายนิ้วมือและไปที่หน้า passkey
    # Step 8:  กดปุ่มย้อนกลับ ที่หน้ายืนยันตัวตนด้วยพาสคีย์
    login_feature.Handle fingerprint popup and passkey page
    # Step 9: กดเลือกไปที่ปุ่ม "หน้าแรก"
    profile_page.Tap home button
    ...    button_name=${txt_home_page['txt_home_button']}
    # Step 10: ค้นหาสินค้าด้วยการ Search ชื่อสินค้า
    shopee_search_feature.Tap search bar and verify search box visible
    shopee_search_feature.Tap search and input product name in search box and tap search button
    ...    product_name=${product_detail['product_name']}
    # Step 11: ค้นหาสินค้าจากผลลัพธ์การค้นหากดเลือกสินค้าเป้าหมาย
    shopee_search_feature.Filter search results by shopee mall
    shopee_search_feature.Find product in search results and tap product item
    ...    product_name=${product_detail['product_name']}
    shopee_product_page.Check product name on product page
    ...    product_name=${product_detail['product_name']}
    # Step 12: เพิ่มสินค้าใส่ตะกร้า
    shopee_product_feature.Add item to cart
    # Step 13: กดปุ่มตะกร้าสินค้า
    shopee_product_page.Tap cart button on product page
    # Step 14: ลบสินค้า
    shopee_cart_feature.Check cart details after adding item
    ...    item_name=${product_detail['product_name']}
    ...    item_quantity=${product_detail['product_qty']}
    shopee_cart_feature.Delete item from cart and verify cart is empty    item_name=${product_detail['product_name']}