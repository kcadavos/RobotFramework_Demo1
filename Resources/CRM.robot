*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    ../Resources/PO/Topnav.robot
Resource   ../Resources/PO/Home.robot
Resource   ../Resources/PO/SignInPage.robot
Resource   ../Resources/PO/CustomersList.robot
Resource   ../Resources/PO/Customer.robot
Resource   ../Resources/PO/LogOutPage.robot

*** Variables ***
${Next_Button_Locator}    xpath://a[contains(text(),'Next')]
${button_enabled}    True


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

Iterate through current page customer names list
    @{CUSTOMERNAMESLIST}    Create List
    ${customerNamesCnt}=  Get Element Count    locator= xpath://*[@id='customers']/tbody/tr
    Log To Console    \n

    FOR     ${row_num}  IN RANGE     1  ${customerNamesCnt}+1      #locator starts with 0 but xpath starts with 1
        ${rowText}=    Get Text  xpath://*[@id='customers']/tbody/tr[${row_num}]
        Log To Console    ROW TEXT IS: ${rowText}
        Append To List    ${CUSTOMERNAMESLIST}    ${rowText}
    END
   
   Log To Console    ALL CUSTOMER DATA: ${CUSTOMERNAMESLIST}

Click Next Button 
        Click Link    ${Next_Button_Locator}   
    


    
    
Iterate through All customer table data
    VAR    ${iterationCnt}     0
    WHILE     ${button_enabled} 
        Iterate through current page customer names list

        #checks the class disabled on the LI instead of the a tag to determine if the next button is enabled or not
        ${class}=    Get Element Attribute    xpath://a[contains(text(),'Next')]/..    class
        ${button_enabled}=  Run Keyword And Return Status    Should Not Contain    ${class}    disabled

        #This fixes the flaky tests when the next button is not enabled it exits the the while loop and does not try to click the next button which is not enabled
        IF  not ${button_enabled}
            BREAK  
        END
    
            Click Next Button
    END
