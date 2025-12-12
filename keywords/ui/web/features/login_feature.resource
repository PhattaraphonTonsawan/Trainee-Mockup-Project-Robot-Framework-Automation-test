*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Open website and login to product list page
    [Documentation]    Login with given username and password
    [Arguments]    ${username}    ${password}
    login_page.Open login page
    login_page.Check login page title
    login_page.Input username    username=${username}
    login_page.Input password    password=${password}
    login_page.Click login button when ready
    product_list_page.Check product list page title
    

Open website and login with invaild username
    [Documentation]    Opens website and login with invalid credentials, verifying that an error message is displayed.
    [Arguments]    ${username}    ${password}
    login_page.Open login page
    login_page.Check login page title
    login_page.Input username    username=${username}
    login_page.Input password    password=${password}
    login_page.Click login button when ready
    login_page.Wait until login error message appears    
