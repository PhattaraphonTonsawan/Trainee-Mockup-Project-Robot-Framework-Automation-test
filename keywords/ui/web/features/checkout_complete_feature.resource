*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Checkout process success
    [Documentation]    Arrived at checkout complete page and return to main page
    checkout_complete_page.Check page title
    checkout_complete_page.Check thank you message
    checkout_complete_page.Click back home button and check page