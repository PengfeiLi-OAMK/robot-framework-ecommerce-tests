*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${PRODUCTS_URL}                    https://www.saucedemo.com/inventory.html
${PRODUCTS_HEADER_LABEL}             Products
${PRODUCTS_LIST_ELEMENT}             css=[data-test=inventory-list] 

*** Keywords ***
Verify page loaded
    Location Should Be               ${PRODUCTS_URL} 
    Wait Until Page Contains         ${PRODUCTS_HEADER_LABEL} 
    Wait Until Element Is Visible    ${PRODUCTS_LIST_ELEMENT} 