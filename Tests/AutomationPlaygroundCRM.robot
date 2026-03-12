*** Settings ***
Documentation    This is the test suite for CRM application.
Library    SeleniumLibrary

*** Variables ***

*** Test Cases ***
Should Be able to Add Customer
    [Documentation]    This test case verifies that a user can add a Customer
    [Tags]    TC1001    SmokeTest    AddCustomer
    
       
    Log              Test Case to add customer starting
    Open Browser     https://www.automationplayground.com/crm/    Chrome

    Maximize Browser Window
    Set Selenium Speed    .2s
    Set Selenium Timeout    10s
    
    Page Should Contain    Customers Are Priority One!
    Click Link    Sign In


    Page Should Contain    Login
    Input Text        id=email-id     admin@robotframeworktutorial.com
    Input Text    id=password    qwe
    Click Button    id=submit-id
    Page Should Contain   Our Happy Customers
    Click Link   New Customer

    Page Should Contain    Add Customer
    Input Text    id=EmailAddress    karen@gmail.com
    Input Text     id=FirstName   Karen
    Input Text    id=LastName    Carter
    Input Text    id=City    Maynila
    Select From List By Value    id=StateOrRegion    CA
    Select Radio Button    gender   male
    Select Checkbox    promos-name   
    Click Button   Submit
    Wait Until Page Contains    Success! New customer added.

    Sleep            3s
    Close Browser

*** Keywords ***