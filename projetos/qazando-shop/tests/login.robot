*** Settings ***
Resource    ../data/data.resource
Resource    ../resources/keywords.resource

*** Test Cases ***
Cenário: Login do usuário
    [Tags]    Login
    Open Browser To Login Page
    Login do usuário
    Validar Login
    Close Browser
