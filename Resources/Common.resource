*** Settings ***
Library    SeleniumLibrary

*** Variables ***


*** Keywords ***
Begin Web Test
    [Arguments]    ${browser}
    Open Browser    about:blank    ${browser}
    Maximize Browser Window

End Web Test
    Close Browser