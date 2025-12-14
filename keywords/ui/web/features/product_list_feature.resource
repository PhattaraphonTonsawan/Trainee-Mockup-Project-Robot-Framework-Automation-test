*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Add one item to cart
    [Documentation]    add Sauce Labs Backpack to cart 
    [Arguments]    ${product_name}    ${product_price}    ${product_description}
    product_list_page.Click add one item to cart    product_name=${product_name}
    product_list_page.Click go to cart page
    product_list_page.Check product detail have added to cart    product_detail=${product_name}
    product_list_page.Check product detail have added to cart    product_detail=${product_price}
    product_list_page.Check product detail have added to cart    product_detail=${product_description}

Add Multiple Products To Cart
    [Documentation]    User item List for multiple products and loop add to cart
    [Arguments]    ${items_to_add}    
    FOR    ${product_name}    IN    @{items_to_add}
        product_list_page.Click add one item to cart    ${product_name}
    END