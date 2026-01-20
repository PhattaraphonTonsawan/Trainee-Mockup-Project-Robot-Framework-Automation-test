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
    AppiumLibrary.Hide Keyboard    key_name=Done
    AppiumLibrary.Element Should Contain Text    ${locator}    ${text}

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
    ...    noReset=false
    ...    fullReset=false
    ...    newCommandTimeout=300
    ...    autoGrantPermissions=true
    ...    disableWindowAnimation=true

Replace locator
    [Documentation]    แทนที่ข้อความภายใน locator (default=***replace***) ด้วยข้อความใหม่
    [Arguments]    ${locator}    ${replace_text}    ${target_text}=***replace***
    ${locator_replaced}=    String.Replace String    ${locator}    ${target_text}    ${replace_text}
    Wait until element visible    locator=${locator_replaced}
    RETURN    ${locator_replaced}

Swipe element by direction
    [Documentation]    เลื่อน Element ที่ต้องการโดยการระบุทิศทางการไหล
    [Arguments]    ${locator}    ${direction}    ${percent_start}=0.9    ${percent_end}=0.1    ${duration}=1000
    AppiumLibrary.Expect Element    locator=${locator}    state=visible
    ${location}=    AppiumLibrary.Get Element Location    ${locator}
    ${element_size}=    AppiumLibrary.Get Element Size    ${locator}
    IF    '${direction}' == 'left'
        ${start_x}=    BuiltIn.Evaluate    ${location['x']} + (${element_size['width']} * ${percent_start})
        ${start_y}=    BuiltIn.Evaluate    ${location['y']} + (${element_size['height']}/2)
        ${end_x}=    BuiltIn.Evaluate    ${location['x']} + (${element_size['width']} * ${percent_end})
        ${end_y}=    BuiltIn.Set Variable    ${start_y}
    ELSE IF    '${direction}' == 'right'
        ${start_x}=    BuiltIn.Evaluate    ${location['x']}+(${element_size['width']}*${percent_end})
        ${start_y}=    BuiltIn.Evaluate    ${location['y']}+(${element_size['height']}/2)
        ${end_x}=    BuiltIn.Evaluate    ${location['x']}+(${element_size['width']}*${percent_start})
        ${end_y}=    BuiltIn.Set Variable    ${start_y}
    ELSE IF    '${direction}' == 'down'
        ${start_x}=    BuiltIn.Evaluate    ${location['x']}+(${element_size['width']}/2)
        ${start_y}=    BuiltIn.Evaluate    ${location['y']}+(${element_size['height']}*${percent_start})
        ${end_x}=    BuiltIn.Evaluate    ${start_x}
        ${end_y}=    BuiltIn.Set Variable    ${location['y']}+(${element_size['height']}*${percent_end})
    ELSE IF    '${direction}' == 'up'
        ${start_x}=    BuiltIn.Evaluate    ${location['x']}+(${element_size['width']}/2)
        ${start_y}=    BuiltIn.Evaluate    ${location['y']}+(${element_size['height']}*${percent_end})
        ${end_x}=    BuiltIn.Evaluate    ${start_x}
        ${end_y}=    BuiltIn.Set Variable    ${location['y']}+(${element_size['height']}*${percent_start})
    END
    AppiumLibrary.Swipe    start_x=${start_x}    start_y=${start_y}    end_x=${end_x}    end_y=${end_y}    duration=${duration}

Swipe until target element is visible
    [Documentation]    เลื่อนหน้าจอจนกว่าจะเจอ Element ทื่ต้องการ
    [Arguments]    ${locator}    ${direction}='swipe up'    ${duration}=1000    ${timeout}=${wait_timeout['normally']['short_timeout']}
    ${is_visible}=    Run Keyword And Return Status    Wait until element visible    ${locator}    ${timeout}
    ${lower_text}=    String.Convert To Lower Case    string=${direction}
    WHILE    !${is_visible}
        IF    '${lower_text}'== 'swipe up'
            AppiumLibrary.Swipe By Percent    start_x=50    start_y=80    end_x=50    end_y=20    duration=${duration}
            ${is_visible}=    Run Keyword And Return Status    AppiumLibrary.Expect Element    locator=${locator}    state='visible'    timeout=${timeout}
        ELSE IF    '${lower_text}'== 'swipe down'
            AppiumLibrary.Swipe By Percent    start_x=50    start_y=20    end_x=50    end_y=80    duration=${duration}
            ${is_visible}=    Run Keyword And Return Status    AppiumLibrary.Expect Element    locator=${locator}    state='visible'    timeout=${timeout}
        ELSE IF    '${lower_text}'=='swipe right'
            AppiumLibrary.Swipe By Percent    start_x=20    start_y=20    end_x=80    end_y=20    duration=${duration}
            ${is_visible}=    Run Keyword And Return Status    AppiumLibrary.Expect Element    locator=${locator}    state='visible'    timeout=${timeout}
        ELSE IF    '${lower_text}'=='swipe left'
            AppiumLibrary.Swipe By Percent    start_x=90    start_y=50    end_x=10    end_y=50    duration=${duration}
            ${is_visible}=    Run Keyword And Return Status    AppiumLibrary.Expect Element    locator=${locator}    state='visible'    timeout=${timeout}
        END
    END

Tap element when ready
    [Documentation]    สัมผัส element เมื่อพร้อม
    [Arguments]    ${locator}
    Wait until element enable    locator=${locator}
    AppiumLibrary.Click Element    ${locator}

Wait until element enable
    [Documentation]    รอจนกว่า element จะใช้งานได้
    [Arguments]    ${locator}    ${timeout}=${wait_timeout['normally']['short_timeout']}
    AppiumLibrary.Expect Element    locator=${locator}    state='enabled'   timeout=${timeout}

Wait until element not visible
    [Documentation]    รอจนกว่า Element จะไม่ปรากฏขึ้นมา
    [Arguments]    ${locator}    ${timeout}=${wait_timeout['normally']['short_timeout']}
    AppiumLibrary.Expect Element    locator=${locator}    state='not visible'    timeout=${timeout}

Wait until element visible
    [Documentation]    รอจนกว่า Element จะปรากฏขึ้นมา
    [Arguments]    ${locator}    ${timeout}=${wait_timeout['normally']['short_timeout']}
    AppiumLibrary.Expect Element    locator=${locator}    state='visible'    timeout=${timeout}