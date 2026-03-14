*** Settings ***
Library     SeleniumLibrary

*** Keywords ***
Verify Page Loaded
    Wait Until Page Contains  Add Customer

Enter "Email" Field
     Input Text    id=EmailAddress    ${CUSTOMERINFO}[0]

Enter "First Name" Field
      Input Text     id=FirstName   ${CUSTOMERINFO}[1]

Enter "Last Name" field
     Input Text    id=LastName    ${CUSTOMERINFO}[2]

Enter "City" field
    Input Text    id=City    ${CUSTOMERINFO}[3]

Select "State" from dropdown
    Select From List By Value    id=StateOrRegion    ${CUSTOMERINFO}[4]

Select "Gender" radio button
    Select Radio Button    gender   ${CUSTOMERINFO}[5]
 
 Check "promo" checkbox
    Select Checkbox    promos-name

Submit New Customer
    Click Button   Submit