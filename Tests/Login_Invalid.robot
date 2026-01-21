*** Settings ***
Documentation    Invalid Login related test cases
Test Tags        login    regression
Resource         ../Resources/Common.resource
Resource         ../Resources/SwagLabsApp.resource
Test Setup       Begin Web Test 
Test Teardown    End Web Test
Test Template    Should fail to login with invalid credentials
# run script: robot -d results tests/Login_Invalid.robot

*** Test Cases ***    username         password          expected_error_msg
Invalid Username      wrong_user       secret_sauce      Username and password do not match
Invalid Password      standard_user    wrong_pass        Username and password do not match
Locked Out User       locked_out_user  secret_sauce      Sorry, this user has been locked out
Empty Username        ${EMPTY}         secret_sauce      Username is required
Empty Password        standard_user    ${EMPTY}          Password is required

*** Keywords ***
Should fail to login with invalid credentials
    [Arguments]    ${username}    ${password}    ${expected_error_msg}
    SwagLabsApp.Go to "Login" Page
    SwagLabsApp.Login With Invalid Credentials   ${username}    ${password}
    SwagLabsApp.Verify Login Unsuccessful        ${expected_error_msg}