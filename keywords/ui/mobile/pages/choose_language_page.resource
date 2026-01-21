*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Check page title
    [Documentation]    ตรวจสอบหัวข้อหน้า
    common_mobile.Swipe container until element visible
    ...    element_container=${choose_language_page_locator['container_page']}
    ...    target_locator=${choose_language_page_locator['lbl_title']}
    common_mobile.Check element text when visible
    ...    locator=${choose_language_page_locator['lbl_title']}
    ...    text=${txt_choose_langauge_page['txt_title']}

Choose thai language
    [Documentation]    สัมผัสปุ่มตัวเลือกภาษาไทย
    common_mobile.Swipe container until element visible
    ...    element_container=${choose_language_page_locator['container_page']}
    ...    target_locator=${choose_language_page_locator['btn_thai_language']}
    common_mobile.Tap element when ready    locator=${choose_language_page_locator['btn_thai_language']}

Tap ok button
    [Documentation]    สัมผัสปุ่มตกลง
    common_mobile.Swipe container until element visible
    ...    element_container=${choose_language_page_locator['container_page']}
    ...    target_locator=${choose_language_page_locator['btn_ok']}
    common_mobile.Tap element when ready    locator=${choose_language_page_locator['btn_ok']}

Tap start button
    [Documentation]    สัมผัสปุ่มเริ่มต้น
    common_mobile.Swipe container until element visible
    ...    element_container=${choose_language_page_locator['container_page']}
    ...    target_locator=${choose_language_page_locator['btn_start']}
    common_mobile.Tap element when ready    locator=${choose_language_page_locator['btn_start']}