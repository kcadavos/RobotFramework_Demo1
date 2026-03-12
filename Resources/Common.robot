*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Open CRM application
    Open Browser     https://www.automationplayground.com/crm/    Chrome
    Maximize Browser Window
    Set Selenium Speed    .2s
    Set Selenium Timeout    10s
    Page Should Contain    Customers Are Priority One!
End Web Test
    Close Browser

Inserting Suite Test data
    Log    Inserting Test Data


Remove Suite Test data
    Log    Removing Test Data - cleanup