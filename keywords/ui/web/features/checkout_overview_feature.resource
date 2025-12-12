*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Cancel checkout process
    [Documentation]    Cancel the checkout process at checkout overview page
    checkout_overview_page.Check page title
    checkout_overview_page.Click cancel button and wait main page

Confirm checkout process with 1 item
    [Documentation]    Complete the checkout process and go to checkout complete page
    checkout_overview_page.Check page title
    checkout_overview_page.Check product item title    item_name=${product['backpack']['product_name']}
    ${cart_price}=    checkout_overview_page.Get all product price
    checkout_overview_page.Compare total price    items_price=${cart_price}
    checkout_overview_page.Click finish button and wait next page

Confirm checkout process with all item
    [Documentation]    Complete the checkout process with all items and go to checkout complete page
    checkout_overview_page.Check page title
    checkout_overview_page.Check All Product Titles
    ${cart_price}=    checkout_overview_page.Get all product price
    checkout_overview_page.Compare total price    items_price=${cart_price}
    checkout_overview_page.Click finish button and wait next page

Confirm process error with only 3 product in cart
    [Documentation]    In checkout page there will only be 3 products in cart and 
    ...    nothing happen when confirming checkout process
    checkout_overview_page.Check page title
    checkout_overview_page.Check product item title    item_name=${product['backpack']['product_name']}
    checkout_overview_page.Check product item title    item_name=${product['bike_light']['product_name']}
    checkout_overview_page.Check product item title    item_name=${product['Onesie']['product_name']}
    checkout_overview_page.Click finish button and nothing happen