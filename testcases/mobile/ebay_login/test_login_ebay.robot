*** Settings ***
Resource    ${CURDIR}/../../../resources/import.resource
Test Teardown    AppiumLibrary.Close All Applications

*** Test Cases ***
Open my android application successfully
    [Documentation]    ทดสอบการเปิดแอปพลิเคชันโดยการติดตั้งจากไฟล์ APK
    [Tags]    mobile
    # เพิ่มบรรทัด platform_name ลงไป
    common_mobile.Open android application    app=${app}
    ...    remote_url=${remote_url}
    ...    device_name=${device_name}
    ...    automation_name=${automation_name}
    ...    platform_version=${platform_version}
    ...    platform_name=${platform_name}
    Log To Console    \nApp Opened Successfully!
