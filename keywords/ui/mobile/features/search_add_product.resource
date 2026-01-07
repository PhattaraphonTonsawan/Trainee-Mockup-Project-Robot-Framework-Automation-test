*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Start application and login
    [Documentation]
    common_mobile.Open android application    remote_url=${remote_url}
    ...    platform_name=${platform_name}
    ...    platform_version=${platform_version}
    ...    device_name=${device_name}
    ...    automation_name=${automation_name}
    ...    app_package=${app_package}
    ...    app_activity=${app_activity}
    home_page.Click confirm language and start application
    home_page.Click user menu
    