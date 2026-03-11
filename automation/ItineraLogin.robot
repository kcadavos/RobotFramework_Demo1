*** Settings ***
Documentation    This is the test suite for Itinera Login functionality.
Library    SeleniumLibrary
Test Setup    Open the url
Test Template     LoginItinera

*** Variables ***
${url}    https://www.theitinera.app/LoginPage
${time}     10 seconds
${browser}    Chrome
${user}     validUser
${pass}    validPassword
${img_locator}     img[alt="Menu"]

*** Test Cases ***
#                     username    password
Valid username    testitinera@gmail.com    test123


*** Keywords ***

LoginItinera
    [arguments]     ${username}    ${password}
        LoginOnly    ${username}    ${password}
        Verify Login Successful
   
LoginOnly
    [arguments]     ${username}    ${password}
        Maximize Browser Window
        Input Text     xpath=/html/body/div[2]/div/div/div/div/div[2]/div/div[2]/div[2]/div/div/div/div[1]/input      ${username}
        Input Text    xpath=/html/body/div[2]/div/div/div/div/div[2]/div/div[2]/div[2]/div/div/div/div[2]/input     ${password}
        Click Button    xpath=/html/body/div[2]/div/div/div/div/div[2]/div/div[2]/div[2]/div/div/div/div[3]/button
       
Open the url
    Open Browser    https://theitinera.app/LoginPage    Chrome


Verify Login Successful
        Set Selenium Implicit Wait    ${time}
         Page Should Contain    Hi Test User
Verify Login Not Successful
         Page Should Not Contain    Hi Test User
