*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${CUSTOMERS_LIST_PAGE_HEADER_LABEL}    Our Happy Customers
${ADD_CUSTOMER_LINK}    New Customer
${CUSTOMER_ADDED_SUCCESS_LABEL}    Success! New customer added.

*** Keywords ***

Verify SignIn    
    Wait Until Page Contains   ${CUSTOMERS_LIST_PAGE_HEADER_LABEL}

Load Add Customer
    Click Link  ${ADD_CUSTOMER_LINK}

Verify Customer Added Successfully
    Wait Until Page Contains    ${CUSTOMER_ADDED_SUCCESS_LABEL}

