*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Check cart page title
    [Documentation]    ตรวจสอบว่าอยู่หน้าตะกร้าสินค้าแล้ว
    common_web.Check element text when visible
    ...    locator=${cart_page_locator['txt_title']}
    ...    text=${txt_cart_page['txt_title']}

Click remove one item from cart
    [Documentation]    Remove a single item from the shopping cart by clicking its 'Remove' button.
    [Arguments]    ${product_name}
    ${replace_locator}=    common_web.Replace locator and wait until element visible    locator=${cart_page_locator['btn_remove_item']}    target_text=${product_name}    replace_text=***replace***
    common_web.Click element when ready    locator=${replace_locator}

Click back to shopping button
    [Documentation]    Click for Continue Shopping at Product list page
    common_web.Click element when ready    locator=${cart_page_locator['btn_back_to_shopping']}

Click go to checkout button
    [Documentation]    Click checkout button for payment after finish shopping and checking shopping cart    
    common_web.Click element when ready    locator=${cart_page_locator['btn_checkout']} 

Verify Specific Product Detail In Cart
    [Documentation]    Check product information that have add to cart by check product name, product description and product price
    [Arguments]    ${name}    ${price}    ${description}
    ${replace_locator_product_name}=    common_web.Replace locator and wait until element visible    
    ...    locator=${cart_page_locator['lbl_item_name']}    
    ...    target_text=***replace*** 
    ...    replace_text=${name}
    ${replace_locator_product_description}=    common_web.Replace locator and wait until element visible    
    ...    locator=${cart_page_locator['lbl_item_description']}    
    ...    target_text=***replace***
    ...    replace_text=${name}
    ${replace_locator_product_price}=    common_web.Replace locator and wait until element visible    
    ...    locator=${cart_page_locator['lbl_item_price']}    
    ...    target_text=***replace*** 
    ...    replace_text=${name}
    common_web.Scroll into element and wait until element visible    locator=${replace_locator_product_name}
    common_web.Check element text when visible   
    ...    locator=${replace_locator_product_description}
    ...    text=${description}
    common_web.Check element text when visible
    ...    locator=${replace_locator_product_price}
    ...    text=${price}

