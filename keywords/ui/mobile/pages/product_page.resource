*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Click add to cart button
    common_mobile.Swipe into element and wait until element ready    locator=${product_page_locator['btn_add_to_cart']}
    common_mobile.Click element when ready    locator=${product_page_locator['btn_add_to_cart']}

Click add to cart button in modal
    common_mobile.Swipe into element and wait until element ready    locator=${product_page_locator['btn_add_to_cart_modal']}
    common_mobile.Click element when ready    locator=${product_page_locator['btn_add_to_cart_modal']}

Click cart button
    common_mobile.Swipe into element and wait until element ready    locator=${product_page_locator['btn_cart']}
    common_mobile.Click element when ready    locator=${product_page_locator['btn_cart']}