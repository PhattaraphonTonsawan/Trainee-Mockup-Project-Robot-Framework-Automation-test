*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Check page title
    [Documentation]    ตรวจสอบหัวข้อหน้า
    common_mobile.Check element text when visible
    ...    locator=${choose_language_page_locator['lbl_title']}
    ...    text=${txt_choose_langauge_page['txt_title']}

Choose thai language
    [Documentation]    สัมผัสปุ่มตัวเลือกภาษาไทย
    common_mobile.Tap element when ready    locator=${choose_language_page_locator['btn_thai_language']}

Tap ok button
    [Documentation]    สัมผัสปุ่มตกลง
    common_mobile.Tap element when ready    locator=${choose_language_page_locator['btn_ok']}

Tap start button
    [Documentation]    สัมผัสปุ่มเริ่มต้น
    common_mobile.Tap element when ready    locator=${choose_language_page_locator['btn_start']}