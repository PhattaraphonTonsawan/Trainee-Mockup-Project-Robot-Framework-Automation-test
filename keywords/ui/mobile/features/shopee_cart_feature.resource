*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Check cart details after adding item
    [Documentation]    ตรวจสอบรายละเอียดในตะกร้าหลังจากเพิ่มสินค้าเข้าไป
    [Arguments]    ${item_name}    ${item_quantity}
    shopee_cart_page.Check cart page title
    shopee_cart_page.Check item name    item_name=${item_name}
    # shopee_cart_page.Check item quantity    item_quantity=${item_quantity}

Delete item from cart and verify cart is empty
    [Documentation]    ลบสินค้าที่อยู่ในตะกร้าออกทั้งหมด และตรวจสอบว่าตะกร้าว่าง
    [Arguments]    ${item_name}
    shopee_cart_page.Swipe to find delete item button    item_name=${item_name}
    shopee_cart_page.Tap to delete item button    item_name=${item_name}
    shopee_cart_page.Check message when cart is empty
    shopee_cart_page.Check checkout button not visible

Delete item from cart and verify cart is empty test setup
    [Documentation]    ลบสินค้าที่อยู่ในตะกร้าออกทั้งหมด และตรวจสอบว่าตะกร้าว่างใน Test setup
    [Arguments]    ${item_name}
    ${item_exists}    BuiltIn.Run Keyword And Return Status
    ...    shopee_cart_page.Check item name    item_name=${item_name}
    IF    ${item_exists}
        shopee_cart_page.Swipe to find delete item button    item_name=${item_name}
        shopee_cart_page.Tap to delete item button    item_name=${item_name}
    END
    shopee_cart_page.Check message when cart is empty
    shopee_cart_page.Check checkout button not visible