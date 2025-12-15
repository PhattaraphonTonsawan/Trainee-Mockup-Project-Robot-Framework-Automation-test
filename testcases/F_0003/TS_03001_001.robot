*** Settings ***
Resource    ${CURDIR}/../../resources/import.resource

*** Keywords ***
TS_03001_001
    [Documentation]    Add single item to the cart using standard user accout
    [Tags]    F_0003    TS_013001    TS_03001_001    Add_single_item     standard_user  
    login_feature.Open website and login to product list page
    ...    username=${account['standard_user']['username']}
    ...    password=${account['standard_user']['password']}
    product_list_page.Check product list page title
    product_list_feature.Add one item to cart    product_name=${product['backpack']['product_name']}
    product_list_page.Click go to cart page
    cart_page.Check cart page title
    cart_feature.Verify one item detail at cart page    product=${product['backpack']}