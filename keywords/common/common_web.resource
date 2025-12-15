*** Settings ***
Resource    ${CURDIR}/../../resources/import.resource

*** Keywords ***
Check element text when visible
    [Documentation]    ตรวจสอบว่า element ปรากฏอยู่บนหน้า และตรวจสอบว่าข้อความภายใน element ตรงกับค่าที่กำหนด
    [Arguments]    ${locator}    ${text}
    Scroll into element and wait until element visible    locator=${locator}
    SeleniumLibrary.Element Should Contain    ${locator}    ${text}

Click element when ready
    [Documentation]    กด element เมื่อพร้อมใช้งาน
    [Arguments]    ${locator}
    Scroll into element and wait until element ready    locator=${locator}
    SeleniumLibrary.Click Element    ${locator}

Close all browser
    [Documentation]    ปิดหน้าต่าง browsers
    SeleniumLibrary.Close All Browsers

Get element text when visible
    [Documentation]    ดึงข้อความจาก element หลังจากตรวจสอบว่า element มองเห็นได้แล้ว และส่งค่าข้อความกลับไปยังตัวแปร
    [Arguments]    ${locator}
    Scroll into element and wait until element visible    locator=${locator}
    ${text}=    SeleniumLibrary.Get Text    ${locator}
    RETURN    ${text}

Input text when ready
    [Documentation]    กรอกข้อความลงใน element ที่กำหนด
    [Arguments]    ${locator}    ${text}
    Scroll into element and wait until element ready    locator=${locator}
    SeleniumLibrary.Input Text    ${locator}    ${text}

Open web browser and maximize window
    [Documentation]    เปิดเบราว์เซอร์ Chrome ไปยัง URL ที่กำหนด พร้อมตั้งค่า Option สำหรับการทดสอบ
    ...                - เปิดในโหมดไม่ระบุตัวตน เพื่อป้องกันปัญหา Cache และการแจ้งเตือนความปลอดภัย
    ...                - ปิดระบบ Password Manager และ Pop-up ถามบันทึกรหัสผ่าน
    [Arguments]    ${url}    ${is_headless}=${web_config['headless_mode']}
    ${chrome_options}=    BuiltIn.Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    BuiltIn.Call Method    ${chrome_options}    add_argument    --incognito
    ${prefs}=    BuiltIn.Create Dictionary    
    ...    credentials_enable_service=${False}    
    ...    profile.password_manager_enabled=${False}
    BuiltIn.Call Method    ${chrome_options}    add_experimental_option    prefs    ${prefs}
    IF    ${is_headless}
        SeleniumLibrary.Open Browser    ${url}    ${web_config['browser']['headless']}   options=${chrome_options}
    ELSE
        SeleniumLibrary.Open Browser    ${url}    ${web_config['browser']['gui']}    options=${chrome_options}
    END
    
    SeleniumLibrary.Maximize Browser Window

Replace locator and wait until element visible
    [Documentation]
    ...    แทนที่ข้อความภายใน locator (default=***replace***) ด้วยข้อความใหม่
    ...    จากนั้นตรวจสอบว่า locator ใหม่มีอยู่ในหน้าหรือไม่ และสามารถใช้งานได้
    [Arguments]    ${locator}    ${replace_text}    ${target_text}=***replace***
    ${locator_replaced}=    String.Replace String    ${locator}    ${target_text}    ${replace_text}
    Scroll into element and wait until element visible    locator=${locator_replaced}
    RETURN    ${locator_replaced}

Select dropdown option when ready
    [Documentation]    เลือกตัวเลือกจาก dropdown โดยใช้ value หลังจากตรวจสอบว่า element พร้อมให้ทำงาน
    [Arguments]    ${locator}    ${option}
    Scroll into element and wait until element ready    locator=${locator}
    SeleniumLibrary.Select From List By Value    ${locator}    ${option}

Screenshot page
    [Documentation]    บันทึกภาพหน้าจอโดยตั้งชื่อไฟล์ตาม timestamp เพื่อหลีกเลี่ยงไฟล์ชื่อซ้ำ และส่งคืน path ของไฟล์
    [Arguments]    ${file_prefix}=screenshot
    ${timestamp}=    DateTime.Get Current Date    result_format=%Y%m%d_%H%M%S
    ${file_path}=    BuiltIn.Set Variable    ${OUTPUT DIR}/screenshot/${file_prefix}_${timestamp}.png
    SeleniumLibrary.Capture Page Screenshot    ${file_path}
    BuiltIn.Log To Console    Screenshot saved to ${file_path}
    RETURN    ${file_path}

Scroll into element and wait until element ready
    [Documentation]    ตรวจสอบว่า element ถูกโหลดใน DOM จากนั้นให้ element อยู่ในมุมมอง และรอจนกว่าจะพร้อมใช้งาน
    [Arguments]    ${locator}    ${timeout}=${wait_timeout['normally']['short_timeout']}
    SeleniumLibrary.Wait Until Page Contains Element    ${locator}    ${timeout}
    SeleniumLibrary.Scroll Element Into View    ${locator}
    SeleniumLibrary.Wait Until Element Is Enabled    ${locator}    ${timeout}

Scroll into element and wait until element visible
    [Documentation]    ตรวจสอบว่า element ถูกโหลดใน DOM จากนั้นให้ element อยู่ในมุมมอง และรอจนกว่าจะมองเห็นได้
    [Arguments]    ${locator}    ${timeout}=${wait_timeout['normally']['short_timeout']}
    SeleniumLibrary.Wait Until Page Contains Element    ${locator}    ${timeout}
    SeleniumLibrary.Scroll Element Into View    ${locator}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    ${timeout}

Wait and verify element value
    [Documentation]    ตรวจสอบค่า value ใน element
    [Arguments]    ${locator}    ${expected_value}
    Scroll into element and wait until element visible    locator=${locator}
    ${actual_value}=    SeleniumLibrary.Get Property    ${locator}    value
    BuiltIn.Should Be Equal    ${actual_value}    ${expected_value}    msg=Text input verification failed for ${locator}