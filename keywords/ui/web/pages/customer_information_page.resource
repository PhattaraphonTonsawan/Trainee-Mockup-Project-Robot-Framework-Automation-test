*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Check page title
    [Documentation]    ตรวจสอบว่าชื่อหน้าถูกต้องตามที่คาดหวังหรือไม่
    common_web.Check element text when visible
    ...    locator=${customer_information_page_locator['txt_page_title']}
    ...    text=${txt_customer_infomation_page['txt_title']}

Click cancel button
    [Documentation]    กดปุ่ม Cancel และยกเลิกการกรอกข้อมูล
    common_web.Click element when ready    locator=${customer_information_page_locator['btn_cancel']}

Click continue button
    [Documentation]    กดปุ่ม Continue และตรวจสอบว่าหน้าถัดไปเป็น Checkout Overview Page
    common_web.Click element when ready    locator=${customer_information_page_locator['btn_continue']}

Input first name
    [Documentation]    กรอกชื่อในช่อง First Name
    [Arguments]    ${first_name}
    common_web.Input text when ready
    ...    locator=${customer_information_page_locator['txt_first_name']}
    ...    text=${first_name}

Input last name
    [Documentation]    กรอกนามสกุลในช่อง Last Name
    [Arguments]    ${last_name}
    common_web.Input text when ready
    ...    locator=${customer_information_page_locator['txt_last_name']}
    ...    text=${last_name}

Input zip or postal code
    [Documentation]    กรอกรหัสไปรษณีย์/Zip Code ในช่องที่กำหนด
    [Arguments]    ${zip_code}
    common_web.Input text when ready    locator=${customer_information_page_locator['txt_zip_code']}    text=${zip_code}

Wait until error message appeared
    [Documentation]    รอจนกว่าข้อความแจ้งเตือนความผิดพลาดจะปรากฏบนหน้า
    common_web.Scroll into element and wait until element visible
    ...    locator=${customer_information_page_locator['txt_error_msg']}

Wait until page loaded
    [Documentation]    รอจนกว่าหน้า Customer Information Page จะโหลดเสร็จและ element หลักปรากฏ
    common_web.Scroll into element and wait until element visible
    ...    locator=${customer_information_page_locator['txt_page_title']}