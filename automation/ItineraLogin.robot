*** Settings ***
Documentation    This is the test suite for Itinera Login functionality.
Library    SeleniumLibrary
Library    ../venv1/lib/python3.14/site-packages/robot/libraries/XML.py
Test Setup    Open the url
# Test Template     LoginItinera
Test Teardown    Close Browser

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

*** Test Cases ***
#                     username    password
# Valid username    ${CustomerList[${UserToLogin}][username]}    test123
Test All Users
    [Template]    LoginItinera
    ${User1}
    ${User2}



*** Keywords ***
Access Login  
    [Arguments]     ${UserToLogin}
    ${user}=     Set Variable    ${CustomerList}[${UserToLogin}]
    Log To Console   USERBEINGTESTED:${user}[username]
    LoginItinera    ${user}

LoginItinera
    [Arguments]     ${user}
        LoginOnly    ${user}[username]    ${user}[password]
        # Verify Login Successful     ${user}
   
LoginOnly
    [Arguments]     ${username}    ${password}
        Wait Until Element Is Visible    id:email-input    10s
        Input Text     id:email-input      ${username}
        Wait Until Element Is Visible    id:password-input   10s
        Input Text     id:password-input    ${password}
        Wait Until Element Is Enabled    id:submit-btn    10s
        Click Button   id:submit-btn
       
Open the url
    Open Browser    about:blank    Chrome
    Maximize Browser Window
    Go to    https://www.theitinera.app/LoginPage


Verify Login Successful
    [Arguments]    ${user}
        Wait Until Element Is Visible    id:greetingname-desktop   10s
        ${userInUI}=  Get Text     id:greetingname-desktop
        # Log To Console      USER IN UI: ${userInUI}
        # Log To Console    ${user}[name]
        Should Be Equal    ${userInUI}   ${user}[name]


Verify Login Not Successful
         Page Should Not Contain    Hi Test User
