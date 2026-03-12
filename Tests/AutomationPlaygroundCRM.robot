*** Settings ***
Documentation    This is the test suite for CRM application.
Resource   ../Resources/CRM.robot
Resource    ../Resources/common.robot
Suite Setup    Inserting Suite Test data
Test Setup    Open CRM application
Test Teardown    End Web Test
Suite Teardown    Remove Suite Test data


*** Variables ***

*** Test Cases ***
User Can Login
    [Documentation]     This test case verifies user can login successfully
    [Tags]    TC1000    SmokeTest    Login
    Log    Test to Login starting
    Sign in to CRM application


User Can Add Customer
    [Documentation]    This test case verifies that a user can add a Customer
    [Tags]    TC1002    SmokeTest    AddCustomer 
    Log              Test Case to add customer starting
    Sign in to CRM application
    Add New Customer
  
    
