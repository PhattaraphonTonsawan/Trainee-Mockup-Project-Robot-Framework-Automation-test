*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Choose language and navigate to main page
    [Documentation]    เลือกภาษาไทยแล้วไปที่หน้าหลักหลังจากเปิดแอปพลิเคชัน
    choose_language_page.Choose thai language
    choose_language_page.Tap ok button
    choose_language_page.Tap start button

Open shopee application and verify choose language page
    [Documentation]    เปิดแอปพลิเคชัน Shopee และตรวจสอบว่าหน้าเลือกภาษาปรากฏขึ้น
    common_mobile.Open android application
    choose_language_page.Check page title