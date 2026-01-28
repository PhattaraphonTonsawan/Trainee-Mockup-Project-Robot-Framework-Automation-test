*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Choose language and navigate to main page
    [Documentation]    เลือกภาษาไทยแล้วไปที่หน้าหลักหลังจากเปิดแอปพลิเคชัน
    choose_language_page.Check page title
    choose_language_page.Choose thai language
    choose_language_page.Tap ok button
    choose_language_page.Tap start button