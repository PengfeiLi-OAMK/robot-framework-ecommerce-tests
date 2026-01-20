*** Settings ***
Documentation    Valid Login related test cases
Resource     ../Resources/Common.resource
Resource     ../Resources/SwagLabsApp.resource
Test Setup    Begin Web Test 
Test Teardown    End Web Test
# run script: robot -d results tests/Login_Valid.robot

*** Test Cases ***
Should be able to login with valid credentials
    [Tags]    login    smoke
    SwagLabsApp.Go to "Login" Page
    SwagLabsApp.Login With Valid Credentials
    SwagLabsApp.Verify Login Successful
  


