*** Settings ***
Resource    ${CURDIR}/../../resources/import.resource
Test Teardown    common_web.Close this browser

*** Test Cases ***
TS_01001_001
    [Documentation]    Verifies that the standard user can login and access the Product List page.
    [Tags]    F_0001    TS_01001    TS_01001_001    login    standard_user  
    login_feature.Open website and login to product list page
    ...    username=${account['standard_user']['username']}
    ...    password=${account['standard_user']['password']}