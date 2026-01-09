*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Click add to cart button
    [Documentation]    กดปุ่มเพิ่มสินค้าลงตะกร้า (จากหน้า Product Detail)
    common_mobile.Swipe into element and wait until element ready    locator=${product_page_locator['btn_add_to_cart']}
    common_mobile.Click element when ready    locator=${product_page_locator['btn_add_to_cart']}

Click add to cart button in modal
    [Documentation]    กดปุ่มเพิ่มสินค้าลงตะกร้าใน Modal (หลังจากเลือก Option สินค้าแล้ว)
    common_mobile.Swipe into element and wait until element ready    locator=${product_page_locator['btn_add_to_cart_modal']}
    common_mobile.Click element when ready    locator=${product_page_locator['btn_add_to_cart_modal']}

Click cart button
    [Documentation]    กดไอคอนตะกร้าสินค้า เพื่อไปหน้า Cart
    common_mobile.Swipe into element and wait until element ready    locator=${product_page_locator['btn_cart']}
    common_mobile.Click element when ready    locator=${product_page_locator['btn_cart']}

Get product name from card
    [Documentation]    ดึงชื่อสินค้าจาก Product Card แล้วส่งค่ากลับไป 
    common_mobile.Swipe into element and wait until element ready    locator=${home_page_locator['product_name_text']}
    ${product_name}=    AppiumLibrary.Get Text    locator=${home_page_locator['product_name_text']}
    RETURN    ${product_name}