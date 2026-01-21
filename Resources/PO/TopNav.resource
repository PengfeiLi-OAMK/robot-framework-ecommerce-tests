*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CART_BADGE_ELEMENT}      css=[data-test="shopping-cart-badge"]
${CART_LINK_ELEMENT}       css=[data-test="shopping-cart-link"]

*** Keywords ***
Verify Item Added To Cart
    [Arguments]                          ${expected_item_count}
    Wait Until Element Is Visible        ${CART_BADGE_ELEMENT}
    Element Text Should Be               ${CART_BADGE_ELEMENT}    ${expected_item_count}
Very Cart is Empty
    Wait Until Element Is Not Visible    ${CART_BADGE_ELEMENT}
Click "Cart" Link
    Click Link                           ${CART_LINK_ELEMENT}