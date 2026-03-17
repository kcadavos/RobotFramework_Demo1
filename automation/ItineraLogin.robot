*** Settings ***
Documentation    This is the test suite for Itinera Login functionality.
Library    SeleniumLibrary
Library    ../venv1/lib/python3.14/site-packages/robot/libraries/XML.py
Test Setup    Open the url
# Test Template     LoginItinera

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

Access Login
    ${user}=     Set Variable    ${CustomerList}[${UserToLogin}]
    Log To Console   ${user}[username]
    LoginItinera    ${user}

*** Keywords ***
LoginItinera
    [Arguments]     ${user}
        LoginOnly    ${user}[username]    ${user}[password]
        Verify Login Successful     ${user}
   
LoginOnly
    [Arguments]     ${username}    ${password}
        Maximize Browser Window
        Input Text     xpath:/html/body/div[2]/div/div/div/div/div[2]/div/div[2]/div[2]/div/div/div/div[1]/input      ${username}
        Input Text    xpath:/html/body/div[2]/div/div/div/div/div[2]/div/div[2]/div[2]/div/div/div/div[2]/input     ${password}
        Click Button    xpath:/html/body/div[2]/div/div/div/div/div[2]/div/div[2]/div[2]/div/div/div/div[3]/button
       
Open the url
    Open Browser    https://theitinera.app/LoginPage    Chrome


Verify Login Successful
    [Arguments]    ${user}
        Wait Until Element Is Visible    id:greetingname-desktop   10s
        ${userInUI}=  Get Text     id:greetingname-desktop
        # Log To Console      USER IN UI: ${userInUI}
        # Log To Console    ${user}[name]
        Should Be Equal    ${userInUI}   ${user}[name]


Verify Login Not Successful
         Page Should Not Contain    Hi Test User
