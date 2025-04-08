*** Settings ***
Library    SeleniumLibrary
Variables    ../Locators/Locators.py
Variables    ../TestData/Testdata.py

*** Keywords ***
Verify Welcome Text is Visible
    Wait Until Page Contains    OrangeHRM    timeout=10
    Wait Until Page Contains   Dashboard    timeout=10
    

Logout
    Click Element    ${LogoutButton}
    Wait Until Element Is Visible    ${LogoutButton}    timeout=5
    Click Element    ${LogoutButton}
    Wait Until Element Is Visible    ${LoginUsernameInputBox}    timeout=5
