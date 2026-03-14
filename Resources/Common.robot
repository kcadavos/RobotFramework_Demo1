*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/PO/Home.robot

*** Keywords ***
Go to "Home"page
    Home.Navigate to
    Maximize Browser Window
    Set Selenium Speed    .2s
    Set Selenium Timeout    10s
    Home.Verify Page Loaded
End Web Test
    Close All Browsers

Inserting Suite Test data
    Log    Inserting Test Data


Remove Suite Test data
    Log    Removing Test Data - cleanup