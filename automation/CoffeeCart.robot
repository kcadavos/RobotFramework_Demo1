*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${url}      https://coffee-cart.app 
${browser}     Chrome
${time}     10 seconds
${espresso_machiatoxpath}      xpath=//div[@data-test='Espresso_Macchiato']
${buttonxpath}    //*[@id="app"]/div[2]/div[1]/button
${allLinks}    
*** Test Cases ***
CoffeeCartWebsite
    Open Browser   ${url}   ${browser}
    Maximize browser window
    Set Selenium Implicit Wait  ${time}
    CountNumberOfCups
    AddCoffeeAndCheckout
    [Teardown]    Close Browser

*** Keywords ***
AddCoffeeAndCheckout
    Click Element    ${espresso_machiatoxpath}
    Click Button   class:pay
   

CountNumberOfCups
    ${allLinks}=     get element count  xpath=//div[@class="cup-body"]
    Log To Console  This is the Total number of cups in the page are ${allLinks}