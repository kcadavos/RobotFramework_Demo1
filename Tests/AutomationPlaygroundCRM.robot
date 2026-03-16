*** Settings ***
Documentation    This is the test suite for CRM application.
Resource   ../Resources/CRM.robot
Resource    ../Resources/common.robot
Suite Setup    Inserting Suite Test data
# Test Setup    Common.Open Application
# Test Teardown    Common.End Web Test
Suite Teardown    Remove Suite Test data


*** Variables ***
${BROWSER}         Chrome
${URL}             https://www.automationplayground.com/crm/
${USERNAME}        admin@robotframeworktutorial.com
${PASSWORD}        qwe
@{CUSTOMERINFO}    karen@gmail.com    karen    Cadavos   Maynila    CA    female
${CustomerNameCnt}    -1


*** Test Cases ***
# User Can Login
#     [Documentation]     This test case verifies user can login successfully
#     [Tags]    TC1000    SmokeTest    Login
#     Log    Test to Login starting
#     CRM.Go To Homepage
#     CRM.Sign in to CRM application    ${USERNAME}    ${PASSWORD}
# User Can Logout
#     [Documentation]     This test case verifies user can logout successfully
#     [Tags]    TC1000    SmokeTest    Login
#     Log    Test to Login starting
#     CRM.Go To Homepage
#     CRM.Sign in to CRM application    ${USERNAME}    ${PASSWORD}
#     CRM.Sign out of CRM application

User Can Add Customer
    [Documentation]    This test case verifies that a user can add a Customer
    [Tags]    TC1002    SmokeTest    AddCustomer 
    Log              Test Case to add customer starting
    CRM.Go To Homepage
    CRM.Sign in to CRM application    ${USERNAME}    ${PASSWORD}
    # CRM.Click Next Button
    CRM.Iterate through All customer table data
    # CRM.Add New Customer    @{CUSTOMERINFO}
    CRM.Sign out of CRM application
  
    
