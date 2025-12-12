*** Settings ***
Resource    ${CURDIR}/../../resources/import.resource
Test Teardown    common_web.Close this browser

*** Test Cases ***
TS_01001_006
    [Documentation]    Verifies that the visual user can login and access the Product List page.
    [Tags]    F_0001    TS_01001    TS_01001_006    login    visual user  
    login_feature.Open website and login to product list page
    ...    username=${account['visual_user']['username']}
    ...    password=${account['visual_user']['password']}