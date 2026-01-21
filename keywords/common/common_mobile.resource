*** Settings ***
Resource    ${CURDIR}/../../resources/import.resource

*** Keywords ***
Check element text when visible
    [Documentation]    ตรวจสอบว่า element ปรากฏอยู่บนหน้า และตรวจสอบว่าข้อความภายใน element ตรงกับค่าที่กำหนด
    [Arguments]    ${locator}    ${text}
    Wait until element visible    locator=${locator}
    AppiumLibrary.Element Should Contain Text    ${locator}    ${text}

Input text when ready
    [Documentation]    กรอกข้อความลงใน element ที่กำหนด และตรวจสอบว่าข้อความที่อยู่ในช่องตรงกับที่กรอกไป
    [Arguments]    ${locator}    ${text}
    Wait until element enable    locator=${locator}
    AppiumLibrary.Input Text    ${locator}    ${text}
    AppiumLibrary.Hide Keyboard    Done
    AppiumLibrary.Element Should Contain Text    ${locator}    ${text}

Open android application
    [Documentation]    เปิดแอปพลิเคชันแอนด์ดรอย
    AppiumLibrary.Open Application
    ...    remote_url=${device_capabilities['remote_url']}
    ...    platformName=${device_capabilities['platform_name']}
    ...    platformVersion=${device_capabilities['platform_version']}
    ...    deviceName=${device_capabilities['device_name']}
    ...    automationName=${device_capabilities['automation_name']}
    ...    appPackage=${device_capabilities['app_package']}
    ...    appActivity=${device_capabilities['app_activity']}
    ...    noReset=false
    ...    fullReset=false
    ...    newCommandTimeout=300
    ...    autoGrantPermissions=true
    ...    disableWindowAnimation=true

Replace locator and wait until element visible
    [Documentation]    แทนที่ข้อความภายใน locator (default=***replace***) ด้วยข้อความใหม่
    [Arguments]    ${locator}    ${replace_text}    ${target_text}=***replace***
    ${locator_replaced}=    String.Replace String    ${locator}    ${target_text}    ${replace_text}
    Wait until element visible    locator=${locator_replaced}
    RETURN    ${locator_replaced}

Swipe container until element visible
    [Documentation]    ทำการ Swipe ภายใน Container ที่กำหนดจนกว่าจะเจอ Element เป้าหมายโดยการลากนิ้ว
    [Arguments]    ${element_container}    ${target_locator}    ${direction}='up'    ${duration}=1000    ${max_swipe}=10
    Wait until element visible    locator=${element_container}
    ${location}=    AppiumLibrary.Get Element Location    ${element_container}
    ${element_size}=    AppiumLibrary.Get Element Size    ${element_container}
    FOR    ${i}    IN RANGE    ${max_swipe}
        ${is_target_visible}=    BuiltIn.Run Keyword And Return Status    Wait until element visible    ${target_locator}
        IF    ${is_target_visible}
            BuiltIn.Log To Console    Found element '${target_locator}'
            RETURN
        END
        IF    '${direction}' == 'left'
            ${start_x}=    BuiltIn.Evaluate    ${location['x']} + (${element_size['width']} *${swipe_screen['persent_start']})
            ${start_y}=    BuiltIn.Evaluate    ${location['y']} + (${element_size['height']}/2)
            ${end_x}=    BuiltIn.Evaluate    ${location['x']} + (${element_size['width']} * ${swipe_screen['persent_end']})
            ${end_y}=    BuiltIn.Set Variable    ${start_y}
        ELSE IF    '${direction}' == 'right'
            ${start_x}=    BuiltIn.Evaluate    ${location['x']}+(${element_size['width']}*${swipe_screen['persent_end']})
            ${start_y}=    BuiltIn.Evaluate    ${location['y']}+(${element_size['height']}/2)
            ${end_x}=    BuiltIn.Evaluate    ${location['x']}+(${element_size['width']}*${swipe_screen['persent_start']})
            ${end_y}=    BuiltIn.Set Variable    ${start_y}
        ELSE IF    '${direction}' == 'down'
            ${start_x}=    BuiltIn.Evaluate    ${location['x']}+(${element_size['width']}/2)
            ${start_y}=    BuiltIn.Evaluate    ${location['y']}+(${element_size['height']}*${swipe_screen['persent_start']})
            ${end_x}=    BuiltIn.Evaluate    ${start_x}
            ${end_y}=    BuiltIn.Set Variable    ${location['y']}+(${element_size['height']}*${swipe_screen['persent_end']})
        ELSE IF    '${direction}' == 'up'
            ${start_x}=    BuiltIn.Evaluate    ${location['x']}+(${element_size['width']}/2)
            ${start_y}=    BuiltIn.Evaluate    ${location['y']}+(${element_size['height']}*${swipe_screen['persent_end']})
            ${end_x}=    BuiltIn.Evaluate    ${start_x}
            ${end_y}=    BuiltIn.Set Variable    ${location['y']}+(${element_size['height']}*${swipe_screen['persent_start']})
        END
        AppiumLibrary.Swipe    start_x=${start_x}    start_y=${start_y}    end_x=${end_x}    end_y=${end_y}    duration=${duration}
    END
    BuiltIn.Fail    Element '${target_locator}' not visible after swiping ${max_swipe}

Tap element when ready
    [Documentation]    สัมผัส element เมื่อพร้อม
    [Arguments]    ${locator}
    Wait until element enable    locator=${locator}
    AppiumLibrary.Tap    ${locator}

Wait until element enable
    [Documentation]    รอจนกว่า element จะใช้งานได้
    [Arguments]    ${locator}    ${timeout}=${wait_timeout['normally']['short_timeout']}
    AppiumLibrary.Expect Element    ${locator}    enabled   ${timeout}

Wait until element not visible
    [Documentation]    รอจนกว่า Element จะไม่ปรากฏขึ้นมา
    [Arguments]    ${locator}    ${timeout}=${wait_timeout['normally']['short_timeout']}
    AppiumLibrary.Expect Element    ${locator}    not visible    ${timeout}

Wait until element visible
    [Documentation]    รอจนกว่า Element จะปรากฏขึ้นมา
    [Arguments]    ${locator}    ${timeout}=${wait_timeout['normally']['short_timeout']}
    AppiumLibrary.Expect Element    ${locator}    visible    ${timeout}