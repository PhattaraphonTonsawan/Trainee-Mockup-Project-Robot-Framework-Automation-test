*** Settings ***
Resource    ${CURDIR}/../../resources/import.resource
Test Teardown    common_web.Close this browser

*** Test Cases ***
Test login to Swag lab with locked out user
    [Documentation]    Test login: Open website Swag labs and login with locked out user 
    [Tags]    F_0001    TS_01001    login    locked out user
    login_feature.Open website and login to product list page
    ...    username=${account['locked_out_user']['username']}
    ...    password=${account['locked_out_user']['password']}