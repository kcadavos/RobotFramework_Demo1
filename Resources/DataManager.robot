*** Settings ***
Documentation    This resource file is used to get data from external files
Library    ../CustomLibs/CSVReader.py


*** Keywords ***
Get CSV Data   
    [Arguments]     ${FilePath}
    ${Data} =     Get CSV Data    ${FilePath}
    [Return]    ${Data}

