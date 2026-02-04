*** Settings ***
Resource    ${CURDIR}/../../../resources/import.resource
Test Teardown    AppiumLibrary.Terminate Application    app_id=${app_capabilities['app_package']}

*** Test Cases ***
TS_02001_001
    [Documentation]    ทดสอบการลบสินค้า 1 ชิ้น ออกจากตะกร้าแล้วเช็คตะกร้าว่างเปล่า ด้วยการเข้าสู่ระบบด้วย บัญชี google
    [Tags]    F_0002    TS_02001    TS_02001_001    remove_item_from_cart    mobile
    # Step 1: เปิดแอปพลิเคชัน Shopee และตรวจสอบว่าหน้าเลือกภาษาปรากฏขึ้น
    choose_language_feature.Open shopee application and verify choose language page
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
    login_feature.Login with gmail account and verify fingerprint popup is visible
    # Step 7: กดปุ่มตกลงที่หน้าสแกนลายนิ้วมือและไปที่หน้า passkey
    login_feature.Tap accept in fingerprint page and verify passkey page title
    # Step 8:  กดปุ่มย้อนกลับ ที่หน้ายืนยันตัวตนด้วยพาสคีย์
    google_login_page.Tap return button in passkey page