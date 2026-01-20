*** Settings ***
Documentation    Login related test cases
Resource     ../Resources/Common.resource
Test Setup    Begin Web Test    ${BROWSER}
Test Teardown    End Web Test

*** Variables ***
${BROWSER}    Chrome
${USERNAME}    standard_user
${PASSWORD}    secret_sauce

*** Test Cases ***
Should be able to login with valid credentials
    [Tags]    login    smoke
    Go To    https://www.saucedemo.com/
    Wait Until Page Contains       Swag Labs
    Input Text    id=user-name    ${USERNAME}  
    Input Text    id=password     ${PASSWORD} 
    Click Button    id=login-button
    Wait Until Page Contains Element    css=[data-test=inventory-list] 
*** Keywords ***
