*** Settings ***
Library  SeleniumLibrary

*** Variables ***


*** Test Cases ***
OpenCloseAmazonWebsite
    Open Browser    http://amazon.com    Chrome
    Sleep    5
    Close Browser

*** Keywords ***