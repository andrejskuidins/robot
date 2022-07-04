*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot
Library           String

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input Username    andrejs.kuidins@1nce.com
    Input Password    ${VALID PASSWORD}
    Submit Credentials
    Welcome Page Should Be Open

Wait Until Page Contains Element    
    Wait Until Page Contains Element        //html/body/div[1]/div[3]/div/div[3]/div[2]/div[16]/div[1]/div/div/div


Execute JavaScript
    ${month_name}        Execute JavaScript    currentDate = new Date(); return new Date(currentDate).toLocaleString('de-DE',{month:'short'});
    ${month_name_lc}     Convert To Lower Case    ${month_name}
    Set Global Variable    ${month_name_lc}

Input Text
    FOR   ${div}    IN RANGE    40    46
        Click Element                  //html/body/div[1]/div[2]/div/div[2]/div/div/div/div[${div}]/div/div[2]/div[2]
        ${month_string}    Get Text    //html/body/div[1]/div[2]/div/div[2]/div/div/div/div[${div}]/div/div[2]/div[2]
        ${month_string_lc}          Convert To Lower Case    ${month_string}
        Should Contain    ${month_string_lc}    ${month_name_lc}
        Click Element                //html/body/div[1]/div[2]/div/div[2]/div/div/div/div[${div}]/div
        Scroll Element Into View            //html/body/div[1]/div[3]/div/div[3]/div[2]/div[24]/div[2]
        FOR   ${day}    IN RANGE    2    7
            ${CLASS}    Get Element Attribute    //html/body/div[1]/div[3]/div/div[3]/div[2]/div[16]/div[${day}]/input    class
            IF    '${CLASS}' != 'read-only'
                Click Element             //html/body/div[1]/div[3]/div/div[3]/div[2]/div[16]/div[${day}]
                Input Text                //html/body/div[1]/div[3]/div/div[3]/div[2]/div[16]/div[${day}]/input    8
            END
        END
    END
    # [Teardown]        Close Browser

Click Month 
    Click Element                //html/body/div[1]/div[2]/div/div[2]/div/div/div/div[46]/div
