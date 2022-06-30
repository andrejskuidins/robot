*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           CryptoLibrary          variable_decryption=True
Library           SeleniumLibrary        plugins=CryptoLibrary.Plugin

*** Variables ***
${SERVER}         ehourapp.com
${BROWSER}        Firefox
${DELAY}          0
${VALID USER}     andrejs.kuidins@1nce.com
${VALID PASSWORD}     crypt:yBWx2uZno29msP1/lG5dLTj/Y7A2QNpep5CIeZdXMQgiPQW5Yfvl/vQJtxRTXRS/ezt9IEUFD2hc4g==
${LOGIN URL}      https://${SERVER}/login.html
${WELCOME URL}    https://${SERVER}/eh/track-hours
${ERROR URL}      https://${SERVER}/error.html

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    eHour - Log in

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    username    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit Credentials
    Click Button    submit

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    Track your hours - eHour
