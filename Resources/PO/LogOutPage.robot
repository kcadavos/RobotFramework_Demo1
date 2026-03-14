*** Settings ***
Library     SeleniumLibrary

***Variables***

${SIGNOUT_PAGE_HEADER_LABEL}    Signed Out


*** Keywords ***

Verify SignOut Page Loaded    
    Wait Until Page Contains   ${SIGNOUT_PAGE_HEADER_LABEL}