*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${url}      https://coffee-cart.app 
${browser}     Chrome
${time}     10 seconds
${espresso_machiatoxpath}      xpath=//div[@data-test='Espresso_Macchiato']
${buttonxpath}    //*[@id="app"]/div[2]/div[1]/button

*** Test Cases ***
CoffeeCartWebsite
    Open Browser   ${url}   ${browser}
    Maximize browser window
    set selenium Implicit Wait   ${time}
    AddCoffeeAndCheckout
    [Teardown]    Close Browser

*** Keywords ***
AddCoffeeAndCheckout
    Click Element    ${espresso_machiatoxpath}
    Click Button   class:pay