*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Check page title
    [Documentation]    ตรวจสอบว่าแถบค้นหาสินค้าแสดงในหน้าจอหรือไม่
    common_mobile.Check element text when visible
    ...    locator=${login_page_locator['txt_page_title']}
    ...    text=${txt_login_page['txt_title']}

Tap login with google account button
    [Documentation]    สัมผัสปุ่มดำเนินการต่อด้วย Google เพื่อเข้าสู่หน้า login ด้วย gmail
    common_mobile.Tap element when ready    locator=${login_page_locator['btn_google_login']}
