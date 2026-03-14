*** Settings ***
Library     SeleniumLibrary

***Variables***
${HOME_HEADER_LABEL}     Customers Are Priority One!

*** Keywords ***
Navigate to 
    Open Browser   ${URL}       ${BROWSER}
    
Verify Page Loaded   
    Wait Until Page Contains       ${HOME_HEADER_LABEL} 
