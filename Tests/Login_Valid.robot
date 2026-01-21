*** Settings ***
Documentation    Valid Login related test cases
Test Tags        login    smoke
Resource         ../Resources/Common.resource
Resource         ../Resources/SwagLabsApp.resource
Test Setup       Begin Web Test 
Test Teardown    End Web Test
# run script: robot -d results tests/Login_Valid.robot

*** Test Cases ***
Should be able to login with valid credentials
    SwagLabsApp.Go to "Login" Page
    SwagLabsApp.Login With Valid Credentials
    SwagLabsApp.Verify Login Successful
  


