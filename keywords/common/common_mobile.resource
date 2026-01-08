*** Settings ***
Resource    ${CURDIR}/../../resources/import.resource

*** Keywords ***
Open android application
    [Documentation]    เปิดแอนด์ดรอยแอปพลิเคชัน
    AppiumLibrary.Open Application
    ...    remote_url=${remote_url}
    ...    platformName=${platform_name}
    ...    platformVersion=${platform_version}
    ...    deviceName=${device_name}
    ...    automationName=${automation_name}
    ...    appPackage=${app_package}
    ...    appActivity=${app_activity}
    ...    noReset=true
    ...    newCommandTimeout=300
    ...    autoGrantPermissions=true

Click element when ready
    [Documentation]    กด element เมื่อพร้อมใช้งาน
    [Arguments]    ${locator}
    Scroll into element and wait until element ready    locator=${locator}
    AppiumLibrary.Click Element    locator=${locator}

Check element text when visible
    [Documentation]    ตรวจสอบว่า element ปรากฏอยู่บนหน้า และตรวจสอบว่าข้อความภายใน element ตรงกับค่าที่กำหนด
    [Arguments]    ${locator}    ${text}
    Swipe into element and wait until element ready    locator=${locator}
    AppiumLibrary.Element Should Contain Text    ${locator}    ${text}

Input text when ready
    [Documentation]    กรอกข้อความลงใน element ที่กำหนด
    [Arguments]    ${locator}    ${text}
    Swipe into element and wait until element ready    locator=${locator}
    AppiumLibrary.Input Text    locator=${locator}    text=${text}
    AppiumLibrary.Hide Keyboard    key_name=Done

Swipe into element and wait until element ready
    [Documentation]    เช็ค DOM ถ้ามองไม่เห็นให้ Swipe หา Element วนลูปจนกว่าจะเจอ
    [Arguments]    ${locator}    ${timeout}=${wait_timeout['normally']['short_timeout']}    ${max_swipes}=10
    ${is_visible}=    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    ${locator}    timeout=${timeout}
    FOR    ${index}    IN RANGE    ${max_swipes}
        AppiumLibrary.Swipe By Percent    start_x=50    start_y=70    end_x=50    end_y=30    duration=1000
        ${is_visible}=    Run Keyword And Return Status    AppiumLibrary.Wait Until Element Is Visible    ${locator}    timeout=${timeout}
        IF    ${is_visible}    BREAK
    END
    AppiumLibrary.Wait Until Element Is Visible    locator=${locator}    timeout=${timeout}

Wait and verify element value
    [Documentation]    ตรวจสอบค่า (Text) ใน element สำหรับ Appium
    [Arguments]    ${locator}    ${expected_value}
    Swipe into element and wait until element ready    locator=${locator}
    ${actual_value}=    AppiumLibrary.Get Text    locator=${locator}
    BuiltIn.Should Be Equal    ${actual_value}    ${expected_value}    msg=Text verification failed for ${locator}