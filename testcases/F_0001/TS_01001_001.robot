*** Settings ***
Resource    ${CURDIR}/../../resources/import.resource
Test Teardown    common_web.Close this browser

*** Test Cases ***
Test login to Swag lab with standard user
    [Documentation]    Test login to Swag lab with standard user 
    [Tags]    F_0001    TS_01001    login    standard_user
    # Open website saucedemo and login with standard user
    login_feature.Open website and login to product list page
    ...    username=${account['standard_user']['username']}
    ...    password=${account['standard_user']['password']}
    # Verify successful login by checking product list page title