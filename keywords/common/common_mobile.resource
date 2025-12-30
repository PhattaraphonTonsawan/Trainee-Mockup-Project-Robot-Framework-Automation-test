*** Settings ***
Resource    ${CURDIR}/../../resources/import.resource

*** Keywords ***
Open android application
    [Documentation]    เปิดแอนด์ดรอยแอปพลิเคชันของ emulator ที่กำหนด
    # เพิ่ม ${platform_name} เข้าไปในบรรทัดนี้
    AppiumLibrary.Open Application    remote_url=${remote_url}
    ...    platformName=${platform_name}
    ...    platformVersion=${platform_version}
    ...    deviceName=${device_name}
    ...    app=${app}
    ...    automationName=${automation_name}

Click element when ready
    [Documentation]    กด element เมื่อพร้อมใช้งาน
    [Arguments]    ${locator}
    Scroll into element and wait until element ready    locator=${locator}
    AppiumLibrary.Click Element    locator=${locator}

Input text when ready
    [Documentation]    กรอกข้อความลงใน element ที่กำหนด
    [Arguments]    ${locator}    ${text}
    Scroll into element and wait until element ready    locator=${locator}
    AppiumLibrary.Input Text    locator=${locator}    text=${text}

Scroll into element and wait until element ready
    [Documentation]    ตรวจสอบว่า element ถูกโหลดใน DOM จากนั้นให้ element อยู่ในมุมมอง และรอจนกว่าจะพร้อมใช้งาน
    [Arguments]    ${locator}    ${timeout}=${wait_timeout['normally']['short_timeout']}
    AppiumLibrary.Wait Until Page Contains Element    locator=${locator}    timeout=${timeout}
    AppiumLibrary.Scroll Element Into View    ${locator}
    AppiumLibrary.Expect Element    locator=${locator}    timeout=${timeout}    state='enabled'

Scroll into element and wait until element visible
    [Documentation]    ตรวจสอบว่า element ถูกโหลดใน DOM จากนั้นให้ element อยู่ในมุมมอง และรอจนกว่าจะมองเห็นได้
    [Arguments]    ${locator}    ${timeout}=${wait_timeout['normally']['short_timeout']}
    AppiumLibrary.Wait Until Page Contains Element    locator=${locator}    timeout=${timeout}
    AppiumLibrary.Scroll Element Into View    ${locator}
    AppiumLibrary.Expect Element    locator=${locator}    timeout=${timeout}    state='visible'