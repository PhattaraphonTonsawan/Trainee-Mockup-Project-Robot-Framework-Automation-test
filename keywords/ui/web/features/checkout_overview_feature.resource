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

Confirm process error
    [Documentation]    Nothing happen when comfirming checkout process
    checkout_overview_page.Check page title
    checkout_overview_page.Click finish button and nothing happen