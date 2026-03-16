*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${Submit_BUTTON}    id=submit-id
${SIGNIN_PAGE_HEADER_LABEL}   Login

*** Keywords ***
Verify SignIn Page Loaded
    Wait Until Page Contains   ${SIGNIN_PAGE_HEADER_LABEL} 

Enter Email
    [Arguments]    ${EMAIL}
    Input Text    id:email-id    ${EMAIL}

Enter Password 
    [Arguments]    ${PASSWORD}
    Input Text    id:password       ${PASSWORD}

Click "Submit" button
    Click Button   ${Submit_BUTTON}
    