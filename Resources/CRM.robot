*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/PO/Topnav.robot
Resource   ../Resources/PO/Home.robot
Resource   ../Resources/PO/SignInPage.robot
Resource   ../Resources/PO/CustomersList.robot
Resource   ../Resources/PO/Customer.robot
Resource   ../Resources/PO/LogOutPage.robot

*** Keywords ***
Go To Homepage
    Home.Navigate to
    Home.Verify Page Loaded
    
Sign in to CRM application
    [Arguments]    ${USERNAME}    ${PASSWORD}
    Topnav.Load SignIn
    Topnav.Verify SignIn Page Loaded
    SignInPage.Enter Email    ${USERNAME}
    SignInPage.Enter Password    ${PASSWORD}
    SignInPage.Click "Submit" button
    CustomersList.Verify SignIn
    
Add New Customer
    [Arguments]    @{CUSTOMERINFO}
    CustomersList.Load Add Customer
    Customer.Verify Page Loaded
    Customer.Enter "Email" Field
    Customer.Enter "First Name" Field
    Customer.Enter "Last Name" field
    Customer.Enter "City" field
    Customer.Select "State" from dropdown
    Customer.Select "Gender" radio button
    Customer.Check "promo" checkbox
    Customer.submit New Customer
    CustomersList.Verify Customer Added Successfully


Sign out of CRM application
    Topnav.Load SignOut
    LogOutPage.Verify SignOut Page Loaded