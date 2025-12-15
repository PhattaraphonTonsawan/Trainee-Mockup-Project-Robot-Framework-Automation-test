*** Settings ***
Resource    ${CURDIR}/../../resources/import.resource
Test Teardown    common_web.Close all browser

*** Test Cases ***
TS_04001_001
    [Documentation]    Verifies that the standard user can checkout with 1 product
    [Tags]    F_0004    TS_04001    TS_04001_001    checkout_1_item    standard_user
    login_feature.Open login page and login to product list page    
    ...    username=${account['standard_user']['username']}    
    ...    password=${account['standard_user']['password']}
    product_list_feature.Add one item to cart    product_name=${product['backpack']['product_name']}
    cart_feature.Verify one item detail at cart page    product=${product['backpack']}
    customer_information_feature.Input every fields and proceed to checkout overview page
    