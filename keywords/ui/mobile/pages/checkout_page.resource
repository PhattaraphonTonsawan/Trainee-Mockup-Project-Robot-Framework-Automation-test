*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Check checkout page title
    [Documentation]    ตรวจสอบว่าหัวข้อหน้า Checkout (ชำระเงิน) แสดงผลถูกต้อง
    common_mobile.Swipe into element and wait until element ready    locator=${checkout_page_locator['txt_title']}

Check total price
    [Documentation]    ตรวจสอบราคาสินค้ารวม (Total Price) ว่าถูกต้องตามที่คาดหวัง
    [Arguments]    ${total_price}
    common_mobile.Swipe into element and wait until element ready    locator=${checkout_page_locator['lbl_total_price']}
    common_mobile.Wait and verify element value    locator=${checkout_page_locator['lbl_total_price']}    expected_value=${total_price}

Check product name
    [Documentation]    ตรวจสอบชื่อสินค้าในหน้า Checkout ว่าถูกต้อง
    [Arguments]    ${product_name}
    common_mobile.Swipe into element and wait until element ready    locator=${checkout_page_locator['lbl_product_name']}
    common_mobile.Wait and verify element value    locator=${checkout_page_locator['lbl_product_name']}    expected_value=${product_name}

Check total payment
    [Documentation]    ตรวจสอบยอดชำระเงินสุทธิ (Total Payment) ว่าถูกต้อง
    [Arguments]    ${total_payment}
    common_mobile.Swipe into element and wait until element ready    locator=${checkout_page_locator['lbl_total_payment']}
    common_mobile.Wait and verify element value    locator=${checkout_page_locator['lbl_total_payment']}    expected_value=${total_payment}