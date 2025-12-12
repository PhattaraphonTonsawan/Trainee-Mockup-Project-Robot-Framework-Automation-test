*** Settings ***
Resource    ${CURDIR}/../../resources/import.resource
Test Teardown    common_web.Close this browser

*** Test Cases ***
TS_01001_003
    [Documentation]    Verifies that the problem user can login and access the Product List page. 
    [Tags]    F_0001 TS_01001 TS_01001_003 login problem user
    login_feature.Open website and login to product list page
    ...    username=${account['problem_user']['username']}
    ...    password=${account['problem_user']['password']}