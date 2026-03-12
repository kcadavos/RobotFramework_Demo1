*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
    
Sign in to CRM application
    Click Link    Sign In
    Page Should Contain    Login
    Input Text        id=email-id     admin@robotframeworktutorial.com
    Input Text    id=password    qwe
    Click Button    id=submit-id
    Page Should Contain   Our Happy Customers
    
Add New Customer
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


