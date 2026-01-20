*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${PRODUCTS_HEADER_LABEL}             Products
${PRODUCTS_LIST_ELEMENT}             css=[data-test=inventory-list] 

*** Keywords ***
Verify page loaded
    Wait Until Page Contains         ${PRODUCTS_HEADER_LABEL} 
    Wait Until Element Is Visible    ${PRODUCTS_LIST_ELEMENT} 