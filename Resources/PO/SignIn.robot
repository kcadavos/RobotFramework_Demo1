*** Settings ***
Library     SeleniumLibrary

*** Keywords ***
Sign in to CRM application
    Click Link    Sign In
    Page Should Contain    Login
    Input Text        id=email-id     admin@robotframeworktutorial.com
    Input Text    id=password    qwe
    Click Button    id=submit-id
    Page Should Contain   Our Happy Customers
    