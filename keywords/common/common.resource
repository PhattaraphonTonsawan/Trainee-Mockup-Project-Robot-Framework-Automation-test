*** Settings ***
Resource    ${CURDIR}/../../resources/import.resource

*** Keywords ***
Replace locator
    [Documentation]    แทนที่ข้อความภายใน locator (default=***replace***) ด้วยข้อความใหม่
    [Arguments]    ${locator}    ${replace_text}    ${target_text}=***replace***
    ${locator_replaced}=    String.Replace String    ${locator}    ${target_text}    ${replace_text}
    RETURN    ${locator_replaced}

Sanitize text
    [Documentation]    ลบอักขระพิเศษที่ไม่อนุญาตออกจากข้อความ เช่น $ / \ : * ? " < > | , และลบช่องว่างด้านหน้า/หลัง
    [Arguments]    ${text}
    ${clean_text}=    String.Remove String    ${text}    $    /    \\    :    *    ?    "    <    >    |    ,
    ${clean_text}=    String.Strip String    ${clean_text}
    RETURN    ${clean_text}