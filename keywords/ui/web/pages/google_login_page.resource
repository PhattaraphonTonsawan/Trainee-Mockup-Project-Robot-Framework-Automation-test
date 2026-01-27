*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Tap accept fingerprint pop up
    [Documentation]    สัมผัสปุ่มตกลงเมื่อ popup ใช้แสกนนิ้วมือแสดงขึ้นมา
    common_mobile.Tap element when ready    locator=${google_login_page_locator['btn_fingerprint_accep']}

Tap return button in passkey page
    [Documentation]    สัมผัสปุ่มย้อนกลับในหน้ายืนยันการใช้พาสคีย์
    common_mobile.Tap element when ready    locator=${google_login_page_locator['btn_return_passkey']}

Select google account to login
    [Documentation]    เลือก gmail account ที่ต้องใช้สำหรับเข้าสู่ระบบด้วย gmail
    ${replace_locator}=    common_mobile.Replace locator and wait until element visible
    ...    locator=${google_login_page_locator['btn_gmail']}
    ...    replace_text=${gmail}
    common_mobile.Tap element when ready    locator=${replace_locator}