*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Check page title
    [Documentation]    ตรวจสอบหัวข้อหน้า
    [Arguments]    ${langeuage_page_title}
    ${replaced_page_title}=    common_mobile.Replace locator and wait until element visible
    ...    locator=${choose_language_page_locator['lbl_title']}
    ...    replace_text=${langeuage_page_title}
    common_mobile.Check element text when visible
    ...    locator=${replaced_page_title}
    ...    text=${txt_choose_langauge_page['txt_title']}

Check welcome page pop up
    [Documentation]    ตรวจสอบ pop up ตอนรับเข้าสู่แอปพลิเคชัน
    common_mobile.Wait until element visible    locator=${choose_language_page_locator['img_popup']}

Choose thai language
    [Documentation]    สัมผัสปุ่มตัวเลือกภาษาไทย
    common_mobile.Tap element when ready    locator=${choose_language_page_locator['btn_thai_language']}

Tap ok button
    [Documentation]    สัมผัสปุ่มตกลง
    common_mobile.Tap element when ready    locator=${choose_language_page_locator['btn_ok']}

Tap start button
    [Documentation]    สัมผัสปุ่มเริ่มต้น
    common_mobile.Tap element when ready    locator=${choose_language_page_locator['btn_start']}