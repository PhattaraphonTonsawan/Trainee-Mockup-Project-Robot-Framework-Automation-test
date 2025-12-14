*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Check cart page title
    [Documentation]    Verify that already in cart page
    common_web.Element should contain text
    ...    locator=${cart_page_locator['txt_title']}
    ...    expected_text=${txt_cart_page['txt_title']}

Click remove one item from cart
    [Documentation]    Remove a single item from the shopping cart by clicking its 'Remove' button.
    [Arguments]    ${product_name}
    ${replace_locator}=    common_web.Replace string    locator=${cart_page_locator['btn_remove_item']}    new_string=${product_name}
    common_web.Click element and wait    
    ...    locator=${replace_locator}
    ...    wait_element_locator=${replace_locator}

Click back to shopping button
    [Documentation]    Click for Continue Shopping at Product list page
    common_web.Click element and wait    locator=${cart_page_locator['btn_back_to_shopping']}

Click go to checkout button
    [Documentation]    Click checkout button for payment after finish shopping and checking shopping cart    
    common_web.Click element and wait    locator=${cart_page_locator['btn_checkout']} 

Verify Specific Product Detail In Cart
    [Documentation]    Check product information that have add to cart by check product name, product description and product price
    [Arguments]    ${name}    ${price}    ${description}
    ${replace_locator}=    common_web.Replace string    locator=${cart_page_locator['lbl_item_name']}    new_string=${name}
    common_web.Wait for element is ready    locator=${replace_locator}
    common_web.Element should contain text    
    ...    locator=${cart_page_locator['lbl_item_description']}
    ...    expected_text=${description}
    common_web.Element should contain text
    ...    locator=${cart_page_locator['lbl_item_price']}
    ...    expected_text=${price}

