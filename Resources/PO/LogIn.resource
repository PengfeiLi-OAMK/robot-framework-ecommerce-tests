*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_HEADER_LABEL}           Swag Labs
${LOGIN_USERNAME_TEXTBOX}       id=user-name
${LOGIN_PASSWORD_TEXTBOX}       id=password
${LOGIN_SUBMIT_BUTTON}          id=login-button
${LOGIN_ERROR_ELEMENT}          css=[data-test="error"]

*** Keywords ***
Navigate To
    [Arguments]    ${url}
    Go To          ${url}
Verify page loaded
    Wait Until Page Contains   ${LOGIN_HEADER_LABEL}

Fill "Username" field
    [Arguments]    ${username}
    Input Text     ${LOGIN_USERNAME_TEXTBOX}    ${username}
Fill "Password" field
    [Arguments]    ${password} 
    Input Text     ${LOGIN_PASSWORD_TEXTBOX}    ${password} 
Click "Submit" button
    Click Button   ${LOGIN_SUBMIT_BUTTON}

Verify Error Message
    [Arguments]    ${expected_error_msg}
    Wait Until Element Is Visible    ${LOGIN_ERROR_ELEMENT}
    Element Should Contain    ${LOGIN_ERROR_ELEMENT}    ${expected_error_msg}