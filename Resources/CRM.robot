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
    [Arguments]    @{CUSTOMERINFO}
    Click Link   New Customer
    Page Should Contain    Add Customer
    Log    Customr Info: ${CUSTOMERINFO}[0], ${CUSTOMERINFO}[1]
    Enter Email     ${CUSTOMERINFO}[0]
    Enter First Name    ${CUSTOMERINFO}[1]
    Enter Last Name     ${CUSTOMERINFO}[2]   
    Input Text    id=City    ${CUSTOMERINFO}[3]
    Select From List By Value    id=StateOrRegion    ${CUSTOMERINFO}[4]
    Select Radio Button    gender   ${CUSTOMERINFO}[5]
    Select Checkbox    promos-name   
    Click Button   Submit
    Wait Until Page Contains    Success! New customer added.

Enter Email
    [Arguments]    ${email}
     Input Text    id=EmailAddress    ${email}

Enter First Name
    [Arguments]    ${firstName}    
      Input Text     id=FirstName   ${firstName}

Enter Last Name
    [Arguments]    ${lastName}
     Input Text    id=LastName    ${lastName}
