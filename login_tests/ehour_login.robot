*** Settings ***
Library    SeleniumLibrary    plugins=CryptoLibrary.Plugin


*** Variables ***
${Admins-Password}=    crypt:yBWx2uZno29msP1/lG5dLTj/Y7A2QNpep5CIeZdXMQgiPQW5Yfvl/vQJtxRTXRS/ezt9IEUFD2hc4g==


*** Test Cases ***
Decrypt as Plugin
    Open Browser      https://ehourapp.com/login.html        Chrome
    Input Text        username    andrejs.kuidins@1nce.com
    Input Password    password    ${Admins-Password}
    [Teardown]        Close Browser
