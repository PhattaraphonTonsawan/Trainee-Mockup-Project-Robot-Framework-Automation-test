*** Settings ***
Resource    ${CURDIR}/../../resources/import.resource
Test Teardown    common_web.Close this browser

*** Test Cases ***
Login unsuccessfully with locked out user
    [Documentation]    Verifies that the locked out user can't login and access the Product List page. 
    [Tags]    F_0001    TS_01001    login    locked out user
    login_feature.Open website and login to product list page
    ...    username=${account['locked_out_user']['username']}
    ...    password=${account['locked_out_user']['password']}