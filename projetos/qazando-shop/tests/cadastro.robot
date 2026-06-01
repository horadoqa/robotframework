*** Settings ***
Resource    ../resources/keywords.resource
Resource    ../data/data.resource

*** Test Cases ***
Cenário: Cadastro de usuário
    [Tags]    Cadastro
    Open Browser To Register Page
    Cadastro de usuário
    Validar Cadastro
    Close Browser
