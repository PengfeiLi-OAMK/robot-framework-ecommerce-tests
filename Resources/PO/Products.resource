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
Add To Cart
    [Arguments]    ${product_name}
    ${product_add_button}=    Set Variable   xpath=//div[text()='${product_name}']/ancestor::div[@class='inventory_item']//button[text()='Add to cart']
    Click Button    ${product_add_button}

Remove From Cart
    [Arguments]    ${product_name}
    ${product_remove_button}=    Set Variable   xpath=//div[text()='${product_name}']/ancestor::div[@class='inventory_item']//button[text()='Remove']
    Click Button    ${product_remove_button}
