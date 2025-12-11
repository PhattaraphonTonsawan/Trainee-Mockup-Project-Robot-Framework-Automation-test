*** Settings ***
Resource    ${CURDIR}/../../resources/import.resource

*** Keywords ***
Click element and wait
    [Documentation]
    ...    Scroll and click to element and wait until the page is loaded after
    ...    the click, using SeleniumLibrary.
    [Arguments]    ${locator}    ${wait_element_locator}=${None}    ${timeout}=10s
    SeleniumLibrary.Scroll Element Into View    ${locator}
    SeleniumLibrary.Click Element    ${locator}
    BuiltIn.Run Keyword If    "${wait_element_locator}" != "${None}"
    ...    SeleniumLibrary.Wait Until Page Contains Element    ${wait_element_locator}    ${timeout}

Close this browser
    [Documentation]    Close browser base on SeleniumLibrary
    SeleniumLibrary.Close Browser

Close every browser
    [Documentation]    Close all browser base on SeleniumLibrary
    SeleniumLibrary.Close All Browsers

Element should contain text
    [Documentation]    Verify element contains specific text base on SeleniumLibrary
    [Arguments]    ${locator}    ${expected_text}
    SeleniumLibrary.Element Text Should Be    ${locator}    ${expected_text}    msg=Element text mismatch

Get element text
    [Documentation]    Get text from element base on SeleniumLibrary
    [Arguments]    ${locator}
    SeleniumLibrary.Scroll Element Into View    ${locator}
    ${text}=    SeleniumLibrary.Get Text    ${locator}
    RETURN    ${text}

Go to url
    [Documentation]    Go to url in browser base on SeleniumLibrary
    [Arguments]    ${url}    ${browser}
    SeleniumLibrary.Open Browser    ${url}    ${browser}
    SeleniumLibrary.Go To    ${url}

Input text and verify
    [Documentation]
    ...    Scroll and input text into a field
    ...    and verify the text value is correctly set base on SeleniumLibrary
    [Arguments]    ${locator}    ${text}
    SeleniumLibrary.Scroll Element Into View    ${locator}
    SeleniumLibrary.Input Text    ${locator}    ${text}
    ${current_value}=    SeleniumLibrary.Get Property    ${locator}    value
    BuiltIn.Should Be Equal    ${current_value}    ${text}    msg=Text input verification failed for ${locator}

Open new browser
    [Documentation]    Open browser base on SeleniumLibrary
    [Arguments]    ${url}    ${browser}
    SeleniumLibrary.Open Browser    ${url}    ${browser}

Scroll to element
    [Documentation]    Scroll the page until the element is in view base on SeleniumLibrary
    [Arguments]    ${locator}
    SeleniumLibrary.Scroll Element Into View    ${locator}

Select dropdown option
    [Documentation]    Select an option from dropdown by either value base on SeleniumLibrary
    [Arguments]    ${locator}    ${option}
    SeleniumLibrary.Scroll Element Into View    ${locator}
    SeleniumLibrary.Select From List By Value    ${locator}    ${option}

Screenshot page
    [Documentation]    Take a screenshot and save with timestamp base on SeleniumLibrary
    [Arguments]    ${file_prefix}=screenshot
    ${timestamp}=    DateTime.Get Current Date    result_format=%Y%m%d_%H%M%S
    ${file_path}=    BuiltIn.Set Variable    ${OUTPUT DIR}/screenshot/${file_prefix}_${timestamp}.png
    SeleniumLibrary.Capture Page Screenshot    ${file_path}
    BuiltIn.Log To Console    Screenshot saved to ${file_path}
    RETURN    ${file_path}

Wait for element is ready
    [Documentation]
    ...    Check element is append in DOM and scroll into view and next to check Visible -> Enable
    [Arguments]    ${locator}    ${timeout}=10s
    SeleniumLibrary.Wait Until Page Contains Element    ${locator}    ${timeout}
    SeleniumLibrary.Scroll Element Into View    ${locator}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    ${timeout}
    SeleniumLibrary.Wait Until Element Is Enabled    ${locator}    ${timeout}