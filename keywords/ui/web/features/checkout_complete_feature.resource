*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Checkout process success
    [Documentation]    สามารถ checkout ได้สำเร็จแล้วกลับมาที่หน้า product
    checkout_complete_page.Check page title
    checkout_complete_page.Check thank you message
    checkout_complete_page.Click back to home page