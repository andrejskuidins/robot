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
    Wait Until Page Contains Element        //html/body/div[1]/div[3]/div/div[3]/div[2]/div[16]/div[2]


Execute JavaScript
    ${week_number}    Execute JavaScript    currentDate = new Date(); startDate = new Date(currentDate.getFullYear(), 0, 1); var days = Math.floor((currentDate - startDate) / (24 * 60 * 60 * 1000)); var weekNumber = Math.ceil(days / 7); return weekNumber
    Log To Console    ${week_number}
    Set Global Variable    ${week_number}

Input Text
    FOR   ${week}    IN RANGE    ${week_number}+14    ${week_number}+19
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
                    Input Text                //html/body/div[1]/div[3]/div/div[3]/div[2]/div[16]/div[${day}]/input    0
                END
            END
        END
    END
    # [Teardown]        Close Browser

Click Month 
    Click Element                //html/body/div[1]/div[2]/div/div[2]/div/div/div/div[46]/div
