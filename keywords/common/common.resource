*** Keywords ***
Write Log Message
    [Documentation]    Logs a message with specific level.
    ...    Levels: TRACE, DEBUG, INFO, WARN, ERROR
    [Arguments]    ${message}    ${level}=INFO
    BuiltIn.Log    ${message}    level=${level}

Should contain text
    [Documentation]    Verifies that the given text contains the expected substring.
    [Arguments]    ${full_text}    ${substring}    ${msg}=None
    BuiltIn.Should Contain    ${full_text}    ${substring}    ${msg}

Wait for seconds
    [Documentation]    Waits for given number of seconds.
    [Arguments]    ${seconds}=1
    BuiltIn.Sleep    ${seconds}s