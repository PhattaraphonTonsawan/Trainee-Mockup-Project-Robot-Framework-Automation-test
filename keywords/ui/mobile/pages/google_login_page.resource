*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Check fingerprint enable popup
    [Documentation]    ตรวจสอบ popup การเปิดใช้งานการเข้าสู่ระบบด้วยลายนิ้วมือ
    common_mobile.Check element text when visible
    ...    locator=${google_login_page_locator['lbl_fingerprint_enable_title']}
    ...    text=${txt_google_login_page['txt_fingerprint_enable']}

Check quick login title in passkey page
    [Documentation]    ตรวจสอบหัวข้อยืนยันตัวตนสำหรับการเข้าสู่ระบบแบบรวดเร็ว
    common_mobile.Check element text when visible
    ...    locator=${google_login_page_locator['lbl_quick_login_title']}
    ...    text=${txt_google_login_page['txt_quick_login_title']}

Tap accept fingerprint pop up
    [Documentation]    สัมผัสปุ่มตกลงเมื่อ popup ใช้แสกนนิ้วมือแสดงขึ้นมา
    common_mobile.Tap element when ready    locator=${google_login_page_locator['btn_fingerprint_accept']}

Tap return button in passkey page
    [Documentation]    สัมผัสปุ่มย้อนกลับในหน้ายืนยันการใช้พาสคีย์
    BuiltIn.Run Keyword And Ignore Error    common_mobile.Tap element when ready    locator=${google_login_page_locator['btn_return_passkey']}

Select google account
    [Documentation]    เลือก gmail account ที่ต้องใช้สำหรับเข้าสู่ระบบด้วย gmail
    common_mobile.Tap element when ready    locator=${google_login_page_locator['btn_gmail']}

Swipe to google account
    [Documentation]    เลื่อนหน้าจอเพื่อหา gmail account ที่ต้องใช้สำหรับเข้าสู่ระบบด้วย gmail
    common_mobile.Swipe container until element visible
    ...    element_container=${google_login_page_locator['ctn_gmail_list']}
    ...    target_locator=${google_login_page_locator['btn_gmail']}