*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Click add item quantity button
    [Documentation]
    common_mobile.Swipe into element and wait until element ready    locator=${cart_page_locator['btn_add_item_quantity']}
    common_mobile.Click element when ready    locator=${cart_page_locator['btn_add_item_quantity']}

Click checkout button
    [Documentation]
    common_mobile.Swipe into element and wait until element ready    locator=${cart_page_locator['btn_checkout']}
    common_mobile.Click element when ready    locator=${cart_page_locator['btn_checkout']}

Click confirm delete item button
    [Documentation]
    common_mobile.Swipe into element and wait until element ready    locator=${cart_page_locator['btn_confirm_delete']}
    common_mobile.Click element when ready    locator=${cart_page_locator['btn_confirm_delete']}

Click reduce item quantity button
    [Documentation]
    common_mobile.Swipe into element and wait until element ready    locator=${cart_page_locator['btn_reduce_item_quantity']}
    common_mobile.Click element when ready    locator=${cart_page_locator['btn_reduce_item_quantity']}

Click product item checkbox
    [Documentation]
    common_mobile.Swipe into element and wait until element ready    locator=${cart_page_locator['check_box']}
    common_mobile.Click element when ready    locator=${cart_page_locator['check_box']}

Check cart empty icon
    [Documentation]
    common_mobile.Swipe into element and wait until element ready    locator=${cart_page_locator['cart_empty_icon']}

Verify page title
    [Documentation]
    common_mobile.Swipe into element and wait until element ready    locator=${cart_page_locator['txt_title']}