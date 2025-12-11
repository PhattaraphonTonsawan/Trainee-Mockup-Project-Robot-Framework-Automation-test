*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Add one item to cart
    [Documentation]    add Sauce Labs Backpack to cart 
    [Arguments]    ${username}    ${password}
    login_feature.Login with credentials    ${username}    ${password}
    product_list_page.Check product list page title
    product_list_page. 