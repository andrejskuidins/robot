*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input Username    andrejs.kuidins@1nce.com
    Input Password    ${VALID PASSWORD}
    Submit Credentials
    Welcome Page Should Be Open

Wait Until Page Contains Element    
    Wait Until Page Contains Element        //html/body/div[1]/div[3]/div/div[3]/div[2]/div[15]/div[6]/input

Scroll Element Into View
    Scroll Element Into View            //html/body/div[1]/div[3]/div/div[3]/div[2]/div[16]/div[6]

Click Element
    Click Element             //html/body/div[1]/div[3]/div/div[3]/div[2]/div[15]/div[6]

Input Text
    Input Text                //html/body/div[1]/div[3]/div/div[3]/div[2]/div[15]/div[6]/input    1

