*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Complete checkout and go to product list page
    [Documentation]    ตรวจสอบขั้นตอนหลังการสั่งซื้อว่าแสดงข้อความขอบคุณที่หน้า checkout complete แล้วกดปุ่ม back home เพื่อกลับไปยังหน้า product list page
    checkout_complete_page.Check page title
    checkout_complete_page.Check thank you message
    checkout_complete_page.Click back to home page
    product_list_page.Check product list page title