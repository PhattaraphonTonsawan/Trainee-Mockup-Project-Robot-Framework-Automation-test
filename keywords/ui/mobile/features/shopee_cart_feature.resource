*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Check cart details after adding item
    [Documentation]    ตรวจสอบรายละเอียดในตะกร้าหลังจากเพิ่มสินค้าเข้าไป
    shopee_cart_page.Check cart page title
    shopee_cart_page.Check item name
    shopee_cart_page.Check item quantity
    shopee_cart_page.Check item price

Delete item from cart and verify cart is empty
    [Documentation]    ลบสินค้าที่อยู่ในตะกร้าออกทั้งหมด และตรวจสอบว่าตะกร้าว่าง
    shopee_cart_page.Swipe to find delete item button
    shopee_cart_page.Tap to delete item button
    shopee_cart_page.Check cart is empty
    shopee_cart_page.Check checkout button not visible