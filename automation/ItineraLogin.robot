*** Settings ***
Documentation    This is the test suite for Itinera Login functionality.
Library    SeleniumLibrary
Library    ../venv1/lib/python3.14/site-packages/robot/libraries/XML.py
# Test Setup    Open the url
# Test Template     LoginItinera
# Test Teardown    Close Browser

##to run
#robot -d results -v UserToLogin:User2  automation/ItineraLogin.robot

*** Variables ***
${url}    https://www.theitinera.app/LoginPage
${time}     10 seconds
${browser}    Chrome
${user}     validUser
${pass}    validPassword
${img_locator}     img[alt="Menu"]
${UserToLogin}    User1
&{User1}    username=kcadavos@gmail.com    password=123     name=Karen Two
&{User2}    username=karencadavos@gmail.com    password=123     name=Karen Anne
&{CustomerList}   User1=${User1}    User2=${User2}


#XPATH LOCATORS
${email_locator}         xpath=//div[@id="login-desktop"]//input[@id="email-input"]
${password_locator}      xpath=//div[@id="login-desktop"]//input[@id="password-input"]
${loginbtn_locator}      xpath=//div[@id="login-desktop"]//button[@id="login-btn"]


*** Test Cases ***
Test All Users1
    [Template]    LoginItinera
    ${User1}
    ${User2}

# Test All Users2
#     [Template]    LoginOnly
#     kcadavos@gmail.com      123     
#     karencadavos@gmail.com  123      



*** Keywords ***
Access Login  
    [Arguments]     ${UserToLogin}
    ${user}=     Set Variable    ${CustomerList}[${UserToLogin}]
    Log To Console   USERBEINGTESTED:${user}[username]
    LoginItinera    ${user}

LoginItinera
    [Arguments]     ${user}
    Open the url
    LoginOnly    ${user}[username]    ${user}[password]
    Verify Login Successful     ${user}
    Close Browser

LoginOnly
    [Arguments]     ${username}    ${password}
        Wait Until Element Is Visible    ${email_locator}    10s
        Input Text     ${email_locator}      ${username}
        
        Wait Until Element Is Visible    ${password_locator}     10s
        Input Text     ${password_locator}   ${password}
        Wait Until Element Is Enabled    ${loginbtn_locator}   10s
        Click Button   ${loginbtn_locator} 
       
Open the url
    Open Browser    about:blank    Chrome
    Maximize Browser Window
    Go to    https://www.theitinera.app/LoginPage


Verify Login Successful
    [Arguments]    ${user}
        Wait Until Element Is Visible    id:greetingname-desktop   10s
        ${userInUI}=  Get Text     id:greetingname-desktop

        Should Be Equal    ${userInUI}   ${user}[name]


Verify Login Not Successful
         Page Should Not Contain    Hi Test User
