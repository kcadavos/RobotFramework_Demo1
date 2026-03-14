*** Settings ***
Library     SeleniumLibrary

***Variables***
${TOPNAV_SIGNIN_LINK}    Sign In
${SIGNIN_PAGE_HEADER_LABEL}   Login
${TOPNAV_SIGNOUT_LINK}    Sign Out
${SIGNOUT_PAGE_HEADER_LABEL}    Signed Out


*** Keywords ***

Load SignIn
    Click Link    ${TOPNAV_SIGNIN_LINK}

Verify SignIn Page Loaded
    Wait Until Page Contains   ${SIGNIN_PAGE_HEADER_LABEL}

LOad SignOut
    Click Link   ${TOPNAV_SIGNOUT_LINK}

Verify SignOut Page Loaded    
    Wait Until Page Contains   ${SIGNOUT_PAGE_HEADER_LABEL}