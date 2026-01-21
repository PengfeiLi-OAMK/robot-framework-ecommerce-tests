*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        https://www.saucedemo.com/
*** Keywords ***
Begin Web Test
    # To prevent leaking data popoups in Chrome, open the browser in incognito mode
    IF    "${BROWSER}" == "Chrome" or "${BROWSER}" == "headlesschrome"
        Open Browser    about:blank    ${BROWSER}  options=add_argument("--incognito")
    ELSE
        Open Browser    about:blank    ${BROWSER}
    END
    Maximize Browser Window

End Web Test
    Close Browser