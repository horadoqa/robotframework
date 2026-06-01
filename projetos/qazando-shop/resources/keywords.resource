*** Settings ***
Library    SeleniumLibrary
Library    String

*** Keywords ***
Open Browser To Register Page
    Open Browser    ${URL}    ${BROWSER}    
    Maximize Browser Window
    Wait Until Element Is Visible    id=user    10s

Open Browser To Login Page
    Open Browser    https://www.automationpratice.com.br/login    ${BROWSER}    
    Maximize Browser Window
    Wait Until Element Is Visible    id=user    10s

Cadastro de usuário
    Input Text    id=user        ${USERNAME}
    Input Text    id=email       ${EMAIL}
    Input Text    id=password    ${PASSWORD}
    Sleep     10s
    Click Button  id=btnRegister

Validar Cadastro
    Wait Until Element Is Visible    id=swal2-title    10s
    Element Text Should Be           id=swal2-title    Cadastro realizado!

Login do usuário
    Input Text    id=user        ${EMAIL}
    Input Text    id=password    ${PASSWORD}
    Sleep     30s
    Click Button  id=btnLogin

Validar Login
    Wait Until Element Is Visible    id=swal2-title    10s
    Element Text Should Be           id=swal2-title    Login realizado