*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Login with credentials
    [Documentation]    Login with given username and password
    [Arguments]    ${username}    ${password}
    login_page.Open login page
    login_page.Check login page title
    login_page.Input username    username=${username}
    login_page.Input password    password=${password}
    login_page.Click login button

