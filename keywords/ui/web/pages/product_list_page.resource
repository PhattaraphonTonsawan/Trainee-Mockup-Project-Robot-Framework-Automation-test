*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Check product list page title
    [Documentation]   Verifies that the current page is the Product List page by validating its title text. 
    common_web.Wait for element is ready    locator=${product_list_page_locator['txt_title']}
    common_web.Element should contain text
    ...    locator=${product_list_page_locator['txt_title']}
    ...    expected_text=${txt_product_list_page['txt_title']}

Click add one item to cart
    [Documentation]    Adds a single item to the shopping cart by clicking its 'Add to cart' button.
    [Arguments]    ${product_name}
    ${replace_locator}=    common_web.Replace string    locator=${product_list_page_locator['btn_add_item']}    new_string=${product_name}
    common_web.Click element and wait    
    ...    locator=${replace_locator}
    ...    wait_element_locator=${replace_locator}

Click go to cart page
    [Documentation]    Clicks the shopping cart icon to navigate to the Cart page.
    common_web.Click element and wait
    ...    locator=${product_list_page_locator['go_to_cart_btn']}
    ...    wait_element_locator=${product_list_page_locator['go_to_cart_btn']}

Select sort type option
    [Documentation]    Selects the product sorting order from the dropdown menu based on the given value.
    [Arguments]    ${option}
    common_web.Select dropdown option    locator=${product_list_page_locator['btn_dropdown']}    option=${option}

Check product detail have added to cart
    [Documentation]    Check product information that have add to cart by check product name, product description and product price
    [Arguments]    ${product_detail}
    common_web.Element should contain text
    ...    locator=${product_list_page_locator['lbl_cart_item']}
    ...    expected_text=${product_detail}

Create product item list
    [Documentation]    Creates and returns a list containing the names of all products
    ${product_list}=    BuiltIn.Create List
    ...    ${product['backpack']['product_name']}
    ...    ${product['jacket']['product_name']}
    ...    ${product['t_shirt']['product_name']}
    ...    ${product['bike_light']['product_name']}
    ...    ${product['Onesie']['product_name']}
    ...    ${product['red_t-shirt']['product_name']}
    RETURN    ${product_list}