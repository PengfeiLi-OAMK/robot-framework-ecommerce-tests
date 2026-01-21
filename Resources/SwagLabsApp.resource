*** Settings ***
Resource       ./PO/LogIn.resource
Resource       ./PO/Products.resource
Resource       ./PO/TopNav.resource
Resource       ./Common.resource
Resource       ./PO/Cart.resource
Resource       ./PO/CheckOut.resource
Resource       ./PO/Complete.resource

*** Variables ***
${VALID_USERNAME}        standard_user
${VALID_PASSWORD}        secret_sauce
${PRODUCT_1}             Sauce Labs Backpack
${PRODUCT_NUMBER}        1
${CUSTOMER_FIRST_NAME}   John
${CUSTOMER_LAST_NAME}    Doe
${CUSTOMER_POSTAL_CODE}  12345
*** Keywords ***
Login As Standard User
    Go to "Login" Page
    Login With Valid Credentials
    Verify Login Successful
Go to "Login" Page
    LogIn.Navigate To   ${URL}
    LogIn.Verify page loaded
Login With Valid Credentials
    Login.Fill "Username" field      ${VALID_USERNAME}
    Login.Fill "Password" field      ${VALID_PASSWORD}
    Login.Click "Submit" button
Verify Login Successful
    Products.Verify page loaded
Login With Invalid Credentials
    [Arguments]    ${username}       ${password}
    Login.Fill "Username" field      ${username}
    Login.Fill "Password" field      ${password}
    Login.Click "Submit" button
Verify Login Unsuccessful
    [Arguments]                      ${expected_error_msg}
    LogIn.Verify Error Message       ${expected_error_msg}
Add "Backpack" To Cart
    Products.Add To Cart             ${PRODUCT_1}
Verify Item Number In Cart is Correct
    TopNav.Verify Item Added To Cart    ${PRODUCT_NUMBER}
Remove "Backpack" From Cart
    Products.Remove From Cart        ${PRODUCT_1}
Verify no items in Cart
    TopNav.Verify Cart is Empty    
Go to "Cart" Page
    TopNav.Click "Cart" Link
    Cart.Verify page loaded
Start Checkout
    Cart.Click "Checkout" button
    CheckOut.Verify Info Page Loaded
Add Checkout Information
    CheckOut.Fill Customer Information Fields    ${CUSTOMER_FIRST_NAME}   ${CUSTOMER_LAST_NAME}    ${CUSTOMER_POSTAL_CODE}
    CheckOut.Click "Continue" button
    CheckOut.Verify Overview Page Loaded
Complete Checkout
    CheckOut.Click "Finish" button
    Complete.Verify page loaded


    