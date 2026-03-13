*** Settings ***
Library     SeleniumLibrary

*** Keywords ***
Load Page
    Click Link    Sign In

Verify Page
    Page Should Contain    Login