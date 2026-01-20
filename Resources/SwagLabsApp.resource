*** Settings ***
Resource       ./PO/LogIn.resource
Resource       ./PO/Products.resource
Resource       ./Common.resource

*** Variables ***
${VALID_USERNAME}     standard_user
${VALID_PASSWORD}     secret_sauce

*** Keywords ***
Go to "Login" Page
    LogIn.Navigate To   ${URL}
    LogIn.Verify page loaded
Login With Valid Credentials
    Login.Fill "Username" field      ${VALID_USERNAME}
    Login.Fill "Password" field      ${VALID_PASSWORD}
    Login.Click "Submit" button
Verify Login Successful
    Products.Verify page loaded