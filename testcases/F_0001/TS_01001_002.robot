*** Settings ***
Resource    ${CURDIR}/../../resources/import.resource
Test Teardown    common_web.Close this browser

*** Test Cases ***
TS_01001_002
    [Documentation]    Verifies that the locked out user can't login and access the Product List page. 
    [Tags]    F_0001 TS_01001 TS_01001_002 login locked_out_user
    login_feature.Open website and login with invaild username
    ...    username=${account['locked_out_user']['username']}
    ...    password=${account['locked_out_user']['password']}