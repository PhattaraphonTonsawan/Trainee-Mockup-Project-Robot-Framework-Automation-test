*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Click add item quantity button
    [Documentation]    กดปุ่มบวก (+) เพื่อเพิ่มจำนวนสินค้าในตะกร้า
    common_mobile.Swipe into element and wait until element ready    locator=${cart_page_locator['btn_add_item_quantity']}
    common_mobile.Click element when ready    locator=${cart_page_locator['btn_add_item_quantity']}

Click checkout button
    [Documentation]    กดปุ่มชำระเงิน (Checkout) ท้ายตะกร้า
    common_mobile.Swipe into element and wait until element ready    locator=${cart_page_locator['btn_checkout']}
    common_mobile.Click element when ready    locator=${cart_page_locator['btn_checkout']}

Click confirm delete item button
    [Documentation]    กดปุ่มยืนยันการลบสินค้า (ใน Popup ยืนยัน)
    common_mobile.Swipe into element and wait until element ready    locator=${cart_page_locator['btn_confirm_delete']}
    common_mobile.Click element when ready    locator=${cart_page_locator['btn_confirm_delete']}

Click reduce item quantity button
    [Documentation]    กดปุ่มลบ (-) เพื่อลดจำนวนสินค้าในตะกร้า
    common_mobile.Swipe into element and wait until element ready    locator=${cart_page_locator['btn_reduce_item_quantity']}
    common_mobile.Click element when ready    locator=${cart_page_locator['btn_reduce_item_quantity']}

Click product item checkbox
    [Documentation]    กด Checkbox เพื่อเลือกสินค้าชิ้นนั้น
    common_mobile.Swipe into element and wait until element ready    locator=${cart_page_locator['check_box']}
    common_mobile.Click element when ready    locator=${cart_page_locator['check_box']}

Check cart empty icon
    [Documentation]    ตรวจสอบว่ามีไอคอน "ตะกร้าว่าง" แสดงขึ้นมา (กรณีไม่มีสินค้า)
    common_mobile.Swipe into element and wait until element ready    locator=${cart_page_locator['cart_empty_icon']}

Check cart page title
    [Documentation]    ตรวจสอบว่าหัวข้อหน้าตะกร้าสินค้าแสดงผลถูกต้อง
    common_mobile.Swipe into element and wait until element ready    locator=${cart_page_locator['txt_title']}