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

Get Time
    ${month}    Get Time    format=month
    Log To Console    ${month}

Wait Until Page Contains Element    
    Wait Until Page Contains Element        //html/body/div[1]/div[3]/div/div[3]/div[2]/div[16]/div[2]

Scroll Element Into View
    Scroll Element Into View            //html/body/div[1]/div[3]/div/div[3]/div[2]/div[24]/div[2]

Input Text
    FOR   ${i}    IN RANGE    2    7
        ${contains}    Get Element Count    //html/body/div[1]/div[3]/div/div[3]/div[2]/div[16]/div[${i}]/input
        IF    ${contains}
            ${CLASS}    Get Element Attribute    //html/body/div[1]/div[3]/div/div[3]/div[2]/div[16]/div[${i}]/input    class
            IF    '${CLASS}' == 'read-only'
                Log To Console    ${CLASS}
            ELSE
                Click Element             //html/body/div[1]/div[3]/div/div[3]/div[2]/div[16]/div[${i}]
                Input Text                //html/body/div[1]/div[3]/div/div[3]/div[2]/div[16]/div[${i}]/input    8
            END
        END
    END
    # [Teardown]        Close Browser

Click Month
    Click Element                //html/body/div[1]/div[2]/div/div[2]/div/div/div/div[41]/div

Scroll Element Into View 2
    Scroll Element Into View            //html/body/div[1]/div[3]/div/div[3]/div[2]/div[24]/div[2]

Input Text
    FOR   ${i}    IN RANGE    2    7
        ${contains}    Get Element Count    //html/body/div[1]/div[3]/div/div[3]/div[2]/div[16]/div[${i}]/input
        IF    ${contains}
            ${CLASS}    Get Element Attribute    //html/body/div[1]/div[3]/div/div[3]/div[2]/div[16]/div[${i}]/input    class
            IF    '${CLASS}' == 'read-only'
                Log To Console    ${CLASS}
            ELSE
                Click Element             //html/body/div[1]/div[3]/div/div[3]/div[2]/div[16]/div[${i}]
                Input Text                //html/body/div[1]/div[3]/div/div[3]/div[2]/div[16]/div[${i}]/input    8
            END
        END
    END
    # [Teardown]        Close Browser

Click Month
    Click Element                //html/body/div[1]/div[2]/div/div[2]/div/div/div/div[42]/div

Scroll Element Into View 3
    Scroll Element Into View            //html/body/div[1]/div[3]/div/div[3]/div[2]/div[24]/div[2]