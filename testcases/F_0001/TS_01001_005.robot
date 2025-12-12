*** Settings ***
Resource    ${CURDIR}/../../resources/import.resource
Test Teardown    common_web.Close this browser

*** Test Cases ***
TS_01001_005
    [Documentation]    Verifies that the error_user can login and access the Product List page. 
    [Tags]    F_0001    TS_01001    TS_01001_005    login    error_user
    login_feature.Open website and login to product list page
    ...    username=${account['error_user']['username']}
    ...    password=${account['error_user']['password']}