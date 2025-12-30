*** Settings ***
Resource    ${CURDIR}/../../../resources/import.resource
Test Teardown    AppiumLibrary.Close All Applications

*** Test Cases ***
Open my android application successfully
    [Documentation]    ทดสอบการเปิดแอปพลิเคชันโดยการติดตั้งจากไฟล์ APK
    [Tags]    mobile
    # เพิ่มบรรทัด platform_name ลงไป
    common_mobile.Open android application
    Log To Console    \nApp Opened Successfully!
