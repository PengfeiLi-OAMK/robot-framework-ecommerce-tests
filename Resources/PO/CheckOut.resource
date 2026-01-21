*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CHECKOUT_INFO_URL}         https://www.saucedemo.com/checkout-step-one.html
${CHECKOUT_INFO_HEADER}      Checkout: Your Information
${FIRST_NAME_FIELD}          css=[data-test="firstName"]
${LAST_NAME_FIELD}           css=[data-test="lastName"]
${POSTAL_CODE_FIELD}         css=[data-test="postalCode"]
${CONTINUE_BUTTON}           css=[data-test="continue"]
${CHECKOUT_OVERVIEW_URL}     https://www.saucedemo.com/checkout-step-two.html
${CHECKOUT_OVERVIEW_HEADER}  Checkout: Overview
${FINISH_BUTTON}             css=[data-test="finish"]

*** Keywords ***
Verify Info Page Loaded
    Location Should Be         ${CHECKOUT_INFO_URL}
    Wait Until Page Contains   ${CHECKOUT_INFO_HEADER}
 
Fill Customer Information Fields
    [Arguments]    ${first_name}          ${last_name}     ${postal_code}
    Input Text     ${FIRST_NAME_FIELD}    ${first_name}
    Input Text     ${LAST_NAME_FIELD}     ${last_name}
    Input Text     ${POSTAL_CODE_FIELD}   ${postal_code}
Click "Continue" button
    Scroll Element Into View    ${CONTINUE_BUTTON}
    Click Button                ${CONTINUE_BUTTON}
Verify Overview Page Loaded
    Location Should Be          ${CHECKOUT_OVERVIEW_URL}
    Wait Until Page Contains    ${CHECKOUT_OVERVIEW_HEADER}
Click "Finish" button
    Scroll Element Into View    ${FINISH_BUTTON}
    Click Button                ${FINISH_BUTTON}