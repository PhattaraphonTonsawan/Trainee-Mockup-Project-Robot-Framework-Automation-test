*** Settings ***
Resource    ${CURDIR}/../../resources/import.resource

*** Keywords ***
Sanitize text
    [Documentation]    ลบอักขระพิเศษที่ไม่อนุญาตออกจากข้อความ เช่น $ / \ : * ? " < > | , และลบช่องว่างด้านหน้า/หลัง
    [Arguments]    ${text}
    ${clean_text}=    String.Remove String    ${text}    $    /    \\    :    *    ?    "    <    >    |    ,
    ${clean_text}=    String.Strip String    ${clean_text}
    RETURN    ${clean_text}