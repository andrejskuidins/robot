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
    ${month}    Get Time    format=%b
    Log To Console    ${month}


Wait Until Page Contains Element    
    Wait Until Page Contains Element        //html/body/div[1]/div[3]/div/div[3]/div[2]/div[16]/div[2]


Input Text
    FOR   ${week}    IN RANGE    41    45
        Click Element                //html/body/div[1]/div[2]/div/div[2]/div/div/div/div[${week}]/div
        Scroll Element Into View            //html/body/div[1]/div[3]/div/div[3]/div[2]/div[24]/div[2]
        FOR   ${day}    IN RANGE    2    7
            ${contains}    Get Element Count    //html/body/div[1]/div[3]/div/div[3]/div[2]/div[16]/div[${day}]/input
            IF    ${contains}
                ${CLASS}    Get Element Attribute    //html/body/div[1]/div[3]/div/div[3]/div[2]/div[16]/div[${day}]/input    class
                IF    '${CLASS}' == 'read-only'
                    Log To Console    ${CLASS}
                ELSE
                    Click Element             //html/body/div[1]/div[3]/div/div[3]/div[2]/div[16]/div[${day}]
                    Input Text                //html/body/div[1]/div[3]/div/div[3]/div[2]/div[16]/div[${day}]/input    8
                END
            END
        END
    END
    # [Teardown]        Close Browser

Click Month 
    Click Element                //html/body/div[1]/div[2]/div/div[2]/div/div/div/div[45]/div
