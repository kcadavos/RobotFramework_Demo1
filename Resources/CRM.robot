*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/PO/SignInPage.robot

*** Keywords ***
Sign in to CRM application
    [Arguments]    ${USERNAME}    ${PASSWORD}
    SignInPage.Load Page
    SignInpage.Verify Page
    Input Text        id=email-id    ${USERNAME}
    Input Text    id=password       ${PASSWORD}     
    Click Button    id=submit-id
    Page Should Contain   Our Happy Customers
    
Add New Customer
    Click Link   New Customer
    Page Should Contain    Add Customer
    Enter Email
    Enter First Name
    Enter Last Name    
    Input Text    id=City    Maynila
    Select From List By Value    id=StateOrRegion    CA
    Select Radio Button    gender   male
    Select Checkbox    promos-name   
    Click Button   Submit
    Wait Until Page Contains    Success! New customer added.

Enter Email
     Input Text    id=EmailAddress    karen@gmail.com

Enter First Name
      Input Text     id=FirstName   Karen

Enter Last Name
     Input Text    id=LastName    Carter
