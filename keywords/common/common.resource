*** Settings ***
Documentation    Common reuseble keywords


*** Keywords ***
Log to console
    [Documentation]
    ...    Logs a message to the console or log.html with a specified level.
    ...    Available levels:
    ...    - TRACE: not shown in terminal, shown in debug console and log.html
    ...    - DEBUG: not shown in terminal, shown in debug console and log.html
    ...    - INFO: shown in terminal, debug console, log.html, and report.html
    ...    - WARN: shown in terminal, debug console, log.html, and report.html
    ...    - ERROR: shown in terminal, debug console, log.html, and report.html
    [Arguments]    ${message}    ${level}=INFO
    BuiltIn.Log    ${message}    ${level}

Should contain text
    [Documentation]    Verifies that the given text contains the expected substring.
    [Arguments]    ${full_text}    ${substring}    ${msg}=None
    BuiltIn.Should Contain    ${full_text}    ${substring}    ${msg}

Wait for seconds
    [Documentation]    Waits for given number of seconds.
    [Arguments]    ${seconds}=1
    BuiltIn.Sleep    ${seconds}s