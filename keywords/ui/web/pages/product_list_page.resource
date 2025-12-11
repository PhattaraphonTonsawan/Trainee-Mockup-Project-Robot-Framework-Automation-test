*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Check product list page title
    [Documentation]    Check product list page title
    common_web.Element should contain text
    ...    locator=${product_list_page_locator['txt_title']}
    ...    expected_text=${txt_product_list_page['txt_title']}

Click add one item to cart
    [Documentation]    Click only one item to cart 
    common_web.Click element and wait    
    ...    locator=${product_list_page_locator['add_one_item_product_to_cart_btn']}
    ...    wait_element_locator=${product_list_page_locator['add_one_item_product_to_cart_btn']}

Click go to cart
    [Documentation]    Click go to cart icon for go to cart 
    common_web.Click element and wait
    ...    locator=${product_list_page_locator['go_to_cart_btn']}
    ...    wait_element_locator=${product_list_page_locator['go_to_cart_btn']}

Select sort type option
    [Documentation]    Click sort type for sort product
    [Arguments]    ${option}
    common_web.Select dropdown option    locator=${product_list_page_locator['dropdown_btn']}    option=${option}

Add all item to cart
    [Documentation]    Add all product item to cart 
    ${item_list}=    SeleniumLibrary.Get WebElement    locator=${product_list_page_locator['add_all_product_to_cart_btn']}
    FOR    ${item}    IN    @{item_list}
        common_web.Click element and wait    locator=${item}
    END

Remove item from cart 
    [Documentation]    Remove item from cart button 
    common_web.Click element and wait    locator=${product_list_page_locator['remove_item_btn']}    wait_element_locator=${product_list_page_locator['remove_item_btn']}
