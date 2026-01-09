*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Click confirm language and start application
    [Documentation]    กดยืนยันการเลือกภาษาและกดปุ่มเริ่มต้นใช้งานแอปพลิเคชัน
    common_mobile.Click element when ready    locator=${select_language_page_locator['btn_ok']}
    common_mobile.Click element when ready    locator=${select_language_page_locator['btn_start']}