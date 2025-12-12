*** Settings ***
Resource    ${CURDIR}/../../resources/import.resource
Test Teardown    common_web.Close this browser

*** Test Cases ***
Test login to Swag lab with problem_user
    [Documentation]    Test login: Open website Swag labs and login with problem_user
    [Tags]    F_0001    TS_01001    login    performance_glitch_user
    login_feature.Open website and login to product list page
    ...    username=${account['problem_user']['username']}
    ...    password=${account['problem_user']['password']}