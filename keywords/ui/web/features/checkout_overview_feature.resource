*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Cancel checkout process
    [Documentation]    Cancel the checkout process at checkout overview page
    checkout_overview_page.Check page title
    checkout_overview_page.Click cancel button
    product_list_page.Check product list page title

Check all product titles
    [Documentation]    Checks the title for every product listed in the ${product} dataset.
    @{product_keys}=    Collections.Get Dictionary Keys    dictionary=${product}
    FOR    ${key}    IN    @{product_keys}
        ${expected_name}=    BuiltIn.Set Variable    ${product['${key}']['product_name']}
        Check product item title    item_name=${expected_name}
    END

Confirm checkout process with 1 item
    [Documentation]    Complete the checkout process and go to checkout complete page with only 1 item
    checkout_overview_page.Check page title
    checkout_overview_page.Check product item title    item_name=${product['backpack']['product_name']}
    ${cart_price}=    checkout_feature.Get all product price
    checkout_feature.Compare total price    items_price=${cart_price}
    checkout_overview_page.Click finish button
    checkout_complete_page.Check page title

Confirm checkout process with all item
    [Documentation]    Complete the checkout process with all items and go to checkout complete page
    checkout_overview_page.Check page title
    Check All Product Titles
    ${cart_price_list}=    checkout_overview_page.Get list of product price
    ${cart_price}=    BuiltIn.Evaluate    sum(${cart_price_list})
    ${tax}=    checkout_overview_page.Get item tax
    ${cart_price_with_tax}=    BuiltIn.Evaluate    ${cart_price} + ${tax}
    ${page_total_price}=    checkout_overview_page.Get item total price
    BuiltIn.Should Be Equal    ${cart_price_with_tax}    ${page_total_price}
    checkout_overview_page.Click finish button
    checkout_complete_page.Check page title

Confirm process error with only 3 product in cart
    [Documentation]    In checkout page there will only be 3 products in cart and 
    ...    nothing happen when confirming checkout process
    checkout_overview_page.Check page title
    @{product_names}=    BuiltIn.Create List    ${product['backpack']['product_name']}    
    ...    ${product['bike_light']['product_name']}    
    ...    ${product['Onesie']['product_name']}
    FOR    ${product_name}    IN    @{product_names}
        checkout_overview_page.Check product item title    item_name=${product_name}
    END
    ${cart_price}=    checkout_feature.Get all product price
    checkout_feature.Compare total price    items_price=${cart_price}
    checkout_overview_page.Click finish button
    checkout_complete_page.Check page title