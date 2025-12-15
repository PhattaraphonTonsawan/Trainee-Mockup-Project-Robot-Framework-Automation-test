*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Check page title
    [Documentation]    ตรวจสอบว่าชื่อหน้าถูกต้องตามที่คาดหวังหรือไม่
    common_web.Check element text when visible
    ...    locator=${checkout_complete_page_locator['page_title']}
    ...    text=${txt_checkout_complete_page['txt_title']}

Check thank you message
    [Documentation]    ตรวจสอบว่าข้อความ "Thank you" ปรากฏหรือไม่
    common_web.Check element text when visible
    ...    locator=${checkout_complete_page_locator['txt_thank_you']}
    ...    text=${txt_checkout_complete_page['txt_thankyou']}

Click back to home page
    [Documentation]    กดปุ่มกลับไปหน้าหลัก และตรวจสอบว่าหน้าถัดไปเป็นหน้า Main Page
    common_web.Click element when ready    locator=${checkout_complete_page_locator['btn_back_home']}

Wait until page loaded
    [Documentation]    รอจนกว่าหน้า Checkout Complete Page จะโหลดเสร็จและ element หลักปรากฏ
    common_web.Scroll into element and wait until element visible
    ...    locator=${checkout_complete_page_locator['txt_page_title']}