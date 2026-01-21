*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CART_URL}                    https://www.saucedemo.com/cart.html
${CART_HEADER_LABEL}           Your Cart

*** Keywords ***
Verify Page Loaded
    Location Should Be         ${CART_URL} 
    Wait Until Page Contains   ${CART_HEADER_LABEL} 
Click "Checkout" button
    Click Button               css=[data-test="checkout"]