*** Settings ***
Documentation    Shopping related test cases
Resource     ../Resources/Common.resource
Test Setup    Begin Web Test    ${BROWSER}
Test Teardown    End Web Test

*** Variables ***
${BROWSER}    Chrome

*** Test Cases ***

*** Keywords ***
