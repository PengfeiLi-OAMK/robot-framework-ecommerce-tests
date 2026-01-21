*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${COMPLETE_URL}                    https://www.saucedemo.com/checkout-complete.html
${COMPLETE_HEADER_LABEL}           Checkout: Complete!
*** Keywords ***
Verify page loaded
    Location Should Be             ${COMPLETE_URL}          
    Wait Until Page Contains       ${COMPLETE_HEADER_LABEL}   