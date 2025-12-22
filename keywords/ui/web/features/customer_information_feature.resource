*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Input every fields and proceed to checkout overview page
    [Documentation]    กรอกชื่อ, นามสกุล และรหัสไปรษณีย์/ซิปโค้ด จากนั้นกดปุ่ม Continue เพื่อไปยังหน้า Checkout Overview
    customer_information_page.Check page title
    customer_information_page.Input first name    first_name=${credentials['firstname']}
    customer_information_page.Input last name    last_name=${credentials['lastname']}
    customer_information_page.Input zip or postal code    zip_code=${credentials['zipcode']}
    customer_information_page.Click continue button
    checkout_overview_page.Wait until page loaded

Input every fields and last name error
    [Documentation]    กรอกชื่อ, นามสกุล, และรหัสไปรษณีย์/ซิปโค้ด แต่ปล่อยค่านามสกุลว่าง ทำให้เกิดข้อความแจ้งเตือน
    customer_information_page.Check page title
    customer_information_page.Input first name    first_name=${credentials['firstname']}
    customer_information_page.Input last name    last_name=${EMPTY}
    customer_information_page.Input zip or postal code    zip_code=${credentials['zipcode']}
    customer_information_page.Click continue button
    customer_information_page.Wait until error message appeared
    common_web.Check element text when visible
    ...    locator=${customer_information_page_locator['txt_error_msg']}
    ...    text=${txt_customer_infomation_page['txt_missing_last_name']}

Verify error when firstname is missing
    [Documentation]    กรอกเฉพาะนามสกุลและรหัสไปรษณีย์/ซิปโค้ด ทำให้เกิดข้อความแจ้งเตือนชื่อผู้ใช้หายไป
    customer_information_page.Check page title
    customer_information_page.Input last name    last_name=${credentials['lastname']}
    customer_information_page.Input zip or postal code    zip_code=${credentials['zipcode']}
    customer_information_page.Click continue button
    customer_information_page.Wait until error message appeared
    common_web.Check element text when visible
    ...    locator=${customer_information_page_locator['txt_error_msg']}
    ...    text=${txt_customer_infomation_page['txt_missing_first_name']}

Verify error when lastname is missing
    [Documentation]    กรอกเฉพาะนามสกุลและรหัสไปรษณีย์/ซิปโค้ด แต่นามกสุลไปขึ้นที่ชื่อจริงแทน
    ...    ทำให้เกิดข้อความแจ้งเตือนนามสกุลผู้ใช้หายไป
    customer_information_page.Check page title
    customer_information_page.Input last name    last_name=${credentials['lastname']}
    customer_information_page.Input zip or postal code    zip_code=${credentials['zipcode']}
    customer_information_page.Click continue button
    customer_information_page.Wait until error message appeared
    common_web.Check element text when visible
    ...    locator=${customer_information_page_locator['txt_error_msg']}
    ...    text=${txt_customer_infomation_page['txt_missing_last_name']}

Verify error when zip or postal code is missing
    [Documentation]    กรอกเฉพาะชื่อและนามสกุล ทำให้เกิดข้อความแจ้งเตือนรหัสไปรษณีย์/ซิปโค้ดหายไป
    customer_information_page.Check page title
    customer_information_page.Input first name    first_name=${credentials['firstname']}
    customer_information_page.Input last name    last_name=${credentials['lastname']}
    customer_information_page.Click continue button
    customer_information_page.Wait until error message appeared
    common_web.Check element text when visible
    ...    locator=${customer_information_page_locator['txt_error_msg']}
    ...    text=${txt_customer_infomation_page['txt_missing_zip/postal_code']}

Press cancel at customer information page
    [Documentation]    ยกเลิกกระบวนการ Checkout โดยกดปุ่ม Cancel ที่หน้า Customer Information
    customer_information_page.Check page title
    customer_information_page.Click cancel button