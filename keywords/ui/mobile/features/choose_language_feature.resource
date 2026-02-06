*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Choose language and check welcome page popup
    [Documentation]    เลือกภาษาไทยแล้วรอ popup ต้อนรับผู้ใช้งานใหม่
    choose_language_page.Choose thai language
    choose_language_page.Tap ok button
    choose_language_page.Check welcome page pop up

Tap start button and navigate to home page
    [Documentation]    กดปุ่มเริ่มเพื่อเข้าสู่หน้าหลัก
    choose_language_page.Tap start button
    home_page.Check search bar visible

Open shopee application and verify choose language page
    [Documentation]    เปิดแอปพลิเคชัน Shopee และตรวจสอบว่าหน้าเลือกภาษาปรากฏขึ้น
    [Arguments]    ${langeuage_page_title}
    common_mobile.Open android application
    choose_language_page.Check page title    langeuage_page_title=${langeuage_page_title}