*** Settings ***
Resource    ${CURDIR}/../../resources/import.resource
Test Teardown    common_web.Close this browser

*** Test Cases ***
TS_01001_004
    [Documentation]    Verifies that the performance glitch user can login and access the Product List page. 
    [Tags]    F_0001    TS_01001    TS_01001_004    login    performance_glitch_user
    login_feature.Open website and login to product list page
    ...    username=${account['performance_glitch_user']['username']}
    ...    password=${account['performance_glitch_user']['password']}